package modelo;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Calendar;


public class Iva implements Serializable {
	private static final long serialVersionUID = 1L;

	private float iva;
	private Date fecha;

	public Iva(){
		this.iva=buscarUltimo();
		this.fecha=new Date(Calendar.getInstance().get(Calendar.YEAR)-1900,Calendar.getInstance().get(Calendar.MONTH),Calendar.getInstance().get(Calendar.DATE));

	}

	public int incrementarIva(Iva iva){


		Connection con=Conexion.conectar();
		int resultado = 0;

		try {
			PreparedStatement modif= con.prepareStatement("insert into tablaiva values ("+iva.getIva()+",'"+iva.getFecha()+"');");
			if(modif.executeUpdate()!=0){
				resultado=1;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Conexion.cerrarConeccion(con);
		return resultado;

	}

	public float getIva() {
		return iva;
	}

	public void setIva(float iva) {
		this.iva = iva;
	}

	public Date getFecha() {
		return fecha;
	}

	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}
	public float buscarUltimo()
	{	float iva = 0;
		Connection con = null;
		con = Conexion.conectar();
		try {
			if (con != null)
			{	PreparedStatement ps = con.prepareStatement("SELECT * FROM tablaiva t order by fecha desc");
				ResultSet rs = ps.executeQuery();
				if (rs.next())
					iva = rs.getFloat(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally
		{	Conexion.cerrarConeccion(con);
		}
		return iva;
	}

}
