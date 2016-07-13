package controladores;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RedireccionarServlet extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String opcion = request.getParameter("valor");
		RequestDispatcher rd = null;
		if (opcion.equalsIgnoreCase("Categoría"))
			rd = request.getRequestDispatcher("menuCategoria.jsp");
		else if (opcion.equalsIgnoreCase("Clientes"))
			rd = request.getRequestDispatcher("eliminarCliente.jsp");
		else if (opcion.equalsIgnoreCase("Encuestas"))
			rd = request.getRequestDispatcher("menuEncuesta.jsp");
		else if (opcion.equalsIgnoreCase("IVA"))
			rd = request.getRequestDispatcher("subirIva.jsp");
		else if (opcion.equalsIgnoreCase("Membresía"))
			rd = request.getRequestDispatcher("buscarCliMem.jsp");
		else if (opcion.equalsIgnoreCase("Noticias"))
			rd = request.getRequestDispatcher("menuNoticia.jsp");
		else if (opcion.equalsIgnoreCase("Pagos"))
			rd = request.getRequestDispatcher("verComprasPendientes.jsp");
		else
			rd = request.getRequestDispatcher("menuProducto.jsp");
		rd.forward(request, response);
	}
}