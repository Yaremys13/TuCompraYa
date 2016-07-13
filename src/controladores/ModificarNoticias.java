package controladores;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modelo.Noticia;
import modelo.Productos;

 public class ModificarNoticias extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		RequestDispatcher rd = null;

		Noticia n= new Noticia();

		n.setId(Integer.parseInt(request.getParameter("id")));
		n.setNombreNot(request.getParameter("nombreNot"));
		n.setContenido(request.getParameter("contenido"));
		n.setEstatus(request.getParameter("estatus"));

		 if (n.modificarNoticias(n))
		 {	rd = request.getRequestDispatcher("respuestaAdmin.jsp?men=La noticia se modificó Satisfactoriamente&proc=indexAdmin.jsp");
		 } else
		 {	rd = request.getRequestDispatcher("respuestaAdmin.jsp?men=Ha ocurrido un error al modificar la noticia&proc=indexAdmin.jsp");

		 }
		 rd.forward(request,response);

	}
}