<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
                <form  name="ModificarCliente"  action="gestionarMembresia.jsp" method="post">
                        <table border="0" cellpadding="0" cellspacing="0" width="100%" align="center">
                        <tr valign="top">
                        <td width="43%" align="center" colspan="2">
                           <font class="letraAzulTitulo"> Buscar Cliente </font><br><br>
                           <font class="letraAzulSubTitulo">Insertar</font>
                          <br/>
                         </td>
                    </tr>
                      <tr>
                          <td align="center">
                            <font class="letraAzul">Correo Electronico: </font>
                          </td>
                          <td>
                          <input name="correo" type="text" id="correo" />
                          <input type="hidden" name="form" value="insertar" />
                          </td>
                         </tr>
                         <tr>
                          <td colspan = 2 align = "center">
                            <font class="letraAzulComentario">Inserte el correo de un usuario el cual haya solicitado una membresia, para asi registrar el codigo.</font>
                            <br/><br/>
                            <input type="button" name="buscar" value="Buscar" id="boton" onmouseover="cambiarFondoIn(buscar);"
                             onmouseout="cambiarFondoOut(buscar); " onclick="validarBCMI (document.ModificarCliente)" />
                          </td>
                        </tr>
                    </table>
                </form>

                <hr>
                <form  name="eliminarCliente"  action="gestionarMembresia.jsp" method="post">
                        <table border="0" cellpadding="0" cellspacing="0" width="100%" align="center">
                        <tr valign="top">
                        <td width="43%" align="center" colspan="2">
                            <font class="letraAzulSubTitulo">Eliminar</font>
                          <br/>
                         </td>
                    </tr>
                      <tr>
                          <td align="center">
                            <font class="letraAzul">Correo Electronico: </font>
                          </td>
                          <td>
                          <input name="correo" type="text" id="correo" />
                          <input type="hidden" name="form" value="eliminar" />
                          </td>
                         </tr>
                         <tr>
                          <td colspan = 2 align = "center">
                            <font class="letraAzulComentario">Inserte el correo del usuario que desea eliminar su membresía.</font>
                            <br/><br/>
                            <input type="button" name="buscar" value="Buscar" id="boton" onmouseover="cambiarFondoIn(buscar);"
                             onmouseout="cambiarFondoOut(buscar); " onclick="validarBCMI (document.eliminarCliente)" />
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
    <jsp:include flush="true" page="plantillas/pie.jsp" />
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