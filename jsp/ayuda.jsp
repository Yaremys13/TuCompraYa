<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@page import="java.util.Vector"%>
<%@page import="modelo.Productos"%>
<%@page import="modelo.Imagen"%>
<%@page import="java.util.Iterator"%>
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

                ¿Puedo comprar en tucompraya.com sin tener la membrecía?<br>
                Si puede realizar las compras sin ser socio, no obstante recuerde que como socio de tucompraya.com
                 siempre va obtener el mejor precio en los artículos que encontrara en nuestra página.<br><br>

                ¿Cómo me afilo a tucompraya.com?<br>
                Es muy fácil ser socio de tucompraya.com solo tiene que ir al link de contáctenos
                 y llenar el cuestionario para que uno de nuestros ejecutivos se comunique con usted y así comenzar a disfrutar de su
                 membrecía de tucompraya.com<br><br>

                ¿Puedo comprar productos que no aparecen publicados en la página?<br>

                No debido a que tucompraya maneja única y exclusivamente con los productos
                que ofrece en su página web.<br><br>

                ¿Cómo compro en tucompraya.com?<br>

                Para comprar en tucompraya.com, debe seleccionar el o los productos que desea,
                agregarlos al carrito de compras y seguir los pasos de nuestro instructivo de compra, el cual puede ver haciendo click <a id="a" href="comoComprar.jsp">AQUI</a><br><br>

                ¿Que garantía tienen los productos y como aplica?<br>
                Todos nuestros productos tienen 30 días de garantia y para que esta se valida el
                 producto debe ser devuelto con todos sus accesorios y en su caja como vino originalmente. Los gastos por envíos para
                 cubrir la garantía corren por cuenta del cliente.<br><br>

                ¿En cuánto tiempo recibiré mi producto?<br>
                El envió del producto tardara de 2 a 15 días hábiles una vez el pago sea verificado
                 por nuestros agentes.<br><br>

                ¿Cuánto cuesta el envío de los productos?<br>

                Todos nuestros precios no incluyen envio en territorio nacional, el precio del envio
                varia por el peso o tamaño del producto y será cobro a destino.<br><br>
                ¿Es seguro utilizar mi tarjeta de crédito?<br>

                tucompraya.com cuenta con un certificado de seguridad SSL 128-bits para encriptar la
                 información suministrada por los usuarios al ingresar sus datos para registro o compra.
                   Dicho certificado se encuentra activo en las páginas que los clientes utilizan para ingresar datos,
                   en las que podrá ver el símbolo del candado en su explorador de Internet.<br><br>

                ¿Qué métodos de pago aceptan?<br>

                tucompraya.com aceptamos tarjetas de crédito Visa y Mastercard emitidas por bancos en
                 Venezuela, transferencias bancarias, depósitos.<br><br>
                ¿Tengo que pagar impuestos por mi compra?<br>

                Todos nuestros precios incluyen impuestos, usted sólo deberá pagar el precio publicado
                 en la página<br><br>

                ¿Cómo puedo ponerme en contacto con ustedes?<br>

                Para otras preguntas e información adicional, puede utilizar nuestra planilla de contacto,
                haciendo click <a id="a" href="contactanos.jsp">AQUÍ</a> o escribiéndonos directamente a contactanos@tucompraya.com.<br><br>


                Membrecía?<br>
                Al ser socio de tucompraya.com usted va a disfrutar de la experiencia más cómoda, segura y económica de las compras de productos por internet.
                Como socio va a obtener el mejor precio del mercado de lo
                último en productos tecnológicos, además disfrutara de ofertas especiales y tips informativo de lo ultimo en tecnología.<br>
                Si quiere comenzar a disfrutar de su membrecía escribanos a contactanos@tucompraya.com o haga click en <a id="a" href="contactanos.jsp">contáctanos</a>.<br><br>
                Como comprar?<br>
                Tiene 2 opciones una al tener la membrecía  de tucompraya.com y la otra sin tener la membrecía, sin embargo el procedimiento es el mismo lo que varia es el costo final.<br><br>




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