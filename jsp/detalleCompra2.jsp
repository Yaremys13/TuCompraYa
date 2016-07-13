<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@page import="modelo.Compra"%>
<%@page import="java.util.Vector"%>
<%@page import="modelo.Cliente"%>
<%@page import="java.util.Iterator"%>
<%@page import="modelo.DetalleCompra"%>
<%@page import="modelo.Productos"%>
<%@page import="modelo.Imagen"%>
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
	</HEAD>
	<BODY>
		<CENTER>
		<jsp:include page = "plantillas/encabezado.jsp" flush = "true"/>
		<table width="940" id="maintable" >
			<tbody>
				<tr>
					<!-- Columna Izquierda -->
					<td valign="top" nowrap="nowrap" width="20%" bgcolor="#eef3f4" rowspan="2">
						<jsp:include flush="true" page="plantillas/ladoIzquierdo.jsp"/>
					</td>
				</tr>
				<tr>
					<td width="*" valign="top">

					<!--  ***************************************************************** -->
					<center>
						<%	NumberFormat nf = NumberFormat.getInstance();
							nf.setMinimumFractionDigits(2);
							nf.setMaximumFractionDigits(2);
							Cliente cli = new Cliente();
							float t = 0;
							float iva =0;
							HttpSession sesion = request.getSession(false);
							Productos p = new Productos();
							if (sesion != null)
							{	int id = 0;
								if (request.getParameter("idCompra") != null && !request.getParameter("idCompra").equals(""))
									id = Integer.parseInt(request.getParameter("idCompra"));
								Compra c = new Compra();
								c = c.cargarCompra(id);
								if (c != null)
								{	cli = cli.cargarCliente(c.getIdCli());
									if (cli == null)
										cli = new Cliente();
									DetalleCompra dc = new DetalleCompra();
									Vector vdc = dc.buscarDetallesCompra(c.getIdCompra());
									if (vdc != null)
									%>
									<br>
									<font class = 'letraAzulTitulo'>Detalle de Compra</font><br><br>
									</center>
									<form action="EnviarConfirmacionPago" name = 'f1' method = 'post'>
									<center><table>
										<tr>
											<td>
												<input type = "hidden" name = "idCompra" value ="<%=c.getIdCompra() %>"/>
												<input type = "hidden" name = "remitente" value = "<%=cli.getCorreo()%>"/>
												<font class = 'letra'>Orden #: <%=c.getIdCompra() %></font><br>
												<font class = 'letra'>Cliente: <%=cli.getNombre()+" "+cli.getApellido() %></font><br>
												<font class = 'letra'>Fecha: <%=c.getFechaCompra() %></font><br>
												<font class = 'letra'>Forma de Pago:
												<% 	if(c.getFormaPago().equalsIgnoreCase("d"))
														out.print("Depósito");
													else if(c.getFormaPago().equalsIgnoreCase("t"))
														out.print("Tranferencia");
													else
														out.print("Tarjeta de Crédito");
													%></font>
											<br>
											<hr>
											<br>
											<% 	if (c.getFormaPago().equalsIgnoreCase("c"))
												{
											%>
												<font class = 'letra'>Datos de la Tarjeta de Crédito<br>
												Nro. Tarjeta de Crédito: <%=c.getNroTC() %><br>
												Nombre Titular Tarjeta de Crédito: <%=c.getNombreTC() %><br>
												Tipo de Tarjeta: <%=c.getTipoTC()%><br>
												Fecha de Vencimiento: <%=c.getFvTC() %><br>
												Código de Seguridad: <%=c.getCodSTC() %><br>
												Banco: <%=c.getBanco() %><br>
												<hr>
												</font>
											<%
												}
												else
												{	if (c.getNroVoucher()!= null && !c.getNroVoucher().equals("")) {
											%>	<font class = 'letra'>
												Nro de Voucher: <%=c.getNroVoucher() %><br>
												Banco: <%=c.getBanco() %><br></font>
												<hr>
											<%	}} if (c.getReceptor() != null && !c.getReceptor().equals("")) {%>
											<br>
											<font class = 'letraAzul'>Datos del Envío
											<br>
												Quien Recibe: <%=c.getReceptor() %><br>
												Urb./Edif.: <%=c.getUrbTC() %><br>
												Calle/Av: <%=c.getCalleTC() %><br>
												Nro. Casa/Apto/Ofic.:  <%=c.getNroCTC() %><br>
												Ciudad:  <%=c.getCiuTC() %><br>
												Estado:  <%=c.getEstTC() %><br>
												Teléfono Local:  <%=c.getTlfTC() %><br>
												Teléfono Celular:  <%=c.getCelTC() %><br></font>
											<%} %>
											</td>
										</tr>

									</table></center>
									<br>
									<font class = 'letra'>Estatus: En Proceso</font><br><br>
									<table border = '1' width = '100%'>
										<tr>
											<th><font class = 'letra'>Imagen</font></th>
											<th><font class = 'letra'>Cantidad</font></th>
											<th><font class = 'letra'>Código</font></th>
											<th><font class = 'letra'>Nombre</font></th>
											<th><font class = 'letra'>Precio</font></th>
										</tr>
									<%	Iterator it = vdc.iterator();
										while (it.hasNext())
										{	dc = (DetalleCompra) it.next();
											p = p.buscarProducto(dc.getIdProducto());
											if (p != null)
											{	t+=dc.getPrecioPro();
												Vector vima = p.getImagenes();
												Imagen img = (Imagen)vima.elementAt(0);
										%>
											<tr>
												<td align = 'center'><img src='<%=img.getRutaImagen()%>' width = 50	height = 50/></td>
												<td align = 'center'><font class = 'letra'><%=dc.getCant()%></font></td>
												<td align = 'center'><font class = 'letra'><%=p.getCodigoVerificacion()%></font></td>
												<td align = 'center'><font class = 'letra'><%=p.getNombre() %></font></td>
												<td align = 'center'><font class = 'letra'>Bs. <%=nf.format(dc.getPrecioPro())%></font></td>
											</tr>
											<%
											}
										}
										iva = (new Iva().getIva()/100)*t;
										%>
										</table>
										<table width = '100%'>
											<tr>
												<td align = 'right' width = '85%'><font class = 'letra'>SubTotal</font></td>
												<td align = 'right'><font class = 'letra'>Bs. <%=nf.format(t) %></td>
											</tr>
											<tr>
												<td align = 'right'><font class = 'letra'>IVA</font></td>
												<td align = 'right'><font class = 'letra'>Bs. <%=nf.format(iva) %></td>
											</tr>
											<tr>
												<td align = 'right'><font class = 'letra'>Total</font></td>
												<td align = 'right'><font class = 'letra'>Bs. <%=nf.format(t+iva) %></td>
											</tr>
										</table>
										<center>
										<br><br><br>
										    <table>
										    	<input type="button" name="pagar" value="Finalizar Compra"  id="boton" onmouseover="cambiarFondoIn(pagar);"
														onmouseout="cambiarFondoOut(pagar);" onclick="document.f1.submit();"/>

											</table>

									    	<br>
									    	<hr>
									    	<br>
									    	<a href='index.jsp' class = 'letra'>Volver</a>
										</center>
										</form>
										<%
									}
							}
							%>

					<!--  ***************************************************************** -->
				</td>
				<td valign="top" nowrap="nowrap" width="20%" bgcolor="#dce6fb" rowspan="2">

				</td>
			</tr>
		</tbody>
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