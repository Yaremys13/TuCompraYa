package controladores;

import java.awt.Image;
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

import modelo.Cliente;
import modelo.Imagen;
import modelo.Productos;

 public class ModificarProductos extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet {
   static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		RequestDispatcher rd = null;

		Productos p= new Productos();



		PrintWriter out = response.getWriter();
		InputStream fis = null;
		String nom = null;
		String codV = "";
		Vector vimg = null;
		Imagen i;
			try {
				if( ServletFileUpload.isMultipartContent( request ) )
				{ 	FileItemFactory factory = new DiskFileItemFactory();
					ServletFileUpload upload = new ServletFileUpload( factory );
					List listUploadFiles = null;
					FileItem item = null;
					listUploadFiles = upload.parseRequest( request );
					Iterator it = listUploadFiles.iterator();
					vimg = new Vector();
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
								Main.cargarImagen(fis,nom,"productos");
								i = new Imagen();
								i.setRutaImagen("http://www.tucompraya.com/productos/"+ nom);
								vimg.add(i);
							}
							else
								vimg.add(null);

						}
						else
						{	if (item.getFieldName().equals("nombres"))
								p.setNombre(item.getString());
							else if (item.getFieldName().equals("codigoVerificacion"))
								p.setCodigoVerificacion(item.getString());
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
				}
			} catch (NumberFormatException e) {
				e.printStackTrace();
			} catch (FileUploadException e) {
				e.printStackTrace();
			}
		 int ban = 0;
		 if (p.modificarProductos(p))
		 {	if (vimg != null)
		 	{	Iterator it = vimg.iterator();
		 		p = p.buscarProducto(p.getCodigoVerificacion());
		 		if (p != null)
		 		{	while (it.hasNext())
			 		{	Imagen im = (Imagen) it.next();

			 		if (im != null){
			 			int id;
			 			if (p.getImagenes().size() > ban)
			 			{	id = ((Imagen) p.getImagenes().elementAt(ban)).getIdImagen();
			 				im.setIdImagen(id);

				 			if (im.modificarImagenP(im))
				 				rd = request.getRequestDispatcher("respuestaAdmin.jsp?men=El producto se modificó satisfactoriamente&proc=indexAdmin.jsp");
				 			else
				 			{	rd = request.getRequestDispatcher("respuestaAdmin.jsp?men=Ha ocurrido un error al modificar las imágenes del producto&proc=indexAdmin.jsp");
				 				System.out.println(ban);
				 				break;
				 			}
			 			}
				 		else
				 		{	im.setIdImagen(0);
				 			im.setPrincipal("p");
				 			im.setIdProductos(p.getIdPro());
				 			if (im.insertarImagenP(im))
				 				rd = request.getRequestDispatcher("respuestaAdmin.jsp?men=El producto se modificó satisfactoriamente&proc=indexAdmin.jsp");
				 			else
				 			{	rd = request.getRequestDispatcher("respuestaAdmin.jsp?men=Ha ocurrido un error al modificar las imágenes del producto&proc=indexAdmin.jsp");
				 				System.out.println(ban);
				 				break;
				 			}
				 		}
			 		}
				 		ban++;
			 		}
		 		}
		 	}
		 	else
		 		rd = request.getRequestDispatcher("respuestaAdmin.jsp?men=El producto se modificó satisfactoriamente&proc=indexAdmin.jsp");

		 } else
		 {	rd = request.getRequestDispatcher("respuestaAdmin.jsp?men=Ha ocurrido un error al modificar el producto&proc=indexAdmin.jsp");

		 }
		 rd.forward(request, response);

	}
}