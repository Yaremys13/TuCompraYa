package controladores;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import modelo.Cliente;
import modelo.UsuarioAd;


 public class InicioSesionAdmin extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet {
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter p= response.getWriter();
		String correo=(String) request.getParameter("login");
		String clave=(String) request.getParameter("clave");
		RequestDispatcher redireccion= null;
		UsuarioAd uad=new UsuarioAd();
		uad=uad.iniciarSesion(correo, clave);
		if(uad==null){
			HttpSession sesion= request.getSession(true);
			sesion.setAttribute("usuarioAd", null);
			//sesion.setAttribute("valida", new Integer(0));
			redireccion = request.getRequestDispatcher("respuestaAdmin.jsp?men=Usuario inválido intente de nuevo&proc=indexAdmin.jsp");


		}else{
			HttpSession sesion= request.getSession(true);
			sesion.setAttribute("usuarioAd", uad);
			//sesion.setAttribute("valida", new Integer(0));
			//System.out.println("crea la sesion "+sesion.getAttribute("cliente"));
			redireccion = request.getRequestDispatcher("indexAdmin.jsp");
		}


		redireccion.forward(request,response);
	}

}