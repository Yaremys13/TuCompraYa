package controladores;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modelo.Cliente;
import modelo.Telefono;


 public class RegistrarCliente extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet {
   static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter salida= response.getWriter();

		Cliente c= new Cliente();
		c.setNombre(request.getParameter("nombres"));
		c.setApellido(request.getParameter("apellidos"));
		c.setCedula(request.getParameter("ci"));
		c.setCorreo(request.getParameter("correo"));
		c.setDireccion(request.getParameter("direccion"));
		c.setClave(request.getParameter("clave"));
		c.setValidacion("LL");

		c.setEstatus("a");

		if(c.insertarUsuario(c)){

			c=c.cargarCliente(request.getParameter("correo"));

			if(request.getParameter("telefonos")!=null){
				Telefono t=new Telefono();
				t.setNumeroTelefono(request.getParameter("telefonos"));
				t.setIdCli(c.getIdCli());
				t.insertarTelefono(t);
			}

			if(request.getParameter("telefonos2")!=null){
				Telefono t=new Telefono();
				t.setNumeroTelefono(request.getParameter("telefonos2"));
				t.setIdCli(c.getIdCli());
				t.insertarTelefono(t);
			}
			if(request.getParameter("telefonos3")!=null){
				Telefono t=new Telefono();
				t.setNumeroTelefono(request.getParameter("telefonos3"));
				t.setIdCli(c.getIdCli());
				t.insertarTelefono(t);
			}

			RequestDispatcher redireccion= request.getRequestDispatcher("respuesta.jsp?men=****Usted se ha registrado exitosamente****&proc=index.jsp");
			redireccion.forward(request,response);
		}else{
			RequestDispatcher redireccion= request.getRequestDispatcher("respuesta.jsp?men=Ha ocurrido un error, intente de nuevo&proc=index.jsp");
			redireccion.forward(request,response);
		}
	}
}