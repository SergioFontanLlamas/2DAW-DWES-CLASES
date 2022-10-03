package nombredominio.controllers;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import nombredominio.models.Usuario;
import nombredominio.modelsDAO.UsuarioDAO;

import java.io.IOException;

/**
 * Servlet implementation class UsuariosController
 */
public class UsuariosController extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	String acceso; // Variable que distingue entre las vistas a las que tengo que redireccionar
	String action; // Variable que recibo por URL y que me enlaza con el metodo/vista correspondiente
	
	Usuario usuario;
	UsuarioDAO usuarioDao;
	
	String nombre, email, password;
	
	String index = "usuarios/index.jsp";
	String create = "usuarios/create.jsp";
	String edit = "usuarios/edit.jsp";
	
	int id;
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		acceso = "";
		action =  request.getParameter("action"); // valor que recojo por url 
		
		switch (action) {
			case "index":
				acceso = index;
				break;
				
			case "create":
				acceso = create;
				break;
				
			case "edit":
				// Recojo el ID por URL
				id = Integer.parseInt(request.getParameter("id"));
				
				// Envio ID recogido por URL
				request.setAttribute("id_usuario", id);
				
				acceso = edit;
				break;
	
			default:
				
				break;
		}
		
		// Lanzar la vista en funcion del action recibido
		RequestDispatcher vista = request.getRequestDispatcher(acceso);
		vista.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
