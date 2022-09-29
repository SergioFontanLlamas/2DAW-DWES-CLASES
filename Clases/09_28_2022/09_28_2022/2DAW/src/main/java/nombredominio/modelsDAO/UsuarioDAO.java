/**
 * 
 */
package nombredominio.modelsDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import nombredominio.config.Conexion;
import nombredominio.models.Usuario;

/**
 * @author sergio
 *
 */
public class UsuarioDAO {
	
	Conexion conexion = new Conexion();
	
	Connection conn;
	PreparedStatement ps;
	ResultSet rs;
	Statement statement;
	
	Usuario usuario = new Usuario();
	ArrayList<Usuario> usuarios = new ArrayList<Usuario>();
	
	public boolean crear() {
		return true;
	}
	
	public boolean eliminar(int id) {
		String sql = "DELETE FROM usuarios WHERE id = " + id;
		conn = conexion.getConnection();
		
		try {
			statement = conn.createStatement();
			statement.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return true;
	}
	
	public boolean actualizar() {
		return true;
	}
	
	public Usuario buscar(int id) {
		String sql = "SELECT * FROM usuarios WHERE id = " + id;
		
		try {
			conn = conexion.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				usuario.setId(rs.getInt("id"));
				usuario.setNombre(rs.getString("nombre"));
				usuario.setEmail(rs.getString("email"));
				usuario.setPassword(rs.getString("password"));
				
				return usuario;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public ArrayList<Usuario> getUsuarios(){
		return null;
	}
}
