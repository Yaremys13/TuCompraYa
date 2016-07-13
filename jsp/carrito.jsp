<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@page import="java.util.Vector"%>
<%@page import="modelo.Productos"%>
<%@page import="modelo.Imagen"%>
<%@page import="modelo.Cliente"%>
<%@page import="java.util.Iterator"%>
<%@page import="modelo.Iva"%>
<%@page import="java.text.NumberFormat"%>
<HTML>
	<HEAD>
		<TITLE>TUCOMPRAYA.COM - Corporación de Redes Tecnológicas</TITLE>
		<META http-equiv=Content-Type content="text/html; charset=iso-8859-1">
		<META content="Compra, Venta, Equipos de Computación, Consolas de Video Juego, Compra Ya, Tu compra, Excelentes Precios" name=keywords>
		<META content=index,follow name=robots>
		<META content="Sistemas FinallyWeb C.A" name=Author>
		<LINK href="http://www.tucompraya.com/favicon.ico" type=image/gif rel=icon>
		<LINK href="http://www.tucompraya.com/favicon.ico" type=image/x-icon rel="shortcut icon">
		<link href = "plantillas/estilo.css" type = "text/css" rel = "stylesheet">
		<script type="text/javascript" src="plantillas/imagenes.js">
    </script>
    <script type="text/javascript">
    	function validarFp(valor)
    	{	if(document.f1.fp.value == "")
    		{	alert("**** ERROR debe seleccionar la Forma de Pago ****");
    			document.f1.fp.focus();
    		}
    		else if(document.f1.cant.value > valor)
    		{	alert("**** La cantidad solicitada supera la cantidad en existencia ****");
    			document.f1.cant.value = valor;
    			document.f1.cant.focus();
    		}
    		else if(document.f1.cant.value <= 0)
    		{	alert("**** La cantidad solicitada no puede ser cero o menor de cero****");
    			document.f1.cant.value = valor;
    			document.f1.cant.focus();
    		}
    		else if (!(document.f1.validacion.checked))
    		{	alert("**** Debe chequear las políticas de privacidad****");
    		}
    		else
    			document.f1.submit();
    	}
    </script>
	</HEAD>
	<BODY>
		<CENTER>
		<jsp:include page = "plantillas/encabezado.jsp" flush = "true"/>
		<table width="940" id="maintable" >
			<tbody>
				<tr>
					<!-- Columna Izquierda -->
					<td valign="top" nowrap="nowrap" width="20%" bgcolor="white" rowspan="2">
						<jsp:include flush="true" page="plantillas/ladoIzquierdo.jsp"/>
					</td>
				</tr>
				<tr>
					<td width="*" valign="top">

					<!--  ***************************************************************** -->
					<!-- Esto es lo que varia en cada documento -->
						<br><br>
						<center>

							<% 	NumberFormat nf = NumberFormat.getInstance();
								nf.setMinimumFractionDigits(2);
								nf.setMaximumFractionDigits(2);
								HttpSession sesion = request.getSession(false);
									float t=0;
									float iva= new Iva().getIva();

									if (sesion != null)
									{	Cliente c = (Cliente) sesion.getAttribute("cliente");
										if (c!= null)
										{	%>

										<%
											Vector carrito = (Vector) sesion.getAttribute("carrito");
											Productos p = new Productos();
											if (carrito != null && !carrito.isEmpty())
											{	%><font class = 'letraAzulTitulo'>Tu Carrito</font>
													<br><br>
													<form name='f1' action='RedireccionarComprar'>
													<table border = '1' width = '100%'>
													<tr>
															<th></th>
															<th class = 'letra'>Cantidad</th>
															<th class = 'letra'>Imagen</th>
															<th class = 'letra'>Nombre</th>
															<th class = 'letra'>Precio</th>
													</tr>
												<%
												Iterator ip = carrito.iterator();
												while (ip.hasNext())
												{	p = (Productos) ip.next();
													Vector vImagenes = p.getImagenes();
													Imagen i = (Imagen) vImagenes.elementAt(0);
													out.print("<tr>");
													out.print("<td align = 'center'><input type ='checkbox' name = 'eliminar' value = '"+ p.getCodigoVerificacion()+"'/></td>");
													out.print("<td align = 'center'><input type ='text' name = 'cant' size = 3 value = '1'/></td>");
													out.print("<td align = 'center'><img src='"+i.getRutaImagen()+"' width = 50 height = 50/></td>");
													out.print("<td align = 'center' class='letra'>"+p.getNombre()+"</td>");
													if (c.getEstatus().equalsIgnoreCase("a") || c.getEstatus().equalsIgnoreCase("p"))
													{	out.print("<td class='letra' align = 'right'>Bs. "+nf.format(p.getPrecioCliente())+"</td></tr>");
														t += p.getPrecioCliente();
													}
													else if (c.getEstatus().equalsIgnoreCase("m"))
													{	out.print("<td class='letra' align = 'right'>Bs. "+nf.format(p.getPrecioMiembro())+"</td></tr>");
														t += p.getPrecioMiembro();
													}
												}
												float ivat = t* (iva/100);

												%>
												<table width = "100%">
													<tr>
														<td width = "85%" class='letra' align="right">SubTotal</td>
														<td class='letra' align="right">Bs. <%= nf.format(t) %></td>
													</tr>
													<tr>
														<td width = "85%" class='letra' align="right">Iva</td>
														<td class='letra' align="right">Bs. <%= nf.format(ivat) %></td>
													</tr>
													<tr>
														<td width = "85%" class='letra' align="right">Total</td>
														<td class='letra' align="right">Bs.<%= nf.format(t+ivat) %></td>
													</tr>
													</table>
													<br><br>
														<font class = 'letra'>Forma de Pago:</font>
														<select name = 'fp'>
															<option disabled> Seleccione...</option>
															<option value = 'd'>Depósito Bancario</option>
															<option value = 't'>Transferencia Bancaria</option>
															<option value = 'c'>Tarjeta de Crédito</option>
														</select>
														<br>
														<input type = "checkbox" name = "validacion" checked /><a href = 'politicas.jsp'>Declaro que he leido y acepto las políticas de privacidad y garantías de este sitio Web</a>
														<br><br>

														<input type="button" name="eliminar" value="Eliminar"  id="boton" onmouseover="cambiarFondoIn(eliminar);"
											      	onmouseout="cambiarFondoOut(eliminar);" onclick="document.f1.action = 'EliminarProductoCarrito'; document.f1.submit();"/>
													<input type="button" name="reservar" value="Reservar/Comprar"  id="boton" onmouseover="cambiarFondoIn(reservar);"
											      	onmouseout="cambiarFondoOut(reservar);" onclick="validarFp(<%=p.getCantidad() %>);"/>

								    			  <input type="reset" name="cancelar" value="Cancelar"  id="boton" onmouseover="cambiarFondoIn(cancelar);"
											      	onmouseout="cambiarFondoOut(cancelar);" >
													</form>
												<%
											}
											else
											{	out.print("<center><font class = 'letraAzulTitulo'>No hay productos en el carrito</font>"+
															"<br><br><a class = 'letra' href = 'galeriaProductos.jsp'>Volver</a></center>");

											}
										}
										else
										{	out.print("<center><font class = 'letraAzulTitulo'>No hay sesión iniciada</font>"+
										"<br><br><a class = 'letra' href = 'galeriaProductos.jsp'>Volver</a></center>");

										}
									}
									else
									{	out.print("<center><font class = 'letraAzulTitulo'>No hay sesión iniciada</font>"+
									"<br><br><a class = 'letra' href = 'galeriaProductos.jsp'>Volver</a></center>");
									}
							%>

						</center>
					<!--  ***************************************************************** -->

				<td valign="top" nowrap="nowrap" width="20%" bgcolor="#dce6fb" rowspan="2">
					<jsp:include flush="true" page="plantillas/iniciarSesion.jsp"/>
				</td>
			</tr>
	</table>
	<br/>
	</CENTER>
	<jsp:include flush="true" page="plantillas/pie.jsp"/>
	<script type="text/javascript">
		<!--
		swfobject.registerObject("FlashID2");
		swfobject.registerObject("FlashID");
		swfobject.registerObject("FlashID4");
		swfobject.registerObject("FlashID3");
		//-->
	</script>
	</BODY>
</HTML>