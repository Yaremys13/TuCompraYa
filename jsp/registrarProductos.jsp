<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">


<%@page import="java.util.Vector"%>
<%@page import="modelo.TipoProducto"%>
<%@page import="java.util.Iterator"%>
<HTML>
	<HEAD>
		<TITLE>TUCOMPRAYA.COM - Corporación de Redes Tecnológicas</TITLE>
		<META http-equiv=Content-Type content="text/html; charset=iso-8859-1">
		<META	content="Compra, Venta, Equipos de Computación, Consolas de Video Juego, Compra Ya, Tu compra, Excelentes Precios" name=keywords>
		<META content=index,follow name=robots>
		<META content="Sistemas FinallyWeb C.A" name=Author>
		<LINK href="http://www.tucompraya.com/favicon.ico" type=image/gif	rel=icon>
		<LINK href="http://www.tucompraya.com/favicon.ico" type=image/x-icon rel="shortcut icon">
		<link href="plantillas/estilo.css" type = "text/css" rel = "stylesheet">
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
<body>
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
	      <td  width="*" valign="top">
	      	<!--  ***************************************************************** -->
			    <!-- AQUI SE DEBE MONTAR LO QUE CAMBIA -->
					<form  name="productos"  action="RegistrarProductos" method="post" enctype = "multipart/form-data">
					<table border="0" cellpadding="0" cellspacing="0" align="center">
						<tr valign="top">
							<td width="43%" align="center" colspan="2">
								<br/>
								<font class = "letraAzulTitulo">Registrar Productos</font>
								<br/><br><br>
							</td>
						</tr>
						<tr>
							<td width="33%" align="center"><font class = "letraAzul">Nombre del Producto: </font></td>
							<td width="32%"><input name="nombres" type="text" id="nombres" /></td>
						</tr>
						<tr>
							<td align="center"><font class = "letraAzul">Descripción: </font></td>
							<td><textarea id="descripcion" name="descripcion" rows="15" cols="80" style="width: 80%">Prueba</textarea></td>
						</tr>
						<tr>
							<td align="center"><font class = "letraAzul">Precio Cliente: </font></td>
							<td><input name="precioCliente" type="text" /></td>
						</tr>
						<tr>
							<td align="center"><font class = "letraAzul">Precio Miembro: </font></td>
							<td><input name="precioMiembro" type="text" /></td>
						</tr>
                        <tr>
							<td align="center"><font class = "letraAzul">Marca: </font></td>
							<td><input name="marca" type="text" /><font class = 'letraPequena'>(opcional)</font></td>
						</tr>
						<tr>
							<td align="center"><font class = "letraAzul">Cantidad: </font></td>
							<td><input name="cantidad" type="text" /></td>
						</tr>
						<tr>
							<td align="center"><font class = "letraAzul">Color: </font></td>
							<td><input name="color" type="text" /><font class = 'letraPequena'>(opcional)</font></td>
						</tr>
						<tr>
							<td align="center"><font class = "letraAzul">Tipo de Producto: </font></td>
							<td><select name = "idTp">
								<option value = "">Seleccione...</option>
								<%	TipoProducto tp = new TipoProducto();
									Vector cats = tp.buscarCategorias();
									if (cats != null)
									{	Iterator it = cats.iterator();
										while (it.hasNext())
										{	tp = (TipoProducto) it.next();
											%>
											<option value = '<%=tp.getId()%>'><%=tp.getNombre() %></option>
											<%
										}

									}
								%>
							</select></td>
						</tr>
						<tr>
							<td align="center"><font class = "letraAzul">Imagenes: </font></td>
							<td>
								<input name="imagen" type="file" /><br/>
								<input name="imagen1" type="file" /><font class = 'letraPequena'>(opcional)</font><br/>
								<input name="imagen2" type="file" /><font class = 'letraPequena'>(opcional)</font>
							</td>
						</tr>
						<tr>
							<td align="center" colspan="2">
								<br><br><input type="button" name="guardar" id="boton" value="Guardar" onmouseover="cambiarFondoIn(guardar);"
					      	onmouseout="cambiarFondoOut(guardar);" onclick="RegPro(document.productos);"/>
								<input type="reset" name="cancelar" id="boton" value="Cancelar" onmouseover="cambiarFondoIn(cancelar);"
					      	onmouseout="cambiarFondoOut(cancelar);" />
							</td>
						</tr>
					</table>
				</form>
				<!--  ***************************************************************** -->
	      </td>
      	<td width="*" valign="top">

      	</td>
      </tr>
    </tbody>
    </table>
	</center>
	<script type="text/javascript">
	<!--
	swfobject.registerObject("FlashID2");
	swfobject.registerObject("FlashID");
	swfobject.registerObject("FlashID4");
	swfobject.registerObject("FlashID3");
	//-->
	</script>
</body>
</HTML>