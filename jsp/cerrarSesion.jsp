<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import = "javax.servlet.http.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cerrar sesion</title>
</head>
<body>
<%

HttpSession sesion=request.getSession(false);
sesion.invalidate();
RequestDispatcher redireccion= request.getRequestDispatcher("index.jsp");
redireccion.forward(request,response);


%>
</body>
</html>