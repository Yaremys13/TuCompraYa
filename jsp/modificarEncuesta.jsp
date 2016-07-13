<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@page import="modelo.Noticia"%>
<%@page import="modelo.Productos"%>
<%@page import="modelo.Encuesta"%>
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
					<br/><br/>
					<!--  ***************************************************************** -->
					<!-- AQUI SE DEBE MONTAR LO QUE CAMBIA -->
					<%! Encuesta e= new Encuesta(); %>
					<% 	if (request.getParameter("idPregunta") != null)
							{	e = new Encuesta().cargarEncuesta(Integer.parseInt(request.getParameter("idPregunta")));
								if (e != null)
								{	%>
								<form  name="modificarEncuesta"  action="ModificarEncuesta" method="post">
								<input type = "hidden" value = "<%=request.getParameter("idPregunta")%>" name = "idPregunta"/>
								<table border="0" cellpadding="0" cellspacing="0" width="100%" align="center">
								    <tr valign="top">
								        <td width="43%"  align="center" colspan="2">
								          <h1><font color="#184684"> Modificar Encuestas </font></h1>
								          <p>&nbsp;</p>
								         </td>
								         </tr>
								    <tr>
								      <td align="center"> <h2><font color="#184684">Contenido de la Pregunta: </font></h2></td>
								      <td><input name="contenido" type="text" id="contenido" value="<%= e.getContenido() %>"/></td>
								    </tr>
								     <tr>
								      <td align="center"> <h2><font color="#184684">Opcion 1: </font></h2></td>
								      <td><input name="opcion1" type="text" id="opcion1" maxlength="100" value="<%= e.getOpcion1() %>"/></td>
								    </tr>
								    <tr>
								      <td align="center"> <h2><font color="#184684">Opcion 2: </font></h2></td>
								      <td><input name="opcion2" type="text" id="opcion2" maxlength="100" value="<%= e.getOpcion2() %>"/></td>
								    </tr>
								    <tr>
								      <td align="center"> <h2><font color="#184684">Opcion 3: </font></h2></td>
								      <td><input name="opcion3" type="text" id="opcion3" maxlength="100" value="<%= e.getOpcion3() %>"/></td>
								    </tr>
								    <tr>
								      <td align="center"> <h2><font color="#184684">Opcion 4: </font></h2></td>
								      <td><input name="opcion4" type="text" id="opcion4" maxlength="100" value="<%= e.getOpcion4() %>"/></td>
								    </tr>
								    <tr>
								      <td align="center" colspan="2"><p>&nbsp;
								      	<input type="submit" name="modificar" value="Modificar"  id="boton" onmouseover="cambiarFondoIn(modificar);"
					      	onmouseout="cambiarFondoOut(modificar);" onclick="indexAdmin.jsp"/>
										<input type="reset" name="cancelar" value="Cancelar"  id="boton" onmouseover="cambiarFondoIn(cancelar);"
					      	onmouseout="cambiarFondoOut(cancelar);" onclick=""/>
					            </td>
										</tr>
								  </table>
								</form>
							<%}
		  				  else
								{	%>
									<form action = "indexAdmin.jsp">
										<h2 class = "letraAzulTitulo" align = "center"> Encuesta no Encontrada </h2>
										<br/><br/>
										<center><input align = "right" name="volver" type = "submit" value = "Volver a intentar" onmouseover="cambiarFondoIn(volver);"
					      	onmouseout="cambiarFondoOut(volver);" onclick=""/></center>
									</form>
						<%}
							}
							else
							{ %>
								<h2 class = "letraAzulTitulo" align = "center"> Encuesta no Encontrada </h2>
									<br/><br/>
								 out.print("<br><br><br><a href = 'indexAdmin.jsp' id='a'>Volver</a>");
						<%}
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