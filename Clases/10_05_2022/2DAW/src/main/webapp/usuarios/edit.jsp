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

        <form method="POST" action="UsuariosController?action=update">
        	
        	<input type="hidden" name="id" value="<%= usuario.getId() %>">
        	<p>Nombre:</p>
        	<input type="text" name="nombre" value="<%= usuario.getNombre() %>">
        	<br>
        	<p>Email:</p>
        	<input type="email" name="email" value="<%= usuario.getEmail() %>">
        	<br>
        	
        	<button type="submit">Actualizar</button>
        </form>

	</body>
</html>