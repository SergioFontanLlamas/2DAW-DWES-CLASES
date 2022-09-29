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
		<%!
			UsuarioDAO usuarioDAO = new UsuarioDAO();
		%>
		
		<%= usuarioDAO.buscar(
				Integer.parseInt(request.getParameter("id"))
				).getEmail() %>
	</body>
</html>