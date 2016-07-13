<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
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
		<link href = "plantillas/estilo.css" type = "text/css" rel = "stylesheet">
		<script type="text/javascript" src="plantillas/imagenes.js">
    </script>
    <script type="text/javascript" src="jscripts/tiny_mce/tiny_mce.js"></script>
<script type="text/javascript">
	tinyMCE.init({
		// General options
		mode : "textareas",
		theme : "advanced",
		plugins : "safari,pagebreak,style,layer,table,save,advhr,advimage,advlink,emotions,iespell,inlinepopups,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template,wordcount",

		// Theme options
		theme_advanced_buttons1 : "save,newdocument,|,bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,styleselect,formatselect,fontselect,fontsizeselect",
		theme_advanced_buttons2 : "cut,copy,paste,pastetext,pasteword,|,search,replace,|,bullist,numlist,|,outdent,indent,blockquote,|,undo,redo,|,link,unlink,anchor,image,cleanup,help,code,|,insertdate,inserttime,preview,|,forecolor,backcolor",
		//theme_advanced_buttons3 : "tablecontrols,|,hr,removeformat,visualaid,|,sub,sup,|,charmap,emotions,iespell,media,advhr,|,print,|,ltr,rtl,|,fullscreen",
		//theme_advanced_buttons4 : "insertlayer,moveforward,movebackward,absolute,|,styleprops,|,cite,abbr,acronym,del,ins,attribs,|,visualchars,nonbreaking,template,pagebreak",
		theme_advanced_toolbar_location : "top",
		theme_advanced_toolbar_align : "left",
		theme_advanced_statusbar_location : "bottom",
		theme_advanced_resizing : true,

		// Example content CSS (should be your site CSS)
		content_css : "css/content.css",

		// Drop lists for link/image/media/template dialogs
		template_external_list_url : "lists/template_list.js",
		external_link_list_url : "lists/link_list.js",
		external_image_list_url : "lists/image_list.js",
		media_external_list_url : "lists/media_list.js",

		// Replace values for the template plugin
		template_replace_values : {
			username : "Some User",
			staffid : "991234"
		}
	});
</script>
<!-- /TinyMCE -->

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
					<%! Noticia n= new Noticia(); %>
					<% 	if (request.getParameter("id") != null)
							{	n = new Noticia().cargarNoticia(Integer.parseInt(request.getParameter("id")));
	  				  	if (n != null)
	  				  	{
 				  %>
						<form  name="EliminarNoticia"  action="noticiasEliminadas.jsp" method="post">
							<input type = "hidden" value = "<%=request.getParameter("id")%>" name = "id"/>
							<table border="0" cellpadding="0" cellspacing="0" width="100%" align="center">
						    <tr valign="top">
									<td width="43%" align="center" colspan="2">
										<br/><br/>
										<font class = "letraAzulTitulo"> Eliminar Noticias  </font>
										<br/><br/>
									</td>
								</tr>
								<tr>
									<td width="33%" align="center">

										<font class = "letraAzul">Id Noticia: </font>
									</td>
									<td width="32%">
										<input name="id" type="text" id="id" value="<%= n.getId() %>"/>
									</td>
								</tr>
								<tr>
									<td align="center">
										<font class = "letraAzul">Nombre de la Noticia: </font>
									</td>
									<td>
										<input name="nombreNot" type="text" id="nombreNot" value="<%= n.getNombreNot() %>"/>
									</td>
								</tr>
								<tr>
									<td align="center">
										<font class = "letraAzul">Contenido: </font>
									</td>
									<td>
										<textarea name="contenido" id="contenido" cols="50" rows="12"><%= n.getContenido() %></textarea>
									</td>
								</tr>
								<tr>
									<td align="center" colspan="2">
										<br/><br/>
										<input type="submit" name="eliminar" value="Eliminar"  id="boton" onmouseover="cambiarFondoIn(eliminar);"
					      	onmouseout="cambiarFondoOut(eliminar);" onclick=""/>
										<input type="reset" name="cancelar" value="Cancelar"  id="boton" onmouseover="cambiarFondoIn(cancelar);"
					      	onmouseout="cambiarFondoOut(cancelar);" onclick="" />
									</td>
								</tr>
							</table>
						</form>
						<%	}
	  				  	else
								{
						%>
						<form action = "buscarNoticias.jsp">
							<h2 class = "letraAzulTitulo" align = "center"> Noticia no Encontrada </h2>
							<br/><br/>
							<center><input align = "right" type = "submit" value = "Volver a intentar"/></center>
						</form>
					<%	}
						}
						else
						{
				  %>
					<form action = "buscarNoticias.jsp">
						<h2 class = "letraAzulTitulo" align = "center"> Noticia no Encontrada </h2>
						<br/><br/>
						<center><input align = "right" type = "submit" value = "Volver a intentar"/></center>
					</form>
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