package controladores;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.MappedByteBuffer;
import java.nio.channels.FileChannel;
import java.util.Iterator;
import java.util.List;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.DiskFileUpload;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import modelo.Imagen;
import modelo.Noticia;
import modelo.Productos;

 public class RegistrarNoticias extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet {


        protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            doPost(request, response);
        }

        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            PrintWriter out = response.getWriter();
            InputStream fis = null;
            String nom = null;

            Noticia n = new Noticia();
            n.setEstatus("a");
            n.setId(n.buscarNoticiasU()+1);
            RequestDispatcher rd = null;
            Imagen i = new Imagen();
            try {
                String ruta = getServletConfig().getServletContext().getRealPath("imagenes");
                if( ServletFileUpload.isMultipartContent( request ) )
                { 	FileItemFactory factory = new DiskFileItemFactory();
                    ServletFileUpload upload = new ServletFileUpload( factory );
                    List listUploadFiles = null;
                    FileItem item = null;
                    listUploadFiles = upload.parseRequest( request );
                    Iterator it = listUploadFiles.iterator();
                    while( it.hasNext() ){
                        item = ( FileItem ) it.next();
                        if( !item.isFormField() ){
                            if( item.getSize() > 0 ){
                                nom= item.getName();
                                fis = item.getInputStream();
                                Main.cargarImagen(fis,nom,"noticias");
                                i = new Imagen();
                                i.setRutaImagen(ruta+"\\"+ nom);
                                i.setIdImagen(0);
                                i.setPrincipal("p");
                            }
                        }
                        else
                        {	if (item.getFieldName().equals("nombreNot"))
                                n.setNombreNot(item.getString());
                            else if(item.getFieldName().equals("contenido"))
                                n.setContenido(item.getString());

                        }
                    }
                    if (n.insertarNoticias(n))
                    {	i.setIdNoticias(n.getId());
                        if (!i.insertarImagenN(i))
                            rd = request.getRequestDispatcher("respuestaAdmin.jsp?men=Error al insertar la imagen&proc=indexAdmin.jsp");
                        else
                            rd = request.getRequestDispatcher("respuestaAdmin.jsp?men=La noticia se insertó satisfactoriamente&proc=indexAdmin.jsp");
                    }
                    else
                    {	rd = request.getRequestDispatcher("respuestaAdmin.jsp?men=Hubo Errores al guardar la Noticia&proc=indexAdmin.jsp");
                    }
                }
                rd.forward(request, response);

            } catch (FileUploadException e) {
                e.printStackTrace();
            }

    }

}