<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@page import="java.util.Vector"%>
<%@page import="modelo.Productos"%>
<%@page import="modelo.Imagen"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.text.NumberFormat"%>
<HTML>
	<HEAD>
		<TITLE>TUCOMPRAYA.COM - Corporación de Redes Tecnológicas</TITLE>
		<META http-equiv=Content-Type content="text/html; charset=iso-8859-1">
		<META content="Compra, Venta, Equipos de Computación, Consolas de Video Juego, Compra Ya, Tu compra, Excelentes Precios, Laptops, GPS,Video Juegos, Xbox, Wii, Ds, Nintendo, Blackberry, Nokia, Samsung,
						Buscar, Comprar, Vender, Carrito, Consolas, LCD, Reproductores, Ipod, Apple, Nano, Audio, Video, Barato" name=keywords>
		<META content=index,follow name=robots>
		<META content="Sistemas FinallyWeb C.A" name=Author>
		<LINK href="http://www.tucompraya.com/favicon.ico" type=image/gif rel=icon>
		<LINK href="http://www.tucompraya.com/favicon.ico" type=image/x-icon rel="shortcut icon">
		<link href="plantillas/estilo.css" type = "text/css" rel = "stylesheet">
		<script type="text/javascript" src="plantillas/imagenes.js">
    </script>
    <script language=javascript type="text/javascript">
    	function ir(valor)
        {   document.f1.producto.value = valor.name;
            document.f1.submit();
        }

    </script>
	</HEAD>
	<BODY>
		<CENTER>
			<jsp:include flush="true" page="plantillas/encabezado.jsp"/>
			<table width="940" id="maintable" border="0">
				<tbody>
					<tr>
						<td valign="top" nowrap="nowrap" width="20%" bgcolor="#eef3f4" rowspan="2">
							<jsp:include flush="true" page="plantillas/ladoIzquierdo.jsp"/>
						</td>
					</tr>
			<tr>
				<td width="*" valign="top"><div style="MARGIN-LEFT: 4px"  align="left">
					<br/><br/>
					<!--  ***************************************************************** -->
					<!-- AQUI SE DEBE MONTAR LO QUE CAMBIA -->
                        <form name = "f1" action="CarritoServlet" method="get">
                        <table border="0" cellpadding="1" cellspacing="1" width="100%" align="center">
                            <tr valign="top">
                                <td width="43%" align="center" colspan="3">
                                </td>
                            <%	NumberFormat nf = NumberFormat.getInstance();
								nf.setMinimumFractionDigits(2);
								nf.setMaximumFractionDigits(2);
                            	int cat = 0;
                                    Productos p = new Productos();
                                    Vector productos=null;
		                           	if (request.getParameter("cat") != null && !request.getParameter("cat").equals("")){
		                                cat = Integer.parseInt(request.getParameter("cat"));
		                                productos = p.cargarProductos(cat);
		                            }
                                    else
                                    	productos = p.cargarProductos(cat);
		                            if (productos != null)
                                    {   Iterator ip = productos.iterator();

                                    	int cont = 3;
                                        int cont18 = 0;
                                        while (ip.hasNext() && cont18 < 18)
                                        {   cont18++;
                                        	if (cont >= 3)
                                            {   out.print("<tr>");
                                            }
                                            p = (Productos) ip.next();
                                            Vector imagenesP = p.getImagenes();
                                            if (imagenesP != null && !imagenesP.isEmpty())
                                            {   Imagen i = (Imagen)imagenesP.elementAt(0);
                                                out.print("<td width = 220 align = 'center'>");
                                            %>
                                                <a href = 'informacionProductos.jsp?codigoVerificacion=<%=p.getCodigoVerificacion() %>'>
                                                            <img border = '0' src='<%=i.getRutaImagen()%>' width=130 height=100 /></a><br>
                                            <%
                                                out.print("<font class= 'letraAzul'>"+p.getNombre()+"<br>Bs. "+nf.format(p.getPrecioCliente())+"</font>");
                                                out.print("<br><input type='button' value='Añadir al Carrito' name = '"+p.getCodigoVerificacion()+"' id='botonCarrito' onmouseover='cambiarFondoInCarrito(this);'" +
                                                "onmouseout='cambiarFondoOutCarrito(this);' onclick='ir(this);'/></td>");

                                                cont--;
                                                if (cont == 0)
                                                {    out.print("</tr>");
                                                	cont = 3;
                                                }
                                            }

                                        }

										out.print("<input type='hidden' name = 'producto'/>");
									}
									else
									{	out.print("<tr><td  align = 'center'>"+
																			"<h4 class = 'letraAzul'>No hay Productos Registrados</h4>"+
															"</td></tr>");
									}
							%>

						</table>

					</form>
				<!--  ***************************************************************** -->
				</div></td>
				<td valign="top" width="20%" bgcolor="#eef3f4" rowspan="2">
                    <jsp:include flush="true" page="plantillas/iniciarSesionIndex.jsp"/>

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