<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@page import="modelo.Noticia"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.Iterator"%>
<%@page import="modelo.Imagen"%>
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
						<br>
						<center>

						<%	Noticia n = new Noticia();
								Vector vnoc = n.cargarNoticias();
								Imagen i = new Imagen();
								if (vnoc != null)
								{	out.print("<font class = 'letraAzulTitulo'>Novedades</font><br><br>");
									out.print("<table border = '1' cellpadding = '10px'>");
									Iterator it = vnoc.iterator();
									while (it.hasNext())
									{	n = (Noticia) it.next();
										if (n != null)
										{	i = i.buscarImagenN(n.getId());
											if (i == null)
												i= new Imagen();
										}

						%>
								<tr>
									<td width = "25%" align = "center">
										<img src = '<%=i.getRutaImagen() %>' width = 100 height = 100/>
									</td>
									<td>
											<font class = 'letraAzul'><%=n.getNombreNot() %></font>
                                        	<br><br>
                                        	<font class = 'letraN'>
                                            <%=n.getContenido() %></font>
                                            <br>


                                    </td>
								</tr>
							<%		}
									out.print("</table>");
								}


								out.print("<br><br><a class = 'letra' href = 'index.jsp'>Volver</a>");
						%>


					<!--  ***************************************************************** -->

				<td valign="top" nowrap="nowrap" width="20%" bgcolor="#eef3f4" rowspan="2">
					<jsp:include flush="true" page="plantillas/iniciarSesion.jsp"/>
				</td>

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