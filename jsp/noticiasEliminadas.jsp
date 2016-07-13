<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@page import="modelo.Cliente"%>
<%@page import="modelo.Noticia"%>
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
						<center>
						<% Noticia n= new Noticia();
							 n = n.cargarNoticia(Integer.parseInt(request.getParameter("id")));
							 if (n != null){
								 if (n.modificarEstatus(n,"e"))
								 { out.print("<font class='letraAzulTitulo'>Noticia Eliminada Satisfactoriamente****</font>");
								 }
								 else
								 {	out.print("<font class='letraAzulTitulo'>Error al Eliminar****</font>");
								 }
							 }else
							 {	out.print("<font class='letraAzulTitulo'>**No existe la Noticia**</font>");
							 }
							%>
							<br><br><br>
							<a href="indexAdmin.jsp" id='a'>Volver</a></center>
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