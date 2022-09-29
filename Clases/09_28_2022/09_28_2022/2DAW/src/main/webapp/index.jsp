<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<h1>HOLA ME LLAMO SERGIO</h1>
		<p>Mi edad es la  siguiente <%= 6+3 %></p>
		
		<!-- HOLA -->
		<%
			for (int i=0; i< 5; i++){
				out.println("<p>El valor de i es: " + i + "</p>");
			}
		//HOLA
		
			
		%>
		
		<%! int i = 0;
		
		public int suma (int a, int b){
			return a+b;
		}
		
		
		%>
		<p>LA SUMA DE 6 y 7 es: </p>
		<%
		
		out.println(suma(6,7));
		%>
	</body>
</html>