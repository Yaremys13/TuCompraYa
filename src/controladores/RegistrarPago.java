package controladores;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import modelo.Cliente;
import modelo.Compra;


 public class RegistrarPago extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = null;
		HttpSession sesion = request.getSession(false);
		if (sesion != null)
		{	Cliente cli = (Cliente) sesion.getAttribute("cliente");
			if (cli != null)
			{	Compra c = new Compra();
				c = c.cargarCompra(Integer.parseInt(request.getParameter("idCompra")));
				if (c != null)
				{	c.setNroVoucher(request.getParameter("nroVoucher"));
					c.setBanco(request.getParameter("banco"));
					c.setReceptor(request.getParameter("receptor"));
					c.setUrbTC(request.getParameter("urb"));
					c.setCalleTC(request.getParameter("calle"));
					c.setNroCTC(request.getParameter("nro"));
					c.setCiuTC(request.getParameter("ciudad"));
					c.setEstTC(request.getParameter("estado"));
					c.setTlfTC(request.getParameter("telefono"));
					c.setCelTC(request.getParameter("celular"));
					c.setEstatus("c");
					if (c.actualizarCompra(c)){}
						response.sendRedirect("http://www.tucompraya.com/mandarRecepcionPago.php?idCompra="+c.getIdCompra()+"&remitente="+cli.getCorreo());
				}
				else
				{	rd = request.getRequestDispatcher("respuestaAdmin.jsp?men=No se pudo procesar la compra&proc=index.jsp");
					rd.forward(request, response);

				}
			}
			else
			{	rd = request.getRequestDispatcher("respuestaAdmin.jsp?men=No ha iniciado sesión&proc=index.jsp");
				rd.forward(request, response);
			}
		}
		else
		{	rd = request.getRequestDispatcher("respuesta.jsp?men=No ha iniciado sesión&proc=index.jsp");
			rd.forward(request, response);
		}

	}
}