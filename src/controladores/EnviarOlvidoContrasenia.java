package controladores;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modelo.Cliente;


 public class EnviarOlvidoContrasenia extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet {
	 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			doPost(request, response);
		}


		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

			Cliente cli = new Cliente().cargarCliente(request.getParameter("correo"));
			if (cli != null)
				response.sendRedirect("http://www.tucompraya.com/mandarOlvidoContrasenia.php?usuario="+cli.getCorreo()+"&contrasenia="+cli.getClave());
			else
			{	RequestDispatcher rd = request.getRequestDispatcher("respuesta.jsp?men=No existe el usuario que desea consultar&proc=index.jsp");
				rd.forward(request, response);
			}
		}
}