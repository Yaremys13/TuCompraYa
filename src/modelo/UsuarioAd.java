package modelo;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UsuarioAd implements Serializable {

	private static final long serialVersionUID = 1L;
	private int idAdm;
	private String nombre;
	private String apellido;
	private String login;
	private String correo;
	private String clave;
	private String estatus;
	private String nivel;

	public UsuarioAd(){
		this.idAdm=0;
		this.nombre="";
		this.apellido="";
		this.login="";
		this.correo="";
		this.clave="";
		this.estatus="";

	}

	public int getId() {
		return idAdm;
	}

	public void setId(int id) {
		this.idAdm = id;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getApellido() {
		return apellido;
	}

	public void setApellido(String apellido) {
		this.apellido = apellido;
	}

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getCorreo() {
		return correo;
	}

	public void setCorreo(String correo) {
		this.correo = correo;
	}

	public String getClave() {
		return clave;
	}

	public void setClave(String clave) {
		this.clave = clave;
	}

	public String getEstatus() {
		return estatus;
	}

	public void setEstatus(String estatus) {
		this.estatus = estatus;
	}

	public String getNivel() {
		return nivel;
	}

	public void setNivel(String nivel) {
		this.nivel = nivel;
	}
	public UsuarioAd iniciarSesion(String login, String clave){
    	UsuarioAd uad= null;
        Connection con=Conexion.conectar();

        ResultSet rs;
        String sql="select * from usuarioad where login='"+login+"' and clave='"+clave+
        "' and estatus <> 'e' and nivel = 'a';";

        try {

			Conexion.sentencia=con.createStatement();
			rs=Conexion.sentencia.executeQuery(sql);
			if(rs.next()){
				uad= new UsuarioAd();
				uad.setNombre(rs.getString(2));
				uad.setApellido(rs.getString(3));
				uad.setCorreo(rs.getString(6));
				uad.setId(rs.getInt(1));
				uad.setLogin(rs.getString(4));
				uad.setClave(rs.getString(5));
				uad.setEstatus(rs.getString(7));
				uad.setNivel(rs.getString(8));
			}


		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally
		{	Conexion.cerrarConeccion(con);
		}

		return uad;

    }

}
