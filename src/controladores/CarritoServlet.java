package controladores;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import modelo.Cliente;
import modelo.Productos;


 public class CarritoServlet extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession sesion = request.getSession(false);
		PrintWriter out = response.getWriter();
		RequestDispatcher rd = null;
		if (sesion != null)
		{	Vector pss = (Vector) sesion.getAttribute("carrito");
			if (pss == null)
			{  	pss = new Vector();
				sesion.setAttribute("carrito", pss);
			}
			String ps = request.getParameter("producto");
			if (ps != null)
			{	Productos p = new Productos().buscarProducto(ps);
				if (p!=null)
				{	Cliente c = (Cliente) sesion.getAttribute("cliente");
					if (c != null)
					{	pss.add(p);
						sesion.setAttribute("carrito",pss);
						rd = request.getRequestDispatcher("carrito.jsp");
					}
					else
						rd = request.getRequestDispatcher("respuesta.jsp?men=No hay sesión iniciada&proc=galeriaProductos.jsp");
				}
				else
				{	rd = request.getRequestDispatcher("respuesta.jsp?men=No se encuentra el producto&proc=galeriaProductos.jsp");

				}
			}
			else
			{
				rd = request.getRequestDispatcher("respuesta.jsp?men=No seleccionó ningún producto&proc=galeriaProductos.jsp");
			}
		}
		else
		{	rd = request.getRequestDispatcher("respuesta.jsp?men=No inicio sesión&proc=index.jsp");
		}
		rd.forward(request, response);

	}
}