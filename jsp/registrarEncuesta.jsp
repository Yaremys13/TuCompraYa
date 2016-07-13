<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

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
							<td width="*" valign="top"><div style="MARGIN-LEFT: 4px">
								<center>
								<!--  ***************************************************************** -->
								<!-- AQUI SE DEBE MONTAR LO QUE CAMBIA -->
								<form  name="Encuesta"  action="RegistrarEncuesta" method="Post">
									<table border="0" cellpadding="0" cellspacing="0" width="100%" align = "center">
										<tr valign="top">
											<td width="43%" align="center" colspan="2">
												<br/>
												<h2><font class = "letraAzulTitulo"> Registrar Encuesta</font></h2>
											</td>
										</tr>
										<tr>
											<td align = "center">
												<font class = "letraAzul">Pregunta: &nbsp;&nbsp;&nbsp;</font>
											</td>
											<td align = "center">
												<textarea name="contenido" id="contenido"></textarea>
											</td>
										</tr>
										<tr>
											<td align = "center">
												<font class = "letraAzul">Opcion 1: &nbsp;&nbsp;&nbsp;</font>
											</td>
											<td align = "center">
												<textarea name="opcion1" id="opcion1"></textarea>
											</td>
										</tr><tr>
											<td align = "center">
												<font class = "letraAzul">Opcion 2: &nbsp;&nbsp;&nbsp;</font>
											</td>
											<td align = "center">
												<textarea name="opcion2" id="opcion2"></textarea>
											</td>
										</tr><tr>
											<td align = "center">
												<font class = "letraAzul">Opcion 3: &nbsp;&nbsp;&nbsp;</font>
											</td>
											<td align = "center">
												<textarea name="opcion3" id="opcion3"></textarea>
											</td>
										</tr><tr>
											<td align = "center">
												<font class = "letraAzul">Opcion 4: &nbsp;&nbsp;&nbsp;</font>
											</td>
											<td align = "center">
												<textarea name="opcion4" id="opcion4"></textarea>
											</td>
										</tr>

										<tr>
											<td align="center" colspan="2">
												<input type="button" name="guardar" id="boton" value="Guardar" onmouseover="cambiarFondoIn(guardar);"
					      	onmouseout="cambiarFondoOut(guardar);" onclick="encuesta(document.Encuesta);"/>
												<input type="reset" name="cancelar" id="boton" value="Cancelar" onmouseover="cambiarFondoIn(cancelar);"
					      	onmouseout="cambiarFondoOut(cancelar);" onclick=""/>
											</td>
										</tr>
									</table>
								</form>
								</center>
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