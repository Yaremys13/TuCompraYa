<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@page import="modelo.Cliente"%>
<%@page import="modelo.Telefono"%>
<%@page import="java.util.Vector"%>
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
		<jsp:include flush="true" page="plantillas/encabezadoAdmin.jsp"/>
		<table width="940" id="maintable" >
				<tbody>
					<tr>
						<td valign="top" nowrap="nowrap" width="20%" bgcolor="white" rowspan="2">
							<jsp:include flush="true" page="plantillas/ladoIzquierdo.jsp"/>
						</td>
					</tr>
			<tr>
				<td width="*" valign="top"><div style="MARGIN-LEFT: 4px"  align="left">
					<br/><br/>
					<form name="ModificarCliente"  action="ModificarCliente" method="post">

					<!--  ***************************************************************** -->
					<!-- AQUI SE DEBE MONTAR LO QUE CAMBIA -->
					<%! Cliente c= new Cliente(); %>
				  	<%  String[] telfs = new String[3];
				        HttpSession sesion = request.getSession(false);
				  		if (sesion != null)
				  			c= (Cliente) sesion.getAttribute("cliente");
				  		if (c != null) {
				  		    Vector tc= new Telefono().buscarTelefonoCliente(c.getIdCli());
				  		    if (tc != null)
				  		    {   Iterator it= tc.iterator();
				  		        int i=0;
				  		        while (it.hasNext())
				  		        {  Telefono t = (Telefono) it.next();
				  		    	   %>
				  		    	   <input type = "hidden" name = "telefono<%=i%>" value = "<%=t.getIdTlf() %>"/>
				  		    	<%
				  		    	telfs[i]=t.getNumeroTelefono();
				  		    	   i++;
				  		        }
				  		    }
				  %>
					<input type = "hidden" value = "<%=c.getCorreo()%>" name = "correo"/>
						<table border="0" cellpadding="0" cellspacing="0" width="100%" align="center">
	    				<tr valign="top">
	        			<td width="43%" align="center" colspan="2">
			          	<font class="letraAzulTitulo"> Modificar datos del Cliente </font>
						<br/>
						<br/>
	         			</td>
	        	 	</tr>
		      		<tr>
					      <td width="33%" align="center">
					      	<font class="letraAzul">Nombres: </font>
					      </td>
	      				<td width="32%">
	      					<input name="nombres" type="text" id="nombres" value="<%= c.getNombre() %>"/>
	      				</td>
	    				</tr>
	    				<tr>
	      				<td align="center"> <h2>
	      					<font class="letraAzul">Apellidos: </font>
	      				</td>
	      				<td>
	      					<input name="apellidos" type="text" id="apellidos" value="<%= c.getApellido() %>"/>
	      				</td>
				    	</tr>
				     	<tr>
				      	<td align="center">
				      		<font class="letraAzul">Cedula de Identidad: </font>
				      	</td>
				      	<td>
				      		<input name="ci" type="text" id="ci" maxlength="10" value="<%= c.getCedula() %>"/>
				      	</td>

					    </tr>
					    <tr>
                        <td align="center">
                            <font class="letraAzul">Correo: </font>
                        </td>
                        <td>
                            <input name="correo" type="text" id="ci" maxlength="10" disabled="disabled" value="<%= c.getCorreo() %>"/>
                        </td>

                        </tr>
					    <tr>
					      <td align="center">
					      	<font class="letraAzul">Dirección: </font>
					      </td>
					      <td>
					      	<textarea name="direccion" id="direccion" /><%= c.getDireccion() %></textarea>
					      </td>
				  	  </tr>
					    <tr>
                          <td align="center">
                            <font class="letraAzul">Clave: </font>
                          </td>
                          <td>
                            <input name="contrasenia" type="password" maxlength="7" value="<%= c.getClave() %>"/>
                          </td>
                        </tr>
                        <tr>
                          <td align="center">
                            <font class="letraAzul">Vefificar clave: </font>
                          </td>
                          <td>
                            <input name="verificacion" type="password" id="clave" maxlength="7" value=""/>
                          </td>
                        </tr>
					    <tr>
					      <td align="center">
					      	<font class="letraAzul">Telefonos: </font>
					      </td>
				  	    <td><input name="telefonos" type="text" id="telf1" maxlength="11" value = "<%= telfs[0] %>" />
				            <% if (telfs[1]!= null)
				                {
				            %>
				            <input name="telefonos2" type="text" id="telf2" maxlength="11" value="<%=telfs[1]%>" />
				            <%} if (telfs[2]!= null)
				            {%>
				            <input name="telefonos3" type="text" id="telf3" maxlength="11" value="<%=telfs[2] %>"/>
				            <%} %>
					      </td>
					    </tr>
					    <tr>
				        <td align="center" colspan="2">
									<br/><br/>
									<input type="button" name="modificar" value="Modificar"	 id="boton" onmouseover="cambiarFondoIn(modificar);"
					      	onmouseout="cambiarFondoOut(modificar);" onclick="modificarReg(document.ModificarCliente);" />
					        <input type="reset" name="cancelar" value="Cancelar"  id="boton" onmouseover="cambiarFondoIn(cancelar);"
					      	onmouseout="cambiarFondoOut(cancelar);" />
				        </td>
				      </tr>
				  	</table>
					</form>
					<%} else
						{
					%>
						<h2 class = "letraAzulTitulo" align = "center"> Cliente no Encontrado </h2>
						<br/><br/>
						<a href = 'indexAdmin.jsp' class = 'letra'>Volver</a>
					<%}

				  %>

				<!--  ***************************************************************** -->
				</td>
				<td valign="top" nowrap="nowrap" width="20%" bgcolor="#dce6fb" rowspan="2">
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