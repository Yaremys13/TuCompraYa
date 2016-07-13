package controladores;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import modelo.Cliente;
import modelo.Membresia;

public class RegistrarMembresia extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet  {

	/**
	 *
	 */
	private static final long serialVersionUID = 1L;


	public RegistrarMembresia() {
		super();
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println("PASA");
		HttpSession sesion=request.getSession(false);
		Cliente cli= (Cliente)sesion.getAttribute("cliente");

		String numTarjeta= (String) request.getParameter("nTarjetas");

		Membresia men= new Membresia();
		men=men.buscarMembresia(cli.getIdCli());
		if(men==null){
			String cadena="Ha ocurrido un error al activar su membresía, intente de nuevo o comuníquese con el administrados del site.";
			RequestDispatcher redireccion= request.getRequestDispatcher("respuesta.jsp?men="+cadena);
			redireccion.forward(request,response);
		}else{
			//System.out.println("formilario "+numTarjeta);
			//System.out.println("membresia "+men.getNumeroTarjeta());
			if(men.getNumeroTarjeta().equals(numTarjeta)){
				//OJO SI NO ENTIENDEN PREGUNTAR...
				if(men.actualizarMembresia(cli.getIdCli(), "a") && cli.modificarEstatus(cli, "m")){
					sesion.setAttribute("cliente", cli.cargarCliente(cli.getCorreo()));
					String cadena="Felicitaciones por haber registrado su membresía, ahora disfrute de los beneficios otorgados.";
					RequestDispatcher redireccion= request.getRequestDispatcher("respuesta.jsp?men="+cadena+"&proc=indexAdmin.jsp");
					redireccion.forward(request,response);
				}
			}else{
				String cadena="El número ingresado no corresponde a su numero de tarjeta, verifique el código. De continuar con el error, comuníquese con el administrador del site.";
				RequestDispatcher redireccion= request.getRequestDispatcher("respuesta.jsp?men="+cadena+"&proc=indexAdmin.jsp");
				redireccion.forward(request,response);
			}

		}

	}


}
