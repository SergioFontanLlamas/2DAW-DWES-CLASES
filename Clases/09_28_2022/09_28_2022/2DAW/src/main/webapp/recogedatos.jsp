<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "nombredominio.config.Conexion" %>
<%@page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<h1>Recoger los datos del formulario</h1>
		<p>Nombre: <%= request.getParameter("nombre") %></p>
		<p>Email: <%= request.getParameter("email")%></p>
		<p>Password: <%= request.getParameter("password")%></p>
		
		<%
			/* Enviar datos recibidos del formulario
			a mi base de datos (usuario)*/
			
			Conexion conexion = new Conexion();
			String sql = "INSERT INTO usuarios (nombre, email, password) VALUES ('" +
				request.getParameter("nombre") + "', '" + request.getParameter("email") + "', '" + request.getParameter("password")+"')";

			Class.forName("com.mysql.jdbc.Driver");
			java.sql.Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/proyecto2daw", "root", "");

			java.sql.Statement statement = conn.createStatement();
			statement.executeUpdate(sql);
			
		%>
	</body>
</html>