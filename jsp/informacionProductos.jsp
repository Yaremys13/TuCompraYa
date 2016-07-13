<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%  HttpSession sesion=request.getSession(false);
%>
<%@page import="modelo.Cliente, javax.servlet.http.*"%>
<%@page import="modelo.Productos"%>
<%@page import="modelo.Imagen"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.text.NumberFormat"%>
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
            <script language="javascript" type="text/javascript">
		        function ir(valor)
		        {   document.f1.producto.value = valor.name;

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
                        <td valign="top" width="20%" bgcolor="#eef3f4" rowspan="2">
                            <jsp:include flush="true" page="plantillas/ladoIzquierdo.jsp"/>
                        </td>
                    </tr>
            <tr>
                <td width="*" valign="top"><div style="MARGIN-LEFT: 4px"  align="left">
                    <br/><br/>
                    <!--  ***************************************************************** -->

                    <%	NumberFormat nf = NumberFormat.getInstance();
						nf.setMinimumFractionDigits(2);
						nf.setMaximumFractionDigits(2);

                    if(request.getParameter("codigoVerificacion")!=null){
                    	Cliente c=(Cliente)sesion.getAttribute("cliente");
                        Productos p=new Productos();
                        p=p.buscarProducto(request.getParameter("codigoVerificacion"));

                        if(p!=null){
						%>
		                <div align="center"><font class="letraAzulTitulo"><%=p.getNombre() %></font></div>
						<%
                        Imagen img= new Imagen();

                        Iterator it=p.getImagenes().iterator();

                        img=(Imagen) p.getImagenes().elementAt(0);
                    %>
                            <table width="500" align="center" border="0" >
                                  <tr><td width="354" style="padding-bottom: 95%;">
                                <form name = "f1" action="CarritoServlet" method="get">
                                <table width="250" border="0"  >

                                  <%
                                  int cont=1;
                                  while(it.hasNext()){

                                      img=(Imagen)it.next();

                                      %>
                                     <tr><td align="center" style="">

                                      <img  src="<%out.print(img.getRutaImagen());%>" width="200" border="0" /><br><br>

                                       </td></tr>
                                      <%}
                                  %>
                                    <tr>
                                    <td colspan="3"><div align="center">
                                    <% out.print("<br><input type='button' value='Añadir al Carrito' name = '"+p.getCodigoVerificacion()+"' id='botonCarrito' onmouseover='cambiarFondoInCarrito(this);'" +
                                    "onmouseout='cambiarFondoOutCarrito(this);' onclick='ir(this);'/></td>");%>
                                    <input type='hidden' name = 'producto'/>
                                    </div></td>
                                  </tr>
                                </table>
                                </form>
                                </td><td width="328" style="padding-bottom: 95%;">
                                    <table width="250" border="0">
                                  <tr>
                                    <td width="20" align="center"><font  class="letraContenido" style="padding-bottom:   100%;"><b>Código:</b> <%=p.getCodigoVerificacion() %></font></td>
                                    <td width="20" align="center" colspan="2"><font  class="letraContenido" style="padding-bottom:   100%;"></td>
                                  </tr>
                                  <tr>
                                    <%if(c == null){ %>
                                    <td height="52" align="left" class="letraContenido" width="70%">Recuerde <a href="membresia.jsp" id="a">afiliarse</a> para precios más economicos</td>
                                    <td align="center" class="letraContenido" colspan="2" ><b>Precio:</b> <br>Bs. <%=nf.format(p.getPrecioCliente())%></td>

                                    <%



                                    }else {
                                    	if(c.getEstatus().equals("m")){
                                        float ahorro=p.getPrecioCliente()-p.getPrecioMiembro();
                                    %>
                                        <td height="52" align="center" class="letraContenido"><b>Precio Cliente:</b> <br>Bs. <%=nf.format(p.getPrecioCliente())%></td>
                                        <td align="center" class="letraContenido"  ><b>Precio Miembro:</b><br>Bs. <%=nf.format(p.getPrecioMiembro())%> </td>
                                        <td align="center" class="letraContenido"  ><b>Ahorro:</b><br><br>Bs. <%=nf.format(ahorro) %> </td>
                                    <%}else{%>

                                    	<td height="52" align="left" class="letraContenido" width="70%">Recuerde <a href="membresia.jsp" id="a">afiliarse</a> para precios más economicos</td>
                                    <td align="center" class="letraContenido" colspan="2" ><b>Precio:</b> <br>Bs. <%=nf.format(p.getPrecioCliente())%> </td>



                                   <% }} %>

                                    </tr>
                                    <tr>
                                    <td  colspan="3" align="left"><font class="letraContenido" style="padding-bottom: 95%;"><b>Descripción:</b><br><br><%=p.getDescripcion() %></font></td>
                                    </tr>

                                </table>


                                </td></tr>
                                </table>

                <%
                }else{%>

                    <br><br><font class="letraAzul">No hay Productos de este tipo. haga click <a id="a" href="galeriaProductos.jsp">aqui</a> para ir a la galeria</font>

                <% }
                        }else{ %>


                <br><br><font class="letraAzul">No ha seleccionado ningun producto haga click <a id="a" href="galeriaProductos.jsp">aqui</a> para ir a la galeria</font>

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