<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link href="resources/css/style.css" >
	</head>
	<body>
		<h1>formulario BUSCAR</h1>
		<form action="resultadobuscar.jsp">
			<p>ID: </p>
			<input type="text" name="id">
			
			<button type="submit">Buscar</button>
		</form>
		
		<h1>formulario ELIMINAR</h1>
		<form action="resultadoeliminar.jsp">
			<p>ID: </p>
			<input type="text" name="id">
			
			<button type="submit">Eliminar</button>
		</form>
	</body>
</html>