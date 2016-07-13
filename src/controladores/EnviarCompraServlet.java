package controladores;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import modelo.Cliente;


 public class EnviarCompraServlet extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession sesion = request.getSession(false);
		RequestDispatcher rd = null;
		if (sesion != null)
		{	String idCompra = ((Integer)sesion.getAttribute("idCompra")).toString();
			if (idCompra != null)
			{	Cliente c = (Cliente) sesion.getAttribute("cliente");
				if (c != null)
				{	String remitente = c.getCorreo();
					if (request.getParameter("fp").equals("c"))
					{	String texto = "0";
						response.sendRedirect("http://www.tucompraya.com/mandarCompra.php?texto="+texto+"&remitente="+remitente+
							"&idCompra="+idCompra);
					}
					else
					{	String texto = "1";
						response.sendRedirect("http://www.tucompraya.com/mandarCompra.php?texto="+texto+"&remitente="+remitente+"&idCompra="+idCompra);
					}
				}
				else
					rd = request.getRequestDispatcher("respuesta.jsp?men=No ha iniciado sesión&proc=index.jsp");
			}
			else
				rd = request.getRequestDispatcher("respuesta.jsp?men=No ha seleccionado la compra&proc=index.jsp");
		}
		else
			rd = request.getRequestDispatcher("respuesta.jsp?men=No ha iniciado sesión&proc=index.jsp");

	}
}