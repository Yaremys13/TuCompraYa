<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

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
						<td valign="top" nowrap="nowrap" width="20%" bgcolor="#dce6fb" rowspan="2">
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
					<form  name="f1"  action="registrarCompra.jsp" method="post">
				    <table border="0" cellpadding="0" cellspacing="0" width="100%" align="center">
		  	      <tr valign="top">
		            <td align="center" colspan="2">
		              <font class="letraAzulTitulo"> Reservar su Compra</font>
									<br/><br/>
								</td>
		      		<tr>
		        		<td width="56%" align="center" bordercolor="#FFFFFF">
		        			<font class="letraAzul">Su Producto será Reservado durante
		        			                        los Proximos 3 días </font><br/>
		        		  <font class="letraAzul">Durante el Transcurso de estos 3 días usted debera Depositar
                                                    En cualquiera de las siguientes Cuentas Bancarias: </font>
                    <br/>
                    <br/>
                    <br/>
                        </td>
		        	</tr>
		        	<tr>
		          	<td align="left" bordercolor="#FFFFFF">
		          		<font class="letraAzul">Depositar o Tranferir a:</font>
		          	    <table border="1" align="center" width = 97%>
							<tr>
		          	           <td class = 'letraAzul'>Banco</td>
		          	           <td class = 'letraAzul'>Nro. de Cuenta</td>
		          	           <td class = 'letraAzul'>Tipo de Cuenta</td>
		          	           <td class = 'letraAzul'>A nombre de</td>

		          	       </tr>
		          	       <tr>
		          	           <td class = 'letraN'>Mercantil</td>
		          	           <td class = 'letraN'>01050157121157017266</td>
		          	           <td class = 'letraN'>Corriente</td>
		          	           <td class = 'letraN'>Corporación de Redes Tecnológicas C.A.</td>

		          	       </tr>
		          	       <tr>
                               <td class = 'letraN'>Banco Exterior</td>
                               <td class = 'letraN'>01150024211000882155</td>
                               <td class = 'letraN'>Corriente</td>
                               <td class = 'letraN'>Corporación de Redes Tecnológicas C.A. </td>
                           </tr>
                   	    </table>
		          	    <br/><br/><br/>

		          	</td>
		          	<tr>
                        <td width="56%" align="center" bordercolor="#FFFFFF">
                            <font class="letraAzul">Luego debe Volver a Entrar </font><br/>
                          <font class="letraAzul">Y colocar los Datos de su Deposito o Transferencia </font>
                    <br/>
                    <br/>
                        </td>
                    </tr>
				    </table>
				    <center>
				    <table>
				    	<input type = "hidden" name = "idCompra" value = "<%=request.getParameter("idCompra") %>"/>
				    	<input type="button" name="pagar" value="Pagar"  id="boton" onmouseover="cambiarFondoIn(pagar);"
											onmouseout="cambiarFondoOut(pagar);" onclick="document.f1.submit();"/>
							<input type="reset" name="cancelar" value="Cancelar"  id="boton" onmouseover="cambiarFondoIn(cancelar);"
											      	onmouseout="cambiarFondoOut(cancelar);" >
						</table>

				    	<br>
				    	<hr>
				    	<br>
				    	<a href='index.jsp' class = 'letra'>Volver</a></center>
					</form>
					<% }
						 else
						 {	out.print("No Ha iniciado Sesión no Tiene Permiso para Reservar");
							out.print("<br><br><br><a href = 'indexAdmin.jsp' class = 'letra'>Volver</a>");
						 }
						 %>

				<!--  ***************************************************************** -->
				</td>
				<td valign="top" width="20%" bgcolor="#dce6fb" rowspan="2">
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