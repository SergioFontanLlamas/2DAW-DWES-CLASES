<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="nombredominio.modelsDAO.UsuarioDAO" %>
<%@page import="nombredominio.models.Usuario" %>


<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
	<h1>Usuario eliminado correctamente</h1>
	<%!
			UsuarioDAO usuarioDAO = new UsuarioDAO();
		%>
		
		<%= usuarioDAO.eliminar(
				Integer.parseInt(request.getParameter("id"))
				) %>
	</body>
</html>