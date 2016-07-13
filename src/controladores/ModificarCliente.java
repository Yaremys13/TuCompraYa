package controladores;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modelo.Cliente;
import modelo.Telefono;


 public class ModificarCliente extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet {
   static final long serialVersionUID = 1L;



	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		RequestDispatcher rd = null;

		Cliente c= new Cliente();
		c.setNombre(request.getParameter("nombres"));
		c.setApellido(request.getParameter("apellidos"));
		c.setCedula(request.getParameter("ci"));
		c.setCorreo(request.getParameter("correo"));
		c.setDireccion(request.getParameter("direccion"));
		c.setClave(request.getParameter("contrasenia"));
		c.setValidacion(request.getParameter("validacion"));

		 if (c.modificarCliente(c))
		 {
			 c=c.cargarCliente(request.getParameter("correo"));

				if(request.getParameter("telefonos")!=null){
					Telefono t=new Telefono();
					t.setNumeroTelefono(request.getParameter("telefonos"));
					t.setIdCli(c.getIdCli());
					System.out.println(request.getParameter("telefono0"));
					t.setIdTlf(Integer.parseInt(request.getParameter("telefono0")));
					t.modificarTelefono(t);
				}

				if(request.getParameter("telefonos2")!=null){
					Telefono t=new Telefono();
					t.setNumeroTelefono(request.getParameter("telefonos2"));
					t.setIdTlf(Integer.parseInt(request.getParameter("telefono1")));
					t.setIdCli(c.getIdCli());
					t.modificarTelefono(t);
				}
				if(request.getParameter("telefonos3")!=null){
					Telefono t=new Telefono();
					t.setNumeroTelefono(request.getParameter("telefonos3"));
					t.setIdTlf(Integer.parseInt(request.getParameter("telefono2")));
					t.setIdCli(c.getIdCli());
					t.modificarTelefono(t);
				}
			 rd = request.getRequestDispatcher("respuesta.jsp?men=Usted ha Modificado Satisfactoriamente su datos&proc=index.jsp");
		 } else
		 {
			 rd = request.getRequestDispatcher("respuesta.jsp?men=Ha ocurrido un error al Modificar&proc=index.jsp");
		 }

		 rd.forward(request, response);



	}
}