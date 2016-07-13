package controladores;

import java.io.IOException;
import java.util.Iterator;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import modelo.Productos;

/**
 * Servlet implementation class for Servlet: EliminarProductoCarrito
 *
 */
 public class EliminarProductoCarrito extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession sesion = request.getSession(false);
		String[] codV = request.getParameterValues("eliminar");
		RequestDispatcher rd = null;
		Productos p = null;
		if (sesion != null)
		{	Vector carrito = (Vector) sesion.getAttribute("carrito");
			if (carrito != null)
			{	if (codV != null)
				{	for (int i=0;i<codV.length;i++)
					{	Iterator it = carrito.iterator();
						while (it.hasNext())
						{	p=(Productos) it.next();
							if(p.getCodigoVerificacion().equals(codV[i]))
							{	it.remove();
							}
						}
					}
				}
				sesion.setAttribute("carrito", carrito);
			}
			rd = request.getRequestDispatcher("carrito.jsp");
		}
		else
		{	rd = request.getRequestDispatcher("respuesta.jsp?men=No ha iniciado sesión&proc=index.jsp");
		}
		rd.forward(request, response);
	}
}