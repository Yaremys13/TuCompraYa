package controladores;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.Calendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modelo.Cliente;
import modelo.Encuesta;
import modelo.Productos;

 public class RegistrarEncuesta extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet {
   static final long serialVersionUID = 1L;


	public RegistrarEncuesta() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		PrintWriter salida= response.getWriter();

		Encuesta e= new Encuesta();

		e.setIdPregunta(0);
		e.setContenido(request.getParameter("contenido"));
		e.setOpcion1(request.getParameter("opcion1"));
		e.setOpcion2(request.getParameter("opcion2"));
		e.setOpcion3(request.getParameter("opcion3"));
		e.setOpcion4(request.getParameter("opcion4"));
		e.setFechaSubida(new Date(Calendar.getInstance().get(Calendar.YEAR)-1900,Calendar.getInstance().get(Calendar.MONTH),Calendar.getInstance().get(Calendar.DATE)));
		e.setEstatus("a");
		System.out.println(e.getOpcion1());

		if(e.insertarEncuesta(e)){
			String s="Usted ha registrado su encuesta exitosamente¡¡¡¡¡<br><br><br><a href='indexAdmin.jsp' id='a' >Volver</a>";
			RequestDispatcher rd= request.getRequestDispatcher("respuestaAdmin.jsp?men="+s+"&proc=indexAdmin.jsp");
			rd.forward(request, response);
		}else {
			String s="<font class = 'letraAzul'>Ha ocurrido un Error, haga <a href='registrarEncuesta.jsp' class = 'letraAzul'> click aqui</a> para intentar de nuevo¡¡¡¡¡</font>";
			RequestDispatcher rd= request.getRequestDispatcher("respuestaAdmin.jsp?men="+s+"&proc=indexAdmin.jsp");
			rd.forward(request, response);
		}
	}
}