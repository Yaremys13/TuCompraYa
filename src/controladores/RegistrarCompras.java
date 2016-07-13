package controladores;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.Calendar;
import java.util.Iterator;
import java.util.Vector;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import modelo.Cliente;
import modelo.Compra;
import modelo.DetalleCompra;
import modelo.Noticia;
import modelo.Productos;

 public class RegistrarCompras extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet {

	public RegistrarCompras() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = null;
		HttpSession sesion = request.getSession();
		if (sesion != null)
		{	Cliente cli = (Cliente) sesion.getAttribute("cliente");
			if (cli != null)
			{	Compra c= new Compra();
				int id = c.buscarComprasU()+1;
				c.setIdCompra(id++);
				c.setIdCli(cli.getIdCli());
				c.setBanco(request.getParameter("banco"));
				c.setFechaCompra(new Date(Calendar.getInstance().get(Calendar.YEAR)-1900,Calendar.getInstance().get(Calendar.MONTH),Calendar.getInstance().get(Calendar.DATE)));
				c.setFormaPago(request.getParameter("fp"));
				c.setNroVoucher(request.getParameter("nroVoucher"));

				if (c.getFormaPago().equalsIgnoreCase("c"))
				{	c.setNombreTC(request.getParameter("nombreC"));
					c.setNroTC(request.getParameter("digitosT")+request.getParameter("digitosT1")+request.getParameter("digitosT2")
							+request.getParameter("digitosT3"));
					System.out.println(request.getParameter("mes")+"/"+request.getParameter("anio") + "FECHA DE VENCIMIENTO");
					c.setFvTC(request.getParameter("mes")+"/"+request.getParameter("anio"));
					c.setTipoTC(request.getParameter("tTarjeta"));
					c.setCodSTC(request.getParameter("codigoS"));
					c.setReceptor(request.getParameter("receptor"));
					c.setUrbTC(request.getParameter("urb"));
					c.setCalleTC(request.getParameter("calle"));
					c.setNroCTC(request.getParameter("nro"));
					c.setCiuTC(request.getParameter("ciudad"));
					c.setEstTC(request.getParameter("estado"));
					c.setTlfTC(request.getParameter("telefono"));
					c.setCelTC(request.getParameter("celular"));
					c.setEstatus("c");
				}
				else
				{	c.setEstatus("p");

				}
				if(c.insertarCompras(c))
				{	Vector carrito = (Vector) sesion.getAttribute("carrito");
					if (carrito != null)
					{	DetalleCompra dc = new DetalleCompra();
						Productos p = null;
						Iterator it = carrito.iterator();
						while (it.hasNext())
						{	p = (Productos) it.next();
							dc.setIdCompra(c.getIdCompra());
							dc.setIdProducto(p.getIdPro());
							dc.setCant(p.getCantidadP());
							if (cli.getEstatus().equals("m"))
								dc.setPrecioPro(p.getPrecioMiembro());
							else
								dc.setPrecioPro(p.getPrecioCliente());
							if (dc.registrarDetalleCompra(dc))
							{	sesion.setAttribute("carrito", null);
								if (p.vender(p.getCantidadP()))
								{	sesion.setAttribute("idCompra", new Integer(c.getIdCompra()));
									rd = request.getRequestDispatcher("EnviarCompraServlet");
								}
								else
									rd = request.getRequestDispatcher("respuesta.jsp?men=Hubo problemas al registrar la compra&proc=index.jsp");
							}
							else
								rd = request.getRequestDispatcher("respuesta.jsp?men=Hubo problemas al registrar la compra&proc=index.jsp");
						}
					}
					else
						rd = request.getRequestDispatcher("respuesta.jsp?men=No hay productos seleccionados para comprar&proc=index.jsp");
				}
				else
					rd = request.getRequestDispatcher("respuesta.jsp?men=Error en el registro de la compra&proc=carrito.jsp");
			}
			else
				rd = request.getRequestDispatcher("respuesta.jsp?men=No ha iniciado sesion no puede procesar la compra&proc=index.jsp");
		}
		else
			rd = request.getRequestDispatcher("respuesta.jsp?men=No ha iniciado sesion no puede procesar la compra&proc=index.jsp");
		rd.forward(request, response);
	}
}