package modelo;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Imagen implements Serializable {

	private static final long serialVersionUID = 1L;
	private String rutaImagen;
	private String principal;
	private int idImagen;
	private int idProductos;
	private int idNoticias;

	public Imagen(){
		this.rutaImagen="";
		this.principal="";
		this.idImagen=0;
		this.idNoticias=0;
		this.idProductos=0;

	}

	public boolean insertarImagenN(Imagen img){

		boolean res=false;
		Connection con=null;

		con=Conexion.conectar();
		try {
			if (con != null){

					PreparedStatement is= con.prepareStatement("Insert into imagen (rutaImagen,principal,idImagen,id) values(?,?,?,?);");
					is.setString(1, img.getRutaImagen());
					is.setString(2, img.getPrincipal());
					is.setInt(3, img.getIdImagen());
					is.setInt(4, img.getIdNoticias());


					if(is.executeUpdate()!=0)
					{
						res=true;
					}

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			Conexion.cerrarConeccion(con);
		}

		return res;

	}
	public boolean insertarImagenP(Imagen img){

		boolean res=false;
		Connection con=null;

		con=Conexion.conectar();
		try {
			if (con != null){

					PreparedStatement is= con.prepareStatement("Insert into imagen (rutaImagen,principal,idImagen,idProductos) values(?,?,?,?);");
					is.setString(1, img.getRutaImagen());
					is.setString(2, img.getPrincipal());
					is.setInt(3, img.getIdImagen());
					is.setInt(4, img.getIdProductos());


					if(is.executeUpdate()!=0)
					{
						res=true;
					}

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			Conexion.cerrarConeccion(con);
		}

		return res;

	}
	public boolean modificarImagenP(Imagen img){

		boolean res=false;
		Connection con=null;

		con=Conexion.conectar();
		try {
			if (con != null){

					PreparedStatement is= con.prepareStatement("update imagen set rutaImagen = ? where idImagen = ?");
					is.setString(1, img.getRutaImagen());
					is.setInt(2, img.getIdImagen());

					if(is.executeUpdate()!=0)
					{
						res=true;
					}

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			Conexion.cerrarConeccion(con);
		}

		return res;

	}

	public Imagen buscarImagenN(int id)
	{	Imagen i = null;
		Connection con = Conexion.conectar();
		try {
			if (con != null)
			{	PreparedStatement ps = con.prepareStatement("select * from imagen where id = ?");
				ps.setInt(1, id);
				ResultSet rs = ps.executeQuery();
				if (rs.next())
				{	i = new Imagen();
					i.setRutaImagen(rs.getString(1));
					i.setPrincipal(rs.getString(2));
					i.setIdImagen(rs.getInt(3));
					i.setIdNoticias(rs.getInt(5));
				}

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally
		{	Conexion.cerrarConeccion(con);

		}


		return i;
	}







	public String getRutaImagen() {
		return rutaImagen;
	}

	public void setRutaImagen(String rutaImagen) {
		this.rutaImagen = rutaImagen;
	}

	public String getPrincipal() {
		return principal;
	}

	public void setPrincipal(String principal) {
		this.principal = principal;
	}

	public int getIdImagen() {
		return idImagen;
	}

	public void setIdImagen(int idImagen) {
		this.idImagen = idImagen;
	}

	public int getIdProductos() {
		return idProductos;
	}

	public void setIdProductos(int idProductos) {
		this.idProductos = idProductos;
	}

	public int getIdNoticias() {
		return idNoticias;
	}

	public void setIdNoticias(int idNoticias) {
		this.idNoticias = idNoticias;
	}

}
