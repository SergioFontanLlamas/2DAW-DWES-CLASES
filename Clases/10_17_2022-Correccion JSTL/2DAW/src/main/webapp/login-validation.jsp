<%
	if(request.getSession().getAttribute("usuario")!= null){
		out.println("<p>EXISTE USUARIO LOGUEADO</p>");
		//out.println(request.getSession().getAttribute("usuario").getEmail());
	}else{
		//Redirigir al login para introducir credenciales
		response.sendRedirect("AuthController?action=login");
	}
%>