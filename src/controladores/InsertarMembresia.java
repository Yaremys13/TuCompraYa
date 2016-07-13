package controladores;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modelo.Cliente;
import modelo.Membresia;

/*
  Servlet implementation class for Servlet: InsertarMembresia
 */
 public class InsertarMembresia extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet {
   static final long serialVersionUID = 1L;


	public InsertarMembresia() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Membresia men=new Membresia();
		men.setNumeroTarjeta(request.getParameter("nroTarjeta"));
		men.setIdCli( Integer.parseInt(request.getParameter("idCli")));
		men.setEstatus("i");


		if(men.insertarMembresia(men,request.getParameter("correo"))){
			Cliente c = new Cliente().cargarCliente(Integer.parseInt(request.getParameter("idCli")));
			response.sendRedirect("http://www.tucompraya.com/mandarNroMembresia.php?remitente="+c.getCorreo()+"&nroMembresia="+men.getNumeroTarjeta());

		}else{
			String cadena="Ha ocurrido un error, por favor haga <a href='buscarCliMem.jsp' id='a'>click aqui</a> e intente de nuevo";
			RequestDispatcher redireccion= request.getRequestDispatcher("respuestaAdmin.jsp?&men="+cadena+"&proc=indexAdmin.jsp");
			redireccion.forward(request,response);
		}




	}
}