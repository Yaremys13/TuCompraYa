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
		<script type="text/javascript" src="plantillas/validaciones.js">
    </script>
    <script language="javascript" >

    function validarCompra(f){
    alert("pasa");

}

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
					%>
					<form  name="Compra"  action="RegistrarCompras" method="post">
				    <input type = "hidden" value = "c" name = "fp">
				    <table border="0" cellpadding="0" cellspacing="0" width="100%" align="center">
		  	      <tr valign="top">
		            <td cellspading="2" align="center" colspan="2">
		              <font class="letraAzulTitulo"> Registrar su Compra</font>
									<br/><br/><br/>
								</td>
		      		<center>
				    <br>
				    <font class="letraAzulTitulo" style="font-size:14px;">Datos de Tarjeta Crédito</font>
				    <br><br>
				    <table>
				    	<tr>
				    		<td>
									<font class = 'letra'>Nombre Completo:</font>
				    		</td>
				    		<td>
				    			<input type = "text" name = "nombreC" size ="30"/>
				    		</td>
				    	</tr>
				    	<tr>
				    		<td>
									<font class = 'letra'>Banco:</font>
				    		</td>
				    		<td>
				    			<input type = "text" name = "banco" />
				    		</td>
				    	</tr>
				    	 <tr>
				    		<td>
									<font class = 'letra'>Nº de Tarjeta (16 dígitos)</font>
				    		</td>
				    		<td>
				    			<input type = "text" name = "digitosT" size ="4" maxlength="4" onchange="numerico(this);"/>-
				    			<input type = "text" name = "digitosT1" size ="4" maxlength="4" onchange="numerico(this);"/>-
				    			<input type = "text" name = "digitosT2" size ="4" maxlength="4" onchange="numerico(this);"/>-
				    			<input type = "text" name = "digitosT3" size ="4" maxlength="4" onchange="numerico(this);"/>
				    		</td>
				    	</tr>
				    	 <tr>
				    		<td>
									<font class = 'letra'>Fecha de Vencimiento:</font>
				    		</td>
				    		<td>
				    			<select  name = "mes">
					    			<option value="01"/>01</option>
					    			<option value="02">02</option>
					    			<option value="03">03</option>
					    			<option value="04">04</option>
					    			<option value="05">05</option>
					    			<option value="06">06</option>
					    			<option value="07">07</option>
					    			<option value="08">08</option>
					    			<option value="09">09</option>
					    			<option value="10">10</option>
					    			<option value="11">11</option>
					    			<option value="12">12</option>
								</select>
								<select  name = "anio">
					    			<option value="2009"/>2009</option>
					    			<option value="2010">2010</option>
					    			<option value="2011">2011</option>
					    			<option value="2012">2012</option>
					    			<option value="2013">2013</option>
					    			<option value="2014">2014</option>
					    			<option value="2015">2015</option>
					    			<option value="2016">2016</option>
					    			<option value="2017">2017</option>
					    			<option value="2018">2018</option>
					    			<option value="2019">2019</option>
					    			<option value="2020">2020</option>
								</select>
				    		</td>
				    	</tr>
				    	<tr>
				    		<td>
									<font class = 'letra'>Tipo de Tarjeta</font>
				    		</td>
				    		<td>
				    			<select  name = "tTarjeta">
                                <option value="mastercard"/>Mastercard</option>
                                <option value="visa">Visa</option>
                                <option value="americam Express">Americam Express</option>
                                </select>
				    		</td>
				    	</tr>
				    	<tr>
				    		<td>
									<font class = 'letra'>Código de Seguridad (Últimos 3)</font>
				    		</td>
				    		<td>
				    			<input type = "text" name = "codigoS" maxlength="3" size="3" onchange="numerico(this);"/>
				    		</td>
				    	</tr>
				    	</table>
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
				    			<input type = "text" name = "receptor" size ="20"/>
				    		</td>
				    	</tr>
				    	<tr>
				    		<td>
									<font class = 'letra'>Urb./Edif.:</font>
				    		</td>
				    		<td>
				    			<input type = "text" name = "urb" size ="20"/>
				    		</td>
				    	</tr>
				    	 	<tr>
				    		<td>
									<font class = 'letra'>Calle/Av.:</font>
				    		</td>
				    		<td>
				    			<input type = "text" name = "calle" size ="20"/>
				    		</td>
				    	</tr>
				    	 <tr>
				    		<td>
									<font class = 'letra'>Casa/Apto/Ofic. Nro.:</font>
				    		</td>
				    		<td>
				    			<input type = "text" name = "nro" size ="20"/>
				    		</td>
				    	</tr>
				    	<tr>
				    		<td>
									<font class = 'letra'>Ciudad:</font>
				    		</td>
				    		<td>
				    			<input type = "text" name = "ciudad" size ="20"/>
				    		</td>
				    	</tr>
				    	<tr>
				    		<td>
									<font class = 'letra'>Estado:</font>
				    		</td>
				    		<td>
				    			<input type = "text" name = "estado" size ="20"/>
				    		</td>
				    	</tr>
				    	<tr>
				    		<td>
									<font class = 'letra'>Teléfono Local:</font>
				    		</td>
				    		<td>
				    			<input type = "text" name = "telefono" size ="20"/>
				    		</td>
				    	</tr>
				    	<tr>
				    		<td>
									<font class = 'letra'>Teléfono Celular:</font>
				    		</td>
				    		<td>
				    			<input type = "text" name = "celular" size ="20"/>
				    		</td>
				    	</tr>
				    </table>
				    <br>
				    <hr>
				    <table>
							<tr>
		  			  	<td align="center" colspan="2">
				    	    <br/><br/>
				    	    <input type="button" id = "boton" name="comprar" value="Comprar" onmouseover="cambiarFondoIn(comprar);"
					      	onmouseout="cambiarFondoOut(comprar);" onclick="validarCamposTdc(document.Compra);">

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
							out.print("<br><br><br><a href = 'index.jsp' class = 'letra'>Volver</a>");
						 }
						 %>
				<!--  ***************************************************************** -->

				<td valign="top" width="20%" bgcolor="#eef3f4" rowspan="2">
					<jsp:include flush="true" page="plantillas/iniciarSesion.jsp"/>
				</td>
			</tr>

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