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
                        <td valign="top" width="20%" bgcolor="#dce6fb" rowspan="2">
                            <jsp:include flush="true" page="plantillas/ladoIzquierdo.jsp"/>
                        </td>
                    </tr>
            <tr>
                <td width="*" valign="top"><div style="MARGIN-LEFT: 4px"  align="left">
                    <br/><br/>
                    <!--  ***************************************************************** -->
                    <font class="letra"  ><% out.print(request.getParameter("mensaje")); %></font>
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