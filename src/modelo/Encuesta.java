package modelo;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

public class Encuesta implements Serializable {

	private int idPregunta;
	private String contenido;
	private String opcion1;
	private String opcion2;
	private String opcion3;
	private String opcion4;
	private Date fechaSubida;
	private Date fechaBajada;
	private String estatus;
	private int crOpcion1;
	private int crOpcion2;
	private int crOpcion3;
	private int crOpcion4;

	public String getContenido() {
		return contenido;
	}
	public void setContenido(String contenido) {
		this.contenido = contenido;
	}
	public int getCrOpcion1() {
		return crOpcion1;
	}
	public void setCrOpcion1(int crOpcion1) {
		this.crOpcion1 = crOpcion1;
	}
	public int getCrOpcion2() {
		return crOpcion2;
	}
	public void setCrOpcion2(int crOpcion2) {
		this.crOpcion2 = crOpcion2;
	}
	public int getCrOpcion3() {
		return crOpcion3;
	}
	public void setCrOpcion3(int crOpcion3) {
		this.crOpcion3 = crOpcion3;
	}
	public int getCrOpcion4() {
		return crOpcion4;
	}
	public void setCrOpcion4(int crOpcion4) {
		this.crOpcion4 = crOpcion4;
	}
	public String getEstatus() {
		return estatus;
	}
	public void setEstatus(String estatus) {
		this.estatus = estatus;
	}
	public Date getFechaBajada() {
		return fechaBajada;
	}
	public void setFechaBajada(Date fechaBajada) {
		this.fechaBajada = fechaBajada;
	}
	public Date getFechaSubida() {
		return fechaSubida;
	}
	public void setFechaSubida(Date fechaSubida) {
		this.fechaSubida = fechaSubida;
	}
	public int getIdPregunta() {
		return idPregunta;
	}
	public void setIdPregunta(int idPregunta) {
		this.idPregunta = idPregunta;
	}
	public String getOpcion1() {
		return opcion1;
	}
	public void setOpcion1(String opcion1) {
		this.opcion1 = opcion1;
	}
	public String getOpcion2() {
		return opcion2;
	}
	public void setOpcion2(String opcion2) {
		this.opcion2 = opcion2;
	}
	public String getOpcion3() {
		return opcion3;
	}
	public void setOpcion3(String opcion3) {
		this.opcion3 = opcion3;
	}
	public String getOpcion4() {
		return opcion4;
	}
	public void setOpcion4(String opcion4) {
		this.opcion4 = opcion4;
	}

	 public Vector buscarEncuesta(){
		 boolean ban = false;
	        String query="select * from encuesta where encuesta.estatus='a' order by idPregunta desc ;";
	        Connection con=Conexion.conectar();
	        ResultSet rs;
	      Vector en = new Vector();
	      Encuesta e= null;
	        try {
	            Conexion.sentencia=con.createStatement();
	            rs=Conexion.sentencia.executeQuery(query);

	            while (rs.next()){
	                ban = true;
	            	e = new Encuesta();
	                e.setIdPregunta(rs.getInt(1));
	                e.setContenido(rs.getString(2));
	                e.setOpcion1(rs.getString(3));
	                e.setOpcion2(rs.getString(4));
	                e.setOpcion3(rs.getString(5));
	                e.setOpcion4(rs.getString(6));

	                en.add(e);
	            }
	            rs.close();
	            if (!ban)
	            	en = null;
        }
     catch (SQLException e1) {
        e1.printStackTrace();
        System.out.println("ERROR");
    } finally
    {	 Conexion.cerrarConeccion(con);

    }

    	return en;
}

	public boolean insertarEncuesta(Encuesta en){

		boolean res=false;
		Connection con=null;
		con=Conexion.conectar();
		try {
			if (con != null){
				PreparedStatement is= con.prepareStatement("Insert into encuesta values(?,?,?,?,?,?,?,?,?,?,?,?,?);");

					is.setInt(1, en.getIdPregunta());
					is.setString(2,en.getContenido());
					is.setString(3,en.getOpcion1());
					is.setString(4,en.getOpcion2());
					is.setString(5, en.getOpcion3());
					is.setString(6, en.getOpcion4());
					is.setDate(7, en.getFechaSubida());
					is.setDate(8, en.getFechaBajada());
					is.setString(9, en.getEstatus());
					is.setInt(10, en.getCrOpcion1());
					is.setInt(11, en.getCrOpcion2());
					is.setInt(12, en.getCrOpcion3());
					is.setInt(13, en.getCrOpcion4());

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
			try {
				if(con!=null)
					con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return res;
	}

	public boolean modificarEncuesta(Encuesta en){

		boolean res= false;
		Connection con= null;

		con= Conexion.conectar();
		if (con !=null){

			try {
				PreparedStatement modif= con.prepareStatement("update encuesta set contenido=?,opcion1=?," +
				"opcion2=?,opcion3=?,opcion4=? where idPregunta=?");

					modif.setInt(6, en.getIdPregunta());
					modif.setString(1, en.getContenido());
					modif.setString(2, en.getOpcion1());
					modif.setString(3, en.getOpcion2());
					modif.setString(4, en.getOpcion3());
					modif.setString(5, en.getOpcion4());

					if (modif.executeUpdate()!=0)
					{
						res=true;
					}
				else{
					System.out.println("no consigue");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
		}
		}
		return res;

	}

	public Encuesta cargarEncuesta(int idPregunta)
	{
		Encuesta e= null;
		Connection con = null;
		try {
			con = Conexion.conectar();
			if (con != null)
			{	//Buscando los productos
				PreparedStatement ps = null;
				ps = con.prepareStatement("select * from encuesta where idPregunta=?");
				ps.setInt(1, idPregunta);
				ResultSet rs = ps.executeQuery();
				if (rs != null)
				{	if (rs.next())
					{	e = new Encuesta();

						e.setIdPregunta(rs.getInt(1));
						e.setContenido(rs.getString(2));
						e.setOpcion1(rs.getString(3));
						e.setOpcion2(rs.getString(4));
						e.setOpcion3(rs.getString(5));
						e.setOpcion4(rs.getString(6));
						e.setFechaSubida(rs.getDate(7));
						e.setFechaBajada(rs.getDate(8));
						e.setEstatus(rs.getString(9));
						e.setCrOpcion1(rs.getInt(10));
						e.setCrOpcion2(rs.getInt(11));
						e.setCrOpcion3(rs.getInt(12));
						e.setCrOpcion4(rs.getInt(13));

				}
				ps.close();
				}
			}
		}
		 catch (SQLException e1) {
			e1.printStackTrace();
		}
		 finally
		 {
			 Conexion.cerrarConeccion(con);
		 }
		return e;
		}

	public boolean modificarEstatus(Encuesta en, String estatus){
		boolean res= false;
		Connection con= null;
		con= Conexion.conectar();
		if (con !=null){
			try {
						PreparedStatement modif= con.prepareStatement("update encuesta set estatus=? where idPregunta=?");
						modif.setString(1, estatus);
						modif.setInt(2, en.getIdPregunta());
						if (modif.executeUpdate()!=0)
						{	res=true;
						}
					}
			 catch (SQLException e) {
				e.printStackTrace();
			} finally
			{	Conexion.cerrarConeccion(con);

			}
		}
		return res;
	}
}
