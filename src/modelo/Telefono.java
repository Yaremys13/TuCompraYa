package modelo;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

public class Telefono implements Serializable {

	private static final long serialVersionUID = 1L;
	private String numeroTlf;
	private int idTlf;
	private int idCli;

	public Telefono(){
		this.idCli=0;
		this.idTlf=0;
		this.numeroTlf="";
	}

	public String getNumeroTelefono() {
		return numeroTlf;
	}

	public void setNumeroTelefono(String numeroTelefono) {
		this.numeroTlf = numeroTelefono;
	}

	public int getIdTlf() {
		return idTlf;
	}

	public void setIdTlf(int idTlf) {
		this.idTlf = idTlf;
	}

	public int getIdCli() {
		return idCli;
	}

	public void setIdCli(int idCli) {
		this.idCli = idCli;
	}


	public String buscarTelfono(String idTlf){

        String query="select count(*) from telefono where telefono.idTlf='"+idTlf+"';";
        Connection con=Conexion.conectar();
        String msjRetorno=null;
        ResultSet rs;

        try {
            Conexion.sentencia=con.createStatement();
            rs=Conexion.sentencia.executeQuery(query);
            if(rs.next()){
                if(rs.getInt(1)==1){
                    msjRetorno="Error, este Telefono ya esta registrado";
                }
            }


        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("ERROR");
        }

        	 Conexion.cerrarConeccion(con);

        return msjRetorno;
    }

	public boolean insertarTelefono(Telefono telf){

		boolean res=false;
		Connection con=null;

		con=Conexion.conectar();
		try {
			if (con != null){

					PreparedStatement is= con.prepareStatement("Insert into telefono values(?,?,?);");
					is.setInt(2, telf.getIdTlf());
					is.setString(1, telf.getNumeroTelefono());
					is.setInt(3, telf.getIdCli());


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

	public boolean modificarTelefono(Telefono telf){

		boolean res=false;
		Connection con=null;

		con=Conexion.conectar();
		try {
			if (con != null){

					PreparedStatement is= con.prepareStatement("update telefono set numeroTlf=? where idCli=? and idTlf=?");

					is.setString(1, telf.getNumeroTelefono());
					is.setInt(3, telf.getIdTlf());
					is.setInt(2, telf.getIdCli());

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


	public Vector buscarTelefonoCliente(int idCli)
	{
		Vector tc= null;
		Connection con=Conexion.conectar();

			try {
				if (con !=null)
				{
					PreparedStatement  is= con.prepareStatement("select * from telefono where idCli=?");

					is.setInt(1, idCli);

					ResultSet rs= is.executeQuery();
					if (rs != null){
						tc= new Vector();
						while(rs.next())
						{
							Telefono t= new Telefono();
							t.setNumeroTelefono(rs.getString(1));
							t.setIdTlf(rs.getInt(2));
							t.setIdCli(rs.getInt(3));
							tc.add(t);
						}
					}
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		return tc;
	}
}


