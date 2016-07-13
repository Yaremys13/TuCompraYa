package controladores;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import modelo.Cliente;


 public class InicioSesion extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet {
   static final long serialVersionUID = 1L;


	public InicioSesion() {
		super();
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String correo=(String) request.getParameter("login");
		String clave=(String) request.getParameter("clave");

		Cliente cli=new Cliente();
		cli=cli.iniciarSesion(correo, clave);
		if(cli==null){
			HttpSession sesion= request.getSession(true);
			sesion.setAttribute("cliente", null);
			sesion.setAttribute("valida", new Integer(0));

		}else{
			HttpSession sesion= request.getSession(true);
			sesion.setAttribute("cliente", cli);
			sesion.setAttribute("valida", new Integer(0));
			//System.out.println("crea la sesion "+sesion.getAttribute("cliente"));

		}

		RequestDispatcher redireccion= request.getRequestDispatcher("index.jsp");
		redireccion.forward(request,response);
	}
}