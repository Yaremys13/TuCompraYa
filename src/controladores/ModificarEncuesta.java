package controladores;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modelo.Cliente;
import modelo.Encuesta;
import modelo.Productos;

 public class ModificarEncuesta extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet {
   static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		PrintWriter salida= response.getWriter();

		Encuesta e= new Encuesta();

		e.setIdPregunta(Integer.parseInt(request.getParameter("idPregunta")));
		e.setContenido(request.getParameter("contenido"));
		e.setOpcion1(request.getParameter("opcion1"));
		e.setOpcion2(request.getParameter("opcion2"));
		e.setOpcion3(request.getParameter("opcion3"));
		e.setOpcion4(request.getParameter("opcion4"));

		if(e.modificarEncuesta(e)){
			String cadena="Usted ha modificado su encuesta exitosamente¡¡¡¡¡<br><br><br><a href='indexAdmin.jsp' id='a' >Volver</a>";
			RequestDispatcher rd= request.getRequestDispatcher("respuestaAdmin.jsp?men="+cadena+"&proc=indexAdmin.jsp");
			rd.forward(request, response);
		}else {
			String cadena="Ha ocurrido un Error, haga <a href='modificarEncuesta.jsp' id='a'> click aqui</a> para intentar de nuevo¡¡¡¡¡";
			RequestDispatcher rd= request.getRequestDispatcher("respuestaAdmin.jsp?men="+cadena+"&proc=indexAdmin.jsp");
			rd.forward(request, response);
		}
	}
}