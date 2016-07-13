package controladores;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import modelo.Imagen;
import modelo.Productos;

 public class RegistrarProductos extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet {
   static final long serialVersionUID = 1L;


	public RegistrarProductos() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		InputStream fis = null;
		String nom = null;
		String codV = "";
		Productos p = new Productos();
		p.setEstatus("a");
		p.setIdPro(p.buscarUltimoP()+1);
		RequestDispatcher rd = null;
		Imagen i;
		try {
			String ruta = getServletConfig().getServletContext().getRealPath("imagenes");
			if( ServletFileUpload.isMultipartContent( request ) )
			{ 	FileItemFactory factory = new DiskFileItemFactory();
				ServletFileUpload upload = new ServletFileUpload( factory );
				List listUploadFiles = null;
				FileItem item = null;
				listUploadFiles = upload.parseRequest( request );
				Iterator it = listUploadFiles.iterator();
				Vector vimg = new Vector();
				while( it.hasNext() ){
					item = ( FileItem ) it.next();
					if( !item.isFormField() ){
						if( item.getSize() > 0 ){
							nom= item.getName();
							 if (nom.lastIndexOf("/")>0)
				            	 nom  = nom.substring(nom.lastIndexOf("/")+1);
				             else if (nom.lastIndexOf("\\")>0)
				            	 nom = nom.substring(nom.lastIndexOf("\\")+1);
							fis = item.getInputStream();
							Main.cargarImagen(fis,ruta + "\\"+nom,"productos");
							i = new Imagen();
							i.setRutaImagen(ruta +"\\"+ nom);
							i.setIdImagen(0);
							i.setPrincipal("p");
							vimg.add(i);
						}
					}
					else
					{	if (item.getFieldName().equals("nombres"))
						{	p.setNombre(item.getString());
							p.setCodigoVerificacion(p.getNombre().substring(0,3) + p.getIdPro());
						}
						else if(item.getFieldName().equals("descripcion"))
							p.setDescripcion(item.getString());
						else if(item.getFieldName().equals("precioCliente"))
							p.setPrecioCliente(Float.parseFloat(item.getString()));
						else if(item.getFieldName().equals("precioMiembro"))
							p.setPrecioMiembro(Float.parseFloat(item.getString()));
						else if(item.getFieldName().equals("marca"))
							p.setMarca(item.getString());
						else if(item.getFieldName().equals("cantidad"))
							p.setCantidad(Integer.parseInt(item.getString()));
						else if(item.getFieldName().equals("color"))
							p.setColor(item.getString());
						else if(item.getFieldName().equals("idTp"))
							p.setIdTp(Integer.parseInt(item.getString()));

					}
				}
				if (p.insertarProductos(p))
				{	Iterator itv = vimg.iterator();
					while (itv.hasNext())
					{	i = (Imagen) itv.next();
						i.setIdProductos(p.getIdPro());
						i.insertarImagenP(i);
					}
					rd = request.getRequestDispatcher("respuestaAdmin.jsp?men=Se Insertó correctamente el Producto&proc=indexAdmin.jsp");
				}
				else
				{	rd = request.getRequestDispatcher("respuestaAdmin.jsp?men=Hubo Errores al guardar el Producto&proc=indexAdmin.jsp");
				}
			}
			rd.forward(request, response);

		} catch (FileUploadException e) {
			e.printStackTrace();
		}

	}
}