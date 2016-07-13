<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@page import="java.util.Vector"%>
<%@page import="modelo.Productos"%>
<%@page import="modelo.Imagen"%>
<%@page import="java.util.Iterator"%>
<%@page import="modelo.Cliente"%>
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
    <script type="text/javascript">
    	function ir(valor)
    	{	document.f1.producto.value = valor.name;
    		//alert(document.f1.producto.value);
    		document.f1.submit();
    	}
    </script>
	</HEAD>
	<BODY>
		<CENTER>
			<jsp:include flush="true" page="plantillas/encabezado.jsp"/>
			<table width="940" id="maintable" >
				<tbody>
					<tr>
						<td valign="top" nowrap="nowrap" width="20%" bgcolor="#eef3f4" rowspan="2">
							<jsp:include flush="true" page="plantillas/ladoIzquierdo.jsp"/>
						</td>
					</tr>
			<tr>
				<td width="*" valign="top"><div style="MARGIN-LEFT: 4px"  align="left">
					<br/><br/>
					<!--  ***************************************************************** -->
					<!-- AQUI SE DEBE MONTAR LO QUE CAMBIA -->
 						<% HttpSession sesion = request.getSession();
						 Cliente cli = (Cliente) sesion.getAttribute("cliente");
						 if (cli != null)
						 {
							 System.out.println("Este es el id " + request.getParameter("idCompra") );
					%>
					<form  name="Compra"  action="RegistrarPago" method="post">

					<input type = "hidden" name = "idCompra" value = "<%=request.getParameter("idCompra") %>"/>
				    <table border="0" cellpadding="0" cellspacing="0" width="100%" align="center">
		  	      <tr valign="top">
		            <td cellspading="2" align="center" colspan="2">
		              <font class="letraAzulTitulo"> Registrar su Compra</font>
									<br/><br/><br/>
								</td>
		      		<tr>
		        		<td width="56%" align="center" bordercolor="#FFFFFF">
		        			<font class="letraAzul">Numero de Voucher: </font>
		        		</td>
		        		<td width="44%" align="justify">
		        			<input name="nroVoucher" type="text" />
		        		</td>
		      		</tr>
		        	<tr>
		          	<td align="center" bordercolor="#FFFFFF">
		          		<font class="letraAzul">Nombre del Banco: </font>
		          	</td>
		          	<td><input name="banco" type="text"/></td>
		        	</tr>

				    </table>


				    <center>
				    <br>
				    <hr>
				    <center>
				    <br>
				    <font class="letraAzulTitulo" style="font-size:14px;">Datos de Envío</font>
				    <br><br>
				    <table>
				    	<tr>
				    		<td>
									<font class = 'letra'>Quien Recibe:</font>
				    		</td>
				    		<td>
				    			<input type = "text" name = "receptor" size = 20/>
				    		</td>
				    	</tr>
				    	<tr>
				    		<td>
									<font class = 'letra'>Urb./Edif.</font>
				    		</td>
				    		<td>
				    			<input type = "text" name = "urb" size = 20/>
				    		</td>
				    	</tr>
				    	 	<tr>
				    		<td>
									<font class = 'letra'>Calle/Av.</font>
				    		</td>
				    		<td>
				    			<input type = "text" name = "calle" size = 20/>
				    		</td>
				    	</tr>
				    	 <tr>
				    		<td>
									<font class = 'letra'>Casa/Apto/Ofic. Nro.</font>
				    		</td>
				    		<td>
				    			<input type = "text" name = "nro" size = 20/>
				    		</td>
				    	</tr>
				    	<tr>
				    		<td>
									<font class = 'letra'>Ciudad</font>
				    		</td>
				    		<td>
				    			<input type = "text" name = "ciudad" size = 20/>
				    		</td>
				    	</tr>
				    	<tr>
				    		<td>
									<font class = 'letra'>Estado</font>
				    		</td>
				    		<td>
				    			<input type = "text" name = "estado" size = 20/>
				    		</td>
				    	</tr>
				    	<tr>
				    		<td>
									<font class = 'letra'>Teléfono Local</font>
				    		</td>
				    		<td>
				    			<input type = "text" name = "telefono" size = 20/>
				    		</td>
				    	</tr>
				    	<tr>
				    		<td>
									<font class = 'letra'>Teléfono Celular</font>
				    		</td>
				    		<td>
				    			<input type = "text" name = "celular" size = 20/>
				    		</td>
				    	</tr>
				    	</table>
				    	<br>
				    	<hr>
				    	<table>
							<tr>
		  			  	<td align="center" colspan="2">
				    	    <br/><br/>
				    	    <input type="button" id = "boton" name="comprar" value="Pagar" onmouseover="cambiarFondoIn(comprar);"
					      	onmouseout="cambiarFondoOut(comprar);" onclick="registrarCompra(document.Compra);">
		    			    <input type="reset" id = "boton" name="cancelar" value="Cancelar" onmouseover="cambiarFondoIn(cancelar);"
					      	onmouseout="cambiarFondoOut(cancelar);" onclick=""/>
		  	        </td>
		  	      </tr>
				    </table>
				    </center>
					</form>
					<% }
						 else
						 {	out.print("No Ha iniciado Sesión no Tiene Permiso para Comprar");
							out.print("<br><br><br><a href = 'indexAdmin.jsp' class = 'letra'>Volver</a>");
						 }

						 %>

				<!--  ***************************************************************** -->
				</td>
				<td valign="top" width="20%" bgcolor="#eef3f4" rowspan="2">
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