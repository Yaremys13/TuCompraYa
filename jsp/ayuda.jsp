<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@page import="java.util.Vector"%>
<%@page import="modelo.Productos"%>
<%@page import="modelo.Imagen"%>
<%@page import="java.util.Iterator"%>
<HTML>
    <HEAD>
        <TITLE>TUCOMPRAYA.COM - Corporaci�n de Redes Tecnol�gicas</TITLE>
        <META http-equiv=Content-Type content="text/html; charset=iso-8859-1">
        <META content="Compra, Venta, Equipos de Computaci�n, Consolas de Video Juego, Compra Ya, Tu compra, Excelentes Precios" name=keywords>
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
                        <td valign="top" nowrap="nowrap" width="20%" bgcolor="#eef3f4" rowspan="2">
                            <jsp:include flush="true" page="plantillas/ladoIzquierdo.jsp"/>
                        </td>
                    </tr>
            <tr>
                <td width="*" valign="top"><div style="MARGIN-LEFT: 4px"  align="left">
                    <br/><br/>
                    <!--  ***************************************************************** -->
                    <!-- AQUI SE DEBE MONTAR LO QUE CAMBIA -->

                    <font class="letraAzulTitulo">FAQ/Preguntas Frecuentes</font><br><br>

                <font class="letraAzul">

                �Puedo comprar en tucompraya.com sin tener la membrec�a?<br>
                Si puede realizar las compras sin ser socio, no obstante recuerde que como socio de tucompraya.com
                 siempre va obtener el mejor precio en los art�culos que encontrara en nuestra p�gina.<br><br>

                �C�mo me afilo a tucompraya.com?<br>
                Es muy f�cil ser socio de tucompraya.com solo tiene que ir al link de cont�ctenos
                 y llenar el cuestionario para que uno de nuestros ejecutivos se comunique con usted y as� comenzar a disfrutar de su
                 membrec�a de tucompraya.com<br><br>

                �Puedo comprar productos que no aparecen publicados en la p�gina?<br>

                No debido a que tucompraya maneja �nica y exclusivamente con los productos
                que ofrece en su p�gina web.<br><br>

                �C�mo compro en tucompraya.com?<br>

                Para comprar en tucompraya.com, debe seleccionar el o los productos que desea,
                agregarlos al carrito de compras y seguir los pasos de nuestro instructivo de compra, el cual puede ver haciendo click <a id="a" href="comoComprar.jsp">AQUI</a><br><br>

                �Que garant�a tienen los productos y como aplica?<br>
                Todos nuestros productos tienen 30 d�as de garantia y para que esta se valida el
                 producto debe ser devuelto con todos sus accesorios y en su caja como vino originalmente. Los gastos por env�os para
                 cubrir la garant�a corren por cuenta del cliente.<br><br>

                �En cu�nto tiempo recibir� mi producto?<br>
                El envi� del producto tardara de 2 a 15 d�as h�biles una vez el pago sea verificado
                 por nuestros agentes.<br><br>

                �Cu�nto cuesta el env�o de los productos?<br>

                Todos nuestros precios no incluyen envio en territorio nacional, el precio del envio
                varia por el peso o tama�o del producto y ser� cobro a destino.<br><br>
                �Es seguro utilizar mi tarjeta de cr�dito?<br>

                tucompraya.com cuenta con un certificado de seguridad SSL 128-bits para encriptar la
                 informaci�n suministrada por los usuarios al ingresar sus datos para registro o compra.
                   Dicho certificado se encuentra activo en las p�ginas que los clientes utilizan para ingresar datos,
                   en las que podr� ver el s�mbolo del candado en su explorador de Internet.<br><br>

                �Qu� m�todos de pago aceptan?<br>

                tucompraya.com aceptamos tarjetas de cr�dito Visa y Mastercard emitidas por bancos en
                 Venezuela, transferencias bancarias, dep�sitos.<br><br>
                �Tengo que pagar impuestos por mi compra?<br>

                Todos nuestros precios incluyen impuestos, usted s�lo deber� pagar el precio publicado
                 en la p�gina<br><br>

                �C�mo puedo ponerme en contacto con ustedes?<br>

                Para otras preguntas e informaci�n adicional, puede utilizar nuestra planilla de contacto,
                haciendo click <a id="a" href="contactanos.jsp">AQU�</a> o escribi�ndonos directamente a contactanos@tucompraya.com.<br><br>


                Membrec�a?<br>
                Al ser socio de tucompraya.com usted va a disfrutar de la experiencia m�s c�moda, segura y econ�mica de las compras de productos por internet.
                Como socio va a obtener el mejor precio del mercado de lo
                �ltimo en productos tecnol�gicos, adem�s disfrutara de ofertas especiales y tips informativo de lo ultimo en tecnolog�a.<br>
                Si quiere comenzar a disfrutar de su membrec�a escribanos a contactanos@tucompraya.com o haga click en <a id="a" href="contactanos.jsp">cont�ctanos</a>.<br><br>
                Como comprar?<br>
                Tiene 2 opciones una al tener la membrec�a  de tucompraya.com y la otra sin tener la membrec�a, sin embargo el procedimiento es el mismo lo que varia es el costo final.<br><br>




                                </font>

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