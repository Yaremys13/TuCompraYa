package modelo;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

public class TipoProducto implements Serializable {

	private static final long serialVersionUID = 1L;
	private int idTp;
	private String nombre;

	public TipoProducto(){
		this.idTp=0;
		this.nombre="";
	}

	public int getId() {
		return idTp;
	}

	public void setId(int id) {
		this.idTp = id;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	//Metodos de negocio
	public Vector buscarCategorias()
	{	Vector cats = null;
		Connection con = null;
		con = Conexion.conectar();
		try {
			if (con != null)
			{	PreparedStatement ps = con.prepareStatement("select * from tipoproducto");
				ResultSet rs = ps.executeQuery();
				int ban = 0;
				TipoProducto tp = null;
				while (rs.next())
				{	if (ban == 0)
					{	cats = new Vector();
						ban++;
					}
					tp = new TipoProducto();
					tp.setId(rs.getInt(1));
					tp.setNombre(rs.getString(2));
					cats.add(tp);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally
		{	try {
				if (con != null)
					con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return cats;
	}

	/*public TipoProducto[] buscarCategorias(String cad)
	{	Vector cats = null;
		Connection con = null;
		con = Conexion.conectar();
		TipoProducto tp[] = new TipoProducto();
		try {
			if (con != null)
			{	PreparedStatement ps = con.prepareStatement("select * from tipoproducto");
				ResultSet rs = ps.executeQuery();
				int ban = 0;

				int bandera=0;
				while (rs.next())
				{	if (ban == 0)
					{	cats = new Vector();
						ban++;
					}

					tp[bandera].setId(rs.getInt(1));
					tp[bandera].setNombre(rs.getString(2));
					cats.add(tp);
					bandera++;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally
		{	try {
				if (con != null)
					con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return tp;
	}*/

	public boolean insertarCategoria(TipoProducto tp)
	{	boolean res = false;
		Connection con = Conexion.conectar();
		try {
			if (con != null)
			{	PreparedStatement ps = con.prepareStatement("insert into tipoproducto values (?,?)");
				ps.setInt(1, 0);
				ps.setString(2, tp.getNombre());
				if (ps.executeUpdate()!= 0)
					res = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally
		{	Conexion.cerrarConeccion(con);
		}
		return res;
	}
	public TipoProducto cargarCategoria(String nombre)
	{	TipoProducto tp = null;
		Connection con = Conexion.conectar();
		try {
			if (con != null)
			{	PreparedStatement ps = con.prepareStatement("select * from tipoproducto where nombre = ?");
				ps.setString(1, nombre);
				ResultSet rs = ps.executeQuery();
				if (rs.next())
				{	tp = new TipoProducto();
					tp.setId(rs.getInt(1));
					tp.setNombre(rs.getString(2));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally
		{	Conexion.cerrarConeccion(con);
		}
		return tp;
	}
	public boolean modificarCategoria(TipoProducto tp,String nueva)
	{	boolean res = false;
		Connection con = Conexion.conectar();
		try {
			if (con != null)
			{	PreparedStatement ps = con.prepareStatement("update tipoproducto set nombre = ? where idtp = ?");
				ps.setInt(2, tp.getId());
				ps.setString(1, nueva);
				if (ps.executeUpdate()!= 0)
					res = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally
		{	Conexion.cerrarConeccion(con);
		}
		return res;
	}

}
