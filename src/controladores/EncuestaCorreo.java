package controladores;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import modelo.Cliente;


 public class EncuestaCorreo extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession sesion = request.getSession(false);
		String remitente = "Anónimo";
		if (sesion != null)
		{	Cliente cli = (Cliente) sesion.getAttribute("cliente");
			if (cli != null)
				remitente = cli.getCorreo();
		}

		String o = request.getParameter("contenido0");
		String co = request.getParameter("contenido1");
		String opc = request.getParameter("opcion0");
		String op = request.getParameter("opcion1");
		response.sendRedirect("http://www.tucompraya.com/mandarEncuesta.php?contenido0="+o+"&contenido1="+
				co+"&opcion0="+opc+"&opcion1="+op+"&remitente="+remitente);

	}
}