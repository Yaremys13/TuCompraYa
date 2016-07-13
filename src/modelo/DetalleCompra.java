package modelo;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

public class DetalleCompra implements Serializable {
	private int idCompra;
	private int idProducto;
	private float precioPro;
	private int cant;

	public DetalleCompra() {
		this.idCompra=0;
		this.idProducto = 0;
		this.precioPro = 0;
		this.cant = 0;
	}

	public int getCant() {
		return cant;
	}

	public void setCant(int cant) {
		this.cant = cant;
	}

	public int getIdCompra() {
		return idCompra;
	}

	public void setIdCompra(int idCompra) {
		this.idCompra = idCompra;
	}

	public int getIdProducto() {
		return idProducto;
	}

	public void setIdProducto(int idProducto) {
		this.idProducto = idProducto;
	}

	public float getPrecioPro() {
		return precioPro;
	}

	public void setPrecioPro(float precioPro) {
		this.precioPro = precioPro;
	}

	public boolean registrarDetalleCompra(DetalleCompra dc)
	{	boolean res = false;
		Connection con = Conexion.conectar();
		try {
			if (con != null)
			{	PreparedStatement ps = con.prepareStatement("insert into detallecompra values (?,?,?,?)");
				ps.setInt(1, dc.getIdCompra());
				ps.setInt(2, dc.getIdProducto());
				ps.setInt(3, dc.getCant());
				ps.setFloat(4, dc.getPrecioPro());
				if (ps.executeUpdate()!=0)
					res = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally
		{	Conexion.cerrarConeccion(con);
		}
		return res;
	}
	public Vector buscarDetallesCompra(int idCom)
	{	Vector vdc = null;
		DetalleCompra dc = null;
		Connection con = Conexion.conectar();
		try {
			if (con != null)
			{	PreparedStatement ps = con.prepareStatement("select * from detallecompra where idCompra = ?");
				ps.setInt(1, idCom);
				ResultSet rs = ps.executeQuery();
				if (rs != null)
				{	vdc = new Vector();
					while (rs.next())
					{	dc = new DetalleCompra();
						dc.setCant(rs.getInt(3));
						dc.setIdCompra(rs.getInt(1));
						dc.setIdProducto(rs.getInt(2));
						dc.setPrecioPro(rs.getFloat(4));
						vdc.add(dc);
					}
				}

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally
		{	Conexion.cerrarConeccion(con);
		}


		return vdc;
	}
}
