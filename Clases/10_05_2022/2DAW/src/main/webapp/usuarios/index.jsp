<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>   
<%@ page import="nombredominio.modelsDAO.UsuarioDAO" %>
<%@ page import="nombredominio.models.Usuario" %>
<%@ page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>USUARIOS | index</title>
		<link href="resources/css/style.css" type="text/css" rel="stylesheet">
	</head>
	<body>
		<h1>USUARIOS INDEX</h1>
		<a href="UsuariosController?action=create">Crear usuario</a>
		<table>
			<div class="row">
		        <div class="col-lg-4"></div>
			        <div class="col-lg-4">
			            <table class="table">
			                <thead>
			                    <tr>
			                        <th scope="col">#</th>
			                        <th scope="col">Nombre</th>
			                        <th scope="col">Email</th>
			                        <th scope="col"></th>
			                    </tr>
			                </thead>
			                <tbody class="table-group-divider">
			                <%
			                	UsuarioDAO usuarioDAO = new UsuarioDAO();
			                	ArrayList<Usuario> usuarios = usuarioDAO.all();
			                	
			                	for (int i= 0; i < usuarios.size(); i++){
			                		Usuario usuario = usuarios.get(i);
			                %>
			                    <tr>
			                        <td><%= usuario.getId() %></td>
			                        <td><%= usuario.getNombre() %></td>
			                        <td><%= usuario.getEmail() %></td>
			                        <td>
				                        <a href="UsuariosController?action=edit&id=<%= usuario.getId() %>">Edit</a>
				                        <a href="UsuariosController?action=delete&id=<%= usuario.getId() %>">Delete</a>
			                        </td>
			                    </tr>
			                    <%} %>
			                </tbody>
			            </table>
			        </div>
		        <div class="col-lg-4"></div>
		    </div>
		</table>
	</body>
</html>