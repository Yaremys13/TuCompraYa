<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@page import="modelo.Encuesta"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.Iterator"%>
<HTML>
	<HEAD>
		<TITLE>TUCOMPRAYA.COM - Corporación de Redes Tecnológicas</TITLE>
		<META http-equiv=Content-Type content="text/html; charset=iso-8859-1">
		<META content="Compra, Venta, Equipos de Computación, Consolas de Video Juego, Compra Ya, Tu compra, Excelentes Precios" name=keywords>
		<META content=index,follow name=robots>
		<META content="Sistemas FinallyWeb C.A" name=Author>
		<LINK href="http://www.tucompraya.com/favicon.ico" type=image/gif rel=icon>
		<LINK href="http://www.tucompraya.com/favicon.ico" type=image/x-icon rel="shortcut icon">
		<link href="plantillas/estilo.css" type = "text/css" rel = "stylesheet">
		<script type="text/javascript" src="plantillas/imagenes.js">
    </script>
	</HEAD>
	<BODY>
		<center>
			<jsp:include flush="true" page="plantillas/encabezadoAdmin.jsp"/>
			<table width="940" id="maintable" >
				<tbody>
					<tr>
						<td valign="top" nowrap="nowrap" width="20%" bgcolor="#dce6fb" rowspan="2">
							<jsp:include flush="true" page="plantillas/ladoIzquierdoAdmin.jsp"/>
						</td>
					</tr>
					<tr>
						<td width="*" valign="top"><div style="MARGIN-LEFT: 4px"  align="left">

					<!--  ***************************************************************** -->
					<!-- AQUI SE DEBE MONTAR LO QUE CAMBIA -->
					<%
					Encuesta en= new Encuesta();
					Vector v=en.buscarEncuesta();

					%>
					<form  name="ModificarEncuesta"  action="modificarEncuesta.jsp" method="post">
						<table border="0" cellpadding="0" cellspacing="0" width="100%" align="center">
							<tr valign="top">
								<td width="43%" ="2" align="center" colspan="2">
									<font class="letraAzulTitulo">Buscar Encuesta  </font>
									<br/>
									<br/>
									<br/>
								</td>
							</tr>
							<tr>
								<td align="center">
									<font class="letraAzul">Id Pregunta: </font>
								</td>
								<td><select name="idPregunta">
								   <%
                          if (v != null)
                          {       Iterator it = v.iterator();
                                  while (it.hasNext())
                                  {   en = (Encuesta) it.next();%>
                                  <option value="<%=en.getIdPregunta() %>"><%=en.getContenido() %></option>
                                  <%}
                              }
                              else
                              {   out.print("<br><font class = 'letra'>No hay categorías que mostrar</font><br>");
                              }

                          %>

								</select></td>
							</tr>
							<tr>
								<td colspan = 2 align = "center">
									<br/><br/>
									<input type="button" name="buscar" value="Buscar"  id="boton" onmouseover="cambiarFondoIn(buscar);"
					      	onmouseout="cambiarFondoOut(buscar);" onclick="enc(document.ModificarEncuesta);"/>
								</td>
							</tr>
						</table>
					</form>
					<!--  ***************************************************************** -->
				</td>
				<td valign="top" nowrap="nowrap" width="20%" bgcolor="#dce6fb" rowspan="2">

				</td>
			</tr>
		</tbody>
	</table>
	<br/>
	</center>
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