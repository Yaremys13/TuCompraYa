package controladores;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import modelo.Compra;
import modelo.UsuarioAd;

 public class EnviarConfirmacionPago extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession sesion = request.getSession(false);
		if (sesion != null)
		{	UsuarioAd uad = (UsuarioAd) sesion.getAttribute("usuarioAd");
			if (uad != null)
			{	Compra c = new Compra();
				String idCompra = request.getParameter("idCompra");
				String remitente = request.getParameter("remitente");
				if (c.cambiarEstatus("f", Integer.parseInt(request.getParameter("idCompra"))))
				{	response.sendRedirect("http://www.tucompraya.com/mandarConfirmacionPago.php?idCompra="+idCompra+"&remitente="+remitente);
				}
				else
				{	RequestDispatcher rd = request.getRequestDispatcher("respuesta.jsp?men=No se pudo finalizar la compra&proc=indexAdmin.jsp");
					rd.forward(request, response);
				}
			}
			else
			{	RequestDispatcher rd = request.getRequestDispatcher("respuesta.jsp?men=Debe iniciar sesión como Administrador&proc=indexAdmin.jsp");
				rd.forward(request, response);
			}
		}
		else
		{	RequestDispatcher rd = request.getRequestDispatcher("respuesta.jsp?men=No hay sesión iniciada&proc=indexAdmin.jsp");
			rd.forward(request, response);
		}

	}
}