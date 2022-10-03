<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="nombredominio.modelsDAO.UsuarioDAO" %>
<%@ page import="nombredominio.models.Usuario" %>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>USUARIOS | EDIT </title>
	</head>
	<body>
		<h1>USUARIOS EDIT</h1>
		<%
		UsuarioDAO usuarioDAO = new UsuarioDAO();
		int id = Integer.parseInt(request.getAttribute("id_usuario").toString());
		Usuario usuario = new Usuario();
		usuario = usuarioDAO.find(id);
		%>
		
		<p><%= usuario.getId() %></p>
        <p><%= usuario.getNombre() %></p>
        <p><%= usuario.getEmail() %></p>

	</body>
</html>