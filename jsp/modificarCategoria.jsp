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
		<jsp:include page = "plantillas/encabezadoAdmin.jsp" flush = "true"/>
		<table width="940" id="maintable" >
			<tbody>
				<tr>
					<!-- Columna Izquierda -->
					<td valign="top" nowrap="nowrap" width="20%" bgcolor="#dce6fb" rowspan="2">
						<jsp:include flush="true" page="plantillas/ladoIzquierdoAdmin.jsp"/>
					</td>
				</tr>
				<tr>
					<td width="*" valign="top">

					<!--  ***************************************************************** -->
					<!-- AQUI SE DEBE MONTAR LO QUE CAMBIA -->
			    <form  name="RegistrarCategoria"  action="categoriaModificada.jsp" method="post">
						<table border="0" cellpadding="0" cellspacing="0" width="100%" align="center">
					    <tr valign="top">
				      	<td width="43%" align="center" colspan="2">
				        	<h1><font class="letraAzulTitulo"> Modificar Categoría</font></h1>
				          <br/>
				         </td>
			        </tr>
				      <tr>
					      <td align="center">
					      	<font class="letraAzul">Nombre Categoría: </font>
					      </td>
					      <td>
					      	<input type = "hidden" name = "catVieja" value = "<%= request.getParameter("categoria") %>"/>
					      	<input name="categoria" type="text" id="categoria" value = <%= request.getParameter("categoria") %> maxlength="30"/>
					      </td>
					     </tr>
					     <tr>
					      <td colspan = 2 align = "center">
					      	<br/>
					      	<br/>
					      	<input type="submit" name="modificar" value="Modificar"  id="boton" onmouseover="cambiarFondoIn(modificar);"
					      	onmouseout="cambiarFondoOut(modificar);" onclick=""/>
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