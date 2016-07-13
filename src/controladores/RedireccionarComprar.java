package controladores;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import modelo.Productos;


 public class RedireccionarComprar extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet {

	 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Añadiendo cantidades a los  productos
		PrintWriter out = response.getWriter();
		HttpSession sesion = request.getSession(false);
		RequestDispatcher rd = null;
		Productos p = null;
		if (sesion != null)
		{	Vector carrito = (Vector) sesion.getAttribute("carrito");
			if (carrito != null)
			{	String[] cantidades = request.getParameterValues("cant");
				if (cantidades != null)
				{	for (int i=0;i<cantidades.length;i++)
					{	Iterator it = carrito.iterator();
						while (it.hasNext())
						{	p=(Productos) it.next();
							int c = Integer.parseInt(cantidades[i]);
							if (p.getCantidad() > c)
								p.setCantidadP(c);
							else
							{	p.setCantidadP(p.getCantidad());
							}
						}
					}
					//sesion.setAttribute("carrito", carrito);
					if (request.getParameter("fp").equals("c"))
						rd = request.getRequestDispatcher("registrarCompraTarjeta.jsp");
					else
						rd = request.getRequestDispatcher("RegistrarCompras");
					if (rd == null)
						rd = request.getRequestDispatcher("carrito.jsp");
				}
				else
					rd = request.getRequestDispatcher("respuesta.jsp?men=No hay cantidad para los productos del carrito&proc=carrito.jsp");
			}
			else
				rd = request.getRequestDispatcher("respuesta.jsp?men=No hay productos seleccionados no se puede procesar la compra&proc=carrito.jsp");
		}
		else
			rd = request.getRequestDispatcher("respuesta.jsp?men=No ha iniciado sesión no puede procesar la compra&proc=index.jsp");

		rd.forward(request, response);



	}
}