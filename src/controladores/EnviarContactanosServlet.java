package controladores;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import modelo.Correo;

/**
 * Servlet implementation class for Servlet: EnviarCorreoServlet
 *
 */
 public class EnviarContactanosServlet extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet {

	 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String n = request.getParameter("nombre");
		String a = request.getParameter("apellido");
		String r = request.getParameter("remitente");
		String u = request.getParameter("ubicacion");
		String t = request.getParameter("telefono");
		String c = request.getParameter("como");
		String as = request.getParameter("asunto");
		String m = request.getParameter("mensaje");
		response.sendRedirect("http://www.tucompraya.com/mandarCorreo.php?nombre="+n+"&apellido="+
				a+"&remitente="+r+"&ubicacion="+u+"&telefono="+t+"&como="+c+"&asunto="+as+"&mensaje="+m);

	}
}