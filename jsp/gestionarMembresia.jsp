<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="modelo.Cliente"%>
<%@page import="modelo.Membresia"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

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
    <%
   Cliente cli=new Cliente();
   cli = cli.cargarCliente(request.getParameter("correo"));
   String form=request.getParameter("form");
%>

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
                <td width="*" valign="top"><div style="MARGIN-LEFT: 4px"  align="left">

                    <!--  ***************************************************************** -->
                    <!-- AQUI SE DEBE MONTAR LO QUE CAMBIA -->
                <div align="center" class="letraAzul">
  <%
  if(cli!=null){
      if(form.equals("insertar")){
          if(!cli.getEstatus().equals("m") ){ %>
          <form id="form1" name="insMembresia" method="post" action="InsertarMembresia">
            <table width="300" border="0" class="letraAzul">
              <tr>
                <td width="50"><div align="center">Nombre</div></td>
                <td width="50"><div align="center">Apellido</div></td>
                <td width="50"><div align="center">Estatus</div></td>
                <td width="50"><div align="center">Correo</div></td>
                <td width="100"><div align="center">Numero Tarjeta</div></td>
              </tr>
              <tr>
                <td><%out.print(cli.getNombre()); %></td>
                <td><%out.print(cli.getApellido()); %></td>
                <td><%out.print(cli.getEstatus()); %></td>
                <td><%out.print(cli.getCorreo()); %></td>

                <td>
                    <input type="text"  name="nroTarjeta"  />
                    <input type="hidden" name="idCli" value="<%out.print(cli.getIdCli());%>"/>
                    <input type="hidden" name="correo" value="<%out.print(cli.getCorreo());%>"/>

                </td>
              </tr>
              <tr>
                <td colspan="5"><div align="right">

                  <input type="button" name="registrar" value="Registrar" id="boton"
                  onmouseover="cambiarFondoIn(registrar);" onmouseout="cambiarFondoOut(registrar); " onclick="validarMembresia (document.insMembresia)" />
                  <input type="reset"  name="cancelar" value="Cancelar" id="boton"
                  onmouseover="cambiarFondoIn(cancelar);" onmouseout="cambiarFondoOut(cancelar); " />
                </div></td>
              </tr>
            </table>
          </form>

          Leyenda:<br>
       a=Registrado, e=Eliminado, m=Afiliado con tarjeta, p= En proceso de afiliación
        <%}else{ %>

        <font class="letraAzul">El usuario <%out.print(cli.getNombre()+" "+cli.getApellido()); %> Ya posee una membresía</font><br>


        <%}
      }else if(form.equals("eliminar")){
          if(cli.getEstatus().equals("m")){

          Membresia men=new Membresia();
          men=men.cargarMembresia(cli.getIdCli());
          %>

          <form id="form1" name="eliMembresia" method="post" action="EliminarMembresia">
            <table width="300" border="0" class="letraAzul">
              <tr>
                <td width="50"><div align="center">Nombre</div></td>
                <td width="50"><div align="center">Apellido</div></td>
                <td width="50"><div align="center">Estatus</div></td>
                <td width="50"><div align="center">Correo</div></td>
                <td width="100"><div align="center">Nro. Tarjeta</div></td>
              </tr>
              <tr>
                <td ><div align="center"><%out.print(cli.getNombre()); %></div></td>
                <td><div align="center"><%out.print(cli.getApellido()); %></div></td>
                <td><div align="center"><%out.print(cli.getEstatus()); %></div></td>
                <td><div align="center"><%out.print(cli.getCorreo()); %></div></td>

                <td><div align="center">
                    <%out.print(men.getNumeroTarjeta()); %>
                    <input type="hidden" name="idCli" value="<%out.print(cli.getIdCli());%>"/>
                    <input type="hidden" name="correo" value="<%out.print(cli.getCorreo());%>"/>


                </div></td>
              </tr>
              <tr>
                <td colspan="5"><div align="right">

                  <input type="submit" name="registrar" value="Eliminar" id="boton"
                  onmouseover="cambiarFondoIn(registrar);" onmouseout="cambiarFondoOut(registrar); " />

                </div></td>
              </tr>
            </table>
          </form>

          Leyenda:<br>
       a=Registrado, e=Eliminado, m=Afiliado con tarjeta, p= En proceso de afiliación

<%
      }else{%>
            <font class="letraAzul">El usuario <%out.print(cli.getNombre()+" "+cli.getApellido()); %> No posee una membresía</font><br>
      <% }
            }

  }else{ %>
<font class="letraAzul">El usuario No se encuentra registrado. Haga <a href="buscarCliMem.jsp">click aqui</a> para intentar de nuevo</font><br>

<% } %>



</div>


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