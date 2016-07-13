<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@page import="modelo.UsuarioAd"%>
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
		<center>
		<jsp:include page = "plantillas/encabezadoAdmin.jsp" flush = "true"/>
			<table width="940" id="maintable" >
				<tbody>
					<tr>
						<td valign="top" nowrap="nowrap" width="20%" bgcolor="#dce6fb" rowspan="2">
							<jsp:include flush="true" page="plantillas/ladoIzquierdoAdmin.jsp"/>
						</td>
					</tr>
					<tr>
				<td width="*" valign="top">
					<center>
					<br><br>
					<!--  ***************************************************************** -->
					<!-- AQUI SE DEBE MONTAR LO QUE CAMBIA -->
					<font class = 'letraAzulTitulo'>Sub Menu Productos</font><br><br><br>
						<input type="button" name="reg" value="Registrar" id="boton" onmouseover="cambiarFondoIn(reg);"
					      	onmouseout="cambiarFondoOut(reg);" onclick="window.location='registrarProductos.jsp'"/><br><br>
					    <input type="submit" name="mod" value="Modificar" id="boton" onmouseover="cambiarFondoIn(mod);"
					      	onmouseout="cambiarFondoOut(mod);" onclick="window.location='buscarProductos.jsp'"/><br><br>
					    <input type="submit" name="eli" value="Eliminar" id="boton" onmouseover="cambiarFondoIn(eli);"
					      	onmouseout="cambiarFondoOut(eli);" onclick="window.location='eliminarProductos.jsp'"/>
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