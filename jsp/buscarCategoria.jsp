<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@page import="modelo.TipoProducto"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.Iterator"%>
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
					<%



					TipoProducto tp = new TipoProducto();
                    Vector cats = tp.buscarCategorias();



					%>
			    <form  name="RegistrarCategoria"  action="modificarCategoria.jsp" method="post">
						<table border="0" cellpadding="0" cellspacing="0" width="100%" align="center">
					    <tr valign="top">
				      	<td width="43%" align="center" colspan="2">
				        	<h1><font class="letraAzulTitulo"> Buscar Categoría</font></h1>
				          <br/>
				         </td>
			        </tr>
				      <tr>
					      <td align="center">
					      	<font class="letraAzul">Nombre Categoría: </font>

                          <td><select name="categoria">
                          <%
                          if (cats != null)
                          {       Iterator it = cats.iterator();
                                  while (it.hasNext())
                                  {   tp = (TipoProducto) it.next();%>
                                  <option value="<%=tp.getNombre() %>"><%=tp.getNombre() %></option>
                                  <%}
                              }
                              else
                              {   out.print("<br><font class = 'letra'>No hay categorías que mostrar</font><br>");
                              }

                          %>



                          </select>   </td>

                         </tr>
					     <tr>
					      <td colspan = 2 align = "center">
					      	<br/>
					      	<br/>
					      	<input type="submit" name="buscar" value="Buscar" id="boton" onmouseover="cambiarFondoIn(buscar);"
					      	onmouseout="cambiarFondoOut(buscar);" onclick=""/>
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