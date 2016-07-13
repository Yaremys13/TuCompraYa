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
						<br><br>
						<center>
							<font class = "letraAzulTitulo">Contáctanos</font>
							<br><br>
							<form name = "f1" action = "EnviarContactanosServlet" method = "post">
								<table>
									<tr>
										<td><font class = "letra">Nombre: </font></td>
										<td><input type = "text" name = "nombre" size = 20/></td>
									</tr>
									<tr>
										<td><font class = "letra">Apellido: </font></td>
										<td><input type = "text" name = "apellido" size = 20/></td>
									</tr>
									<tr>
										<td><font class = "letra">Email: </font></td>
										<td><input type = "text" name = "remitente" size = 20/></td>
									</tr>
									<tr>
										<td><font class = "letra">Ciudad - Estado - Pais: </font></td>
										<td><input type = "text" name = "ubicacion" size = 20/></td>
									</tr>
									<tr>
										<td><font class = "letra">Teléfono - Celular: </font></td>
										<td><input type = "text" name = "telefono" size = 20/></td>
									</tr>
									<tr>
										<td><font class = "letra">¿Como se enteró de nosotros?: </font></td>
										<td><textarea cols = 20 rows = 5 name = "como"></textarea></td>
									</tr>
									<tr>
										<td><font class = "letra">Asunto: </font></td>
										<td><input name = "asunto" size = "20"/></td>
									</tr>
									<tr>
										<td><font class = "letra">Comentarios o Sugerencias: </font></td>
										<td><textarea cols = 20 rows = 5 name = "mensaje"></textarea></td>
									</tr>
									<tr>
		  			  			<td align="center" colspan="2">
				    	    		<br/><br/>
				    	    		<input type="button" id = "boton" name="enviar" value="Enviar" onmouseover="cambiarFondoIn(enviar);"
					      					onmouseout="cambiarFondoOut(enviar);" onclick="contactanos(document.f1);">
		    			    		<input type="reset" id = "boton" name="cancelar" value="Cancelar" onmouseover="cambiarFondoIn(cancelar);"
					      				onmouseout="cambiarFondoOut(cancelar);" onclick=""/>
		  	        		</td>
		  	      		</tr>
		  	      		<input type = "hidden" name = "receptor" value = "contactanos@tucompraya.com"/>
								</table>
							</form>
						</center>
					<!--  ***************************************************************** -->
				</td>
				<td valign="top" nowrap="nowrap" width="20%" bgcolor="#eef3f4" rowspan="2">
					<jsp:include flush="true" page="plantillas/iniciarSesion.jsp"/>
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