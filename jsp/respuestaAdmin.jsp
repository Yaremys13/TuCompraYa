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
					<td valign="top" nowrap="nowrap" width="20%" bgcolor="#eef3f4" rowspan="2">
						<jsp:include flush="true" page="plantillas/ladoIzquierdoAdmin.jsp"/>
					</td>
				</tr>
				<tr>
					<td width="*" valign="top">

					<!--  ***************************************************************** -->
						<br><br>
						<% 	if (request.getParameter("men") != null && request.getParameter("proc") != null)
								{		out.print("<center><font class = 'letraAzulTitulo'>"+ request.getParameter("men")+"</font>");
										out.print("<br><br><br><br><font class = 'letra'><a href = '"
												+ request.getParameter("proc") + "'>Volver</a></font></center>");

								}
								else
								{	out.print("<font class = 'letraAzulTitulo'></font>");

								}
						%>
					<!--  ***************************************************************** -->
				</td>
				<td valign="top" nowrap="nowrap" width="20%" bgcolor="#eef3f4" rowspan="2">

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