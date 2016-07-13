<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@page import="modelo.Cliente, javax.servlet.http.*"%>
<%  HttpSession sesion=request.getSession(false);
%>
<%@page import="modelo.Telefono"%>
<%@page import="java.util.Vector"%>
<%@page import="modelo.Membresia"%>
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
        <CENTER>
            <jsp:include flush="true" page="plantillas/encabezado.jsp"/>
            <table width="940" id="maintable" >
                <tbody>
                    <tr>
                        <td valign="top" width="20%" bgcolor="#eef3f4" rowspan="2">
                            <jsp:include flush="true" page="plantillas/ladoIzquierdo.jsp"/>
                        </td>
                    </tr>
            <tr>
                <td width="*" valign="top"><div style="MARGIN-LEFT: 4px"  align="left">
                    <br/><br/>
                    <!--  ***************************************************************** -->
                    <%if(sesion.getAttribute("cliente") != null){
                        Cliente cli= (Cliente)sesion.getAttribute("cliente");
                        if(cli.getEstatus().equals("p")){%>
	                    <!-- AQUI SE DEBE MONTAR LO QUE CAMBIA -->
	                    <%
	                    Membresia m=new Membresia();
	                    if(m.buscarMembInser(cli.getIdCli())){


	                    %>
	                    <form name="membresia" action="RegistrarMembresia" method="post" >
						        <table border="0" cellpadding="0" cellspacing="0" width="100%" align="center">
						            <tr valign="top">
						                <td width="43%" cellspading="2" align="center" colspan="2">
						                 <font class="letraAzulTitulo" > Membresía </font><br><br>
	                                  </td></tr>
						              <tr>
						              <td width="33%" align="right"><font class="letraAzul">Numero de Tarjeta: &nbsp;&nbsp; </font></td>
						              <td width="32%" align="left"><input name="nTarjetas" type="text" id="nTarjetas" maxlength="30" /></td>
						          </tr>
						          <tr>
						        <td colspan="2" align="center"><br><br>

	                                <input type="submit" name="aceptar" value="Aceptar"  id="boton" onmouseover="cambiarFondoIn(aceptar);"
					      	onmouseout="cambiarFondoOut(aceptar);" onclick=""/>
	                                <input type="reset" value="Cancelar" name="c" id="boton" onmouseover="cambiarFondoIn(c);"
                            onmouseout="cambiarFondoOut(c);" onclick=""></td>
	                                </tr>
						         </table>
						</form>
						<%}else{ %>
						<center><font class="letraAzulTitulo">Estimado(a) <%=cli.getNombre()+" "+cli.getApellido() %></font></center><br><br>
						<font class="letraAzul">Su membresía aun esta en proceso</font>
                    <%
						}
						}else if(cli.getEstatus().equals("m")){

                    	%>
                    	<font class="letraAzulTitulo">Estimado Sr(a): <%out.print(cli.getNombre()+" "+cli.getApellido()); %></font><br><br>
                    	<font class="letraAzul">Ud. ya es usuario con tarjeta activada, no pude volver a solicitar una membresía</font>

                    	<% 	        }else if(cli.getEstatus().equals("a")){

                    		if(cli.modificarEstatus(cli,"p")){
                    		    cli.setEstatus("p");
                    			%>
                    			<form action="EnviarMembresiaServlet">
                    			<font class="letraAzul">Confirma que quiere enviar sus datos para la membresía?

                    			Recuerde que estos datos seran enviados para procesar su solicitud de membresía</font><br>
                    			<input type="submit" value="Confirmar" id="boton">
                    			</form>
                    			<%

                    		}else{
                    			%>
                    			<font class="letraAzulTitulo">Estimado Usuario</font><br><br>
                        <font class="letraAzul">Ha ocurrido un error al solicitar su membresía. Por favor intente de nuevo</font><br>
                    	<%	}
                    	}
                        }else {
                    	%>
                            <font class="letraAzulTitulo">Estimado Usuario</font><br><br>
                        <font class="letraAzul">Para solicitar una membresía, debe registrarse en nuestro sistema previamente.</font><br>
                        <font class="letraAzul">Haga click <a id="a" href="registrate.jsp">aqui</a> para registrarse en nuestro sistema.</font><br><br>
                        <font class="letraAzul">Disculpe los problemas ocacionados.</font><br>
                    <%} %>
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