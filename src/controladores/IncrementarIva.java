package controladores;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modelo.Iva;

 public class IncrementarIva extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet {
   static final long serialVersionUID = 1L;

	public IncrementarIva() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Iva iva=new Iva();
		iva.setIva(Float.parseFloat(request.getParameter("iva")));

		if(iva.incrementarIva(iva)==1){

			String s="El IVA se incremento Exitosamente.<br><br><br><a href='indexAdmin.jsp' id='a' >Volver</a>";
			RequestDispatcher redireccion= request.getRequestDispatcher("respuestaAdmin.jsp?men="+s+"&proc=indexAdmin.jsp");
			redireccion.forward(request,response);

		}else{

			String s="Ha ocurrido un error, intente de nuevo haciendo<a href='subirIva.jsp' id='a' >click aqui</a>";
			RequestDispatcher redireccion= request.getRequestDispatcher("respuestaAdmin.jsp?men="+s+"&proc=indexAdmin.jsp");
			redireccion.forward(request,response);

		}


	}
}