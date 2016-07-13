<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%  HttpSession sesion=request.getSession(false);
%>
<%@page import="modelo.Cliente, javax.servlet.http.*"%>
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
                <td width="60%" valign="top"><div style="MARGIN-LEFT: 4px"  align="left">
                    <br/><br/>
                    <!--  ***************************************************************** -->



        <%
        Cliente cli=(Cliente) sesion.getAttribute("cliente");
        if(cli==null){ %>
        <form  name="Registrate"  action="RegistrarCliente" method="post">
        <table border="0" cellpadding="0" cellspacing="0" width="100%" align="center">
    <tr valign="top">
        <td width="43%" cellspading="2" align="center" colspan="2">
		          <font class="letraAzulTitulo" > Registrate</font>

		         </td>
		         </tr>
		      <tr>
		      <td width="33%" align="center"> <font class="letraAzul" >Nombres: </font></td>
		      <td width="32%"><input name="nombres" type="text" id="nombres" maxlength="20"/></td>
		    </tr>
		    <tr>
		      <td align="center"><font class="letraAzul" >Apellidos: </font></td>
		      <td><input name="apellidos" type="text" id="apellidos" maxlength="20"/></td>
		    </tr>
		     <tr>
		      <td align="center"> <font class="letraAzul">Cedula de Identidad: </font></td>
		      <td><input name="ci" type="text" id="ci" maxlength="10" /></td>
		    </tr>
		    <tr>
		      <td align="center"> <font class="letraAzul" >Correo Electronico:  </font></td>
		      <td><input name="correo" type="text" id="correo" maxlength="40"  /></td>
		    </tr>
		    <tr>
		      <td align="center"> <font class="letraAzul">Dirección: </font></td>
		      <td><textarea name="direccion" id="direccion" ></textarea></td>
		    </tr>
		    <tr>
              <td align="center"> <font class="letraAzul">Clave: </font></td>
              <td><input name="clave" type="password"  maxlength="12" /></td>
            </tr>
            <tr>
              <td align="center"> <font class="letraAzul">Verificar Clave: </font></td>
              <td><input name="verificacion" type="password"  maxlength="12" />


              <!-- Aqui esta la validacion para mostrar a ALFREDO -->


                  <input name="img" value="" style="display:none;" /></td>
            </tr>

		     <!-- <tr>
		      <td align="center"> <font class="letraAzul">Validación: </font></td>
		      <td><input name="validacion" type="text" id="validacion" /></td>
		    </tr>-->

		    <tr>
		      <td align="center"> <font class="letraAzul">Telefonos: </font></td>
		      <td><font class="letraAzul"> <br></font>
		              <input name="Telefonos" type="text" id="telf1" maxlength="11"  /><br>
		              <font class="letraAzul"> </font>
		            <input name="telefonos2" type="text" id="telf2" maxlength="11" /><br>
		            <font class="letraAzul"> </font>
		            <input name="telefonos3" type="text" id ="telf3" maxlength="11"/><br>
		      </td>
		    </tr>

		    <tr>
		        <td align="center" colspan="2"><p>&nbsp;

		            <br><input type="button" name="enviar" value="Registrar" class="boton" id="boton" onmouseover="cambiarFondoIn(enviar );"
		             onmouseout="cambiarFondoOut(enviar); " onclick="validarRegistro (document.Registrate)" />
		            <input type="reset" value="Cancelar" id="boton" />
		            </td></tr>
		  </table>
		</form>
<%}else{ %>


            <div align="center"><font class="letraAzultitulo">Sr(a). <%out.print(cli.getNombre()+" "+cli.getApellido()); %></font></div>
            <br><br><br><div align="center"><font class="letraAzulTitulo">Ud. ya es un usuario registrado.</font></div>
			<br><br><br><a href = 'index.jsp' id= 'a'>Volver</a>


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