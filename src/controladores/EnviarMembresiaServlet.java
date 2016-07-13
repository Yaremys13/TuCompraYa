package controladores;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import modelo.Cliente;
import modelo.Telefono;

 public class EnviarMembresiaServlet extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession sesion = request.getSession(false);
		RequestDispatcher rd = null;
		if (sesion != null)
		{	Cliente c = (Cliente) sesion.getAttribute("cliente");
			if (c != null)
			{	Telefono t = new Telefono();
				Vector tlfs = t.buscarTelefonoCliente(c.getIdCli());
				if (tlfs != null) t = (Telefono) tlfs.elementAt(0);
				else t.setNumeroTelefono("No registró");
				String remitente = c.getCorreo();
				response.sendRedirect("http://www.tucompraya.com/mandarMembresia.php?nombre="+c.getNombre()+
						"&apellido="+c.getApellido()+"&cedula="+c.getCedula()+"&direccion="+c.getDireccion()+
						"&telefono="+t.getNumeroTelefono()+"&remitente="+remitente);


			}
			else
				rd = request.getRequestDispatcher("respuesta.jsp?men=No ha iniciado sesión&proc=index.jsp");
		}
		else
			rd = request.getRequestDispatcher("respuesta.jsp?men=No ha iniciado sesión&proc=index.jsp");

	}
}