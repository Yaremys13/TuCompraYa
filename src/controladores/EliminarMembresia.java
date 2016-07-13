package controladores;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modelo.Cliente;
import modelo.Membresia;

/**
 * Servlet implementation class for Servlet: eliminarMembresia
 *
 */
 public class EliminarMembresia extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet {
   static final long serialVersionUID = 1L;

    /* (non-Java-doc)
	 * @see javax.servlet.http.HttpServlet#HttpServlet()
	 */
	public EliminarMembresia() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Membresia men= new Membresia();
		Cliente cli= new Cliente();
		cli=cli.cargarCliente(request.getParameter("correo"));
		if(men.actualizarMembresia(Integer.parseInt(request.getParameter("idCli")), "e") && cli.modificarEstatus(cli, "a")){


			String cadena="La Membresía ha sido eliminada exitosamente.<br><br><br><a href='indexAdmin.jsp' id='a' >Volver</a>";
			RequestDispatcher redireccion= request.getRequestDispatcher("respuestaAdmin.jsp?men="+cadena+"&proc=indexAdmin.jsp");
			redireccion.forward(request,response);
		}else{
			String cadena="Ha ocurrido un error, intente de nuevo haciendo <a href='buscarCliMem.jsp'>click aqui</a>.";
			RequestDispatcher redireccion= request.getRequestDispatcher("mensajeRespuestaAdmin.jsp?men="+cadena+"&proc=indexAdmin.jsp");
			redireccion.forward(request,response);
		}
	}
}