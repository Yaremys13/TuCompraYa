<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@page import="modelo.UsuarioAd"%>
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
		<center>
		<jsp:include page = "plantillas/encabezadoAdmin.jsp" flush = "true"/>
			<table width="940" id="maintable" border="0" >
				<tbody>
					<tr>
						<td valign="top" nowrap="nowrap" width="20%" bgcolor="#dce6fb" rowspan="2">
							<jsp:include flush="true" page="plantillas/ladoIzquierdoAdmin.jsp"/>
						</td>
					</tr>
					<tr>
				<td width="*" valign="top">
					<center>
					<br><br>
					<%	UsuarioAd uad = null;
						HttpSession sesion = request.getSession(false);
						if (sesion != null)
						{	uad = (UsuarioAd) sesion.getAttribute("usuarioAd");
						}
						if (uad == null || sesion == null)
						{

					%>
					<font class = 'letraAzulTitulo'>Iniciar Sesión Administrador</font>
					<!--  ***************************************************************** -->
					<!-- AQUI SE DEBE MONTAR LO QUE CAMBIA -->
					<form action="InicioSesionAdmin" method="post" name="f1"  >
					<table border="0" class="letraAzul" width="">

							<tr><td>

								Login:
								</td><td>
								<input type="text" name="login" id="letraAzul"  size="10" />

							</td>
							</tr>
							<tr><td>
								Clave:
							</td><td>
								<input type="password" name="clave" id="letraAzul" size="10" />

							</td></tr>

							<tr><td colspan=2" align="center">
								 <br><br><input type="button" value="Enviar" name = "buscar" id="boton" onmouseover="cambiarFondoIn(buscar);"
                                onmouseout="cambiarFondoOut(buscar);" onclick="validadInicioAdmin(f1);"/>

							</td></tr>

					</table>
					</form>
					<%	}
						else
						{	%>
							<font class = 'letraAzulTitulo'>
								Bienvenido Administrador <br>
							</font>
							<font class = 'letra'>Nombre: <%=uad.getNombre()+" "+uad.getApellido() %>
								<br><br>
								Puedes hacer uso del menú en la parte izquierda de esta pantalla
							</font>
						<%
						}
					%>
					</center>
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