<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@page import="modelo.Noticia"%>
<%@page import="modelo.Productos"%>
<%@page import="modelo.TipoProducto"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.Iterator"%>
<%@page import="modelo.Imagen"%>
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
		theme_advanced_buttons2 : "cut,copy,paste,pastetext,pasteword,|,search,replace,|,bullist,numlist,|,outdent,indent,blockquote,|,undo,redo,|,help,code,|,insertdate,|,forecolor,backcolor",
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
					<% 	if (request.getParameter("codigoVerificacion") != null)
							{	Productos p = new Productos().buscarProducto(request.getParameter("codigoVerificacion"));

								if (p != null)
								{	%>
								<form  name="ModificarProducto"  action="ModificarProductos" method="post" enctype="multipart/form-data">
								<input type = "hidden" value = "<%=request.getParameter("codigoVerificacion")%>" name = "codigoVerificacion"/>
								<table border="0" cellpadding="0" cellspacing="0" width="100%" align="center">
								    <tr valign="top">
								        <td width="43%"  align="center" colspan="2">
								        	<font class="letraAzulTitulo"> Modificar Productos </font>
								          	<br><br>
								         </td>
								         </tr>
								      <tr>
								      <td width="33%" align="left"><font class = "letraAzul">Codigo verificacion: </font></td>
								      <td width="32%"><input name="codigoVerificacion" type="text" value="<%= p.getCodigoVerificacion() %>" readonly="readonly"/></td>
								    </tr>
								    <tr>
								      <td align="left"><font class = "letraAzul">Nombre del Producto: </font></td>
								      <td><input name="nombres" type="text" id="nombres" value="<%= p.getNombre() %>"/></td>
								    </tr>
								     <tr>
								      <td align="left" colspan="2"><font class = "letraAzul">Descripcion: </font></td>

								    </tr>
								    <tr>
										<td colspan="2"><textarea name="descripcion" cols = 30 rows = 30><%= p.getDescripcion() %></textarea></td>
									</tr>
									 <tr>
								      <td align="left"><font class = "letraAzul">Precio Cliente: </font></td>
								      <td><input name="precioCliente" type="text" id="precioCliente" value="<%= p.getPrecioCliente() %>"/></td>
								    </tr>
								    <tr>
								      <td align="left"><font class = "letraAzul">Precio Miembro: </font></td>
								      <td><input name="precioMiembro" type="text" id="precioMiembro" value="<%= p.getPrecioMiembro() %>"/></td>
								    </tr>
								     <tr>
								      <td align="left"><font class = "letraAzul">Marca: </font></td>
								      <td><input name="marca" type="text" id="marca" value="<%= p.getMarca() %>"/></td>
								    </tr>
								     <tr>
								      <td align="left"><font class = "letraAzul">Cantidad: </font></td>
								      <td><input name="cantidad" type="text" id="cantidad" value="<%= p.getCantidad() %>"/></td>
								    </tr>
								     <tr>
								      <td align="left"><font class = "letraAzul">Color: </font></td>
								      <td><input name="color" type="text" id="color" value="<%= p.getColor() %>"/></td>
								    </tr>
								     <tr>
								      <td align="left"><font class = "letraAzul">Tipo Producto: </font></td>
								      <td>	<select name = "idTp">
								      			<option value = "">Seleccione...</option>
								      			<% 	TipoProducto tp = new TipoProducto();
								      				Vector vtp = tp.buscarCategorias();
								      				if (vtp != null)
								      				{	Iterator it = vtp.iterator();
								      					while (it.hasNext())
								      					{	tp = (TipoProducto) it.next();
								      						%>
								      						<option value = "<%=tp.getId()%>" <% if (tp.getId() == p.getIdTp()) out.print("selected"); %>>
								      							<%=tp.getNombre() %>
								      						</option>
								      						<%
								      					}

								      				}
								      			%>
								      		</select>
								      </td>
								    </tr>
								    </table>

								    <table>
								    <tr>
									    <td align="left">
									    <font class = "letraAzul">Imágenes: </font><br>
									    <input type="file" name="img1"  /><br>
									    <input type="file" name="img3" /><br>
									    <input type="file" name="img2"><br>
									     <font class = "letraAzul">Las imágenes son solo para su modificación,
									      al no cambiarlas mantendran la misma imágen original </font><br>
									    </td>
								    </tr>
								    </table>
								    <center>
								    <table>
								    <tr>
								      <td align="center" colspan="2"><br><br>
								      	<input type="button" name="modificar" value="Modificar" id="boton" onmouseover="cambiarFondoIn(modificar);"
					      	onmouseout="cambiarFondoOut(modificar);" onclick="ModPro(ModificarProducto)" align="center"/>
										<input type="reset" name="cancelar" value="Cancelar"  id="boton" onmouseover="cambiarFondoIn(cancelar);"
					      	onmouseout="cambiarFondoOut(cancelar);" onclick="" align="center"/>
					            </td>
										</tr>
								  </table></center>
								</form>
							<%}
		  				  else
								{	%>
									<form action = "buscarProductos.jsp">
										<h2 class = "letraAzulTitulo" align = "center"> Producto no Encontrado </h2>
										<br/><br/>
										<center><input align = "right" name="volver" type = "submit" value = "Volver a intentar" id = "boton" onmouseover="cambiarFondoIn(volver);"
					      	onmouseout="cambiarFondoOut(volver);" onclick=""/></center>
									</form>
						<%	}
							}
							else
							{ %>
								<h2 class = "letraAzulTitulo" align = "center"> Producto no Encontrado </h2>
									<br/><br/>
								<a href = 'indexAdmin.jsp' class = 'letra'>Volver</a>
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