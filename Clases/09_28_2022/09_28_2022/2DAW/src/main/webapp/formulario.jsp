<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<h1>formulario</h1>
		<form action="recogedatos.jsp">
			<p>NOMBRE: </p>
			<input type="text" name="nombre">
			
			<p>Email</p>
			<input type="text" name="email">
			
			<p>Password</p>
			<input type="text" name="password">
			
			<button type="submit">Enviar</button>
		</form>
	</body>
</html>