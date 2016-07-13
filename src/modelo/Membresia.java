package modelo;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Membresia implements Serializable {

	private static final long serialVersionUID = 1L;
	private int idMembresia;
	private String numeroTarjeta;
	private String estatus;
	private int idCli;

	public Membresia(){
		this.idMembresia=0;
		this.numeroTarjeta="";
		this.estatus="";
		this.idCli=0;
	}



	public int getId() {
		return idMembresia;
	}

	public void setId(int id) {
		this.idMembresia = id;
	}

	public String getNumeroTarjeta() {
		return numeroTarjeta;
	}

	public void setNumeroTarjeta(String numeroTarjeta) {
		this.numeroTarjeta = numeroTarjeta;
	}

	public String getEstatus() {
		return estatus;
	}

	public void setEstatus(String estatus) {
		this.estatus = estatus;
	}

	public int getIdCli() {
		return idCli;
	}

	public void setIdCli(int idCli) {
		this.idCli = idCli;
	}

	public Membresia buscarMembresia(int idCliente){
		String query="select * from membresia where membresia.idCli='"+idCliente+"' and membresia.estatus='i' order by idMembresia desc;";
        Connection con=Conexion.conectar();
        Membresia men=null;
        ResultSet rs;

	        try {
				Conexion.sentencia=con.createStatement();
				rs=Conexion.sentencia.executeQuery(query);
				if(rs.next()){
				    men= new Membresia();
				    men.setIdCli(rs.getInt(4));
				    men.setEstatus(rs.getString(2));
				    men.setId(rs.getInt(3));
				    men.setNumeroTarjeta(rs.getString(1));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			Conexion.cerrarConeccion(con);

		return men;
	}


	public Membresia cargarMembresia(int idCliente){
		String query="select * from membresia where membresia.idCli='"+idCliente+"' ;";
        Connection con=Conexion.conectar();
        Membresia men=null;
        ResultSet rs;

	        try {
				Conexion.sentencia=con.createStatement();
				rs=Conexion.sentencia.executeQuery(query);
				if(rs.next()){
				    men= new Membresia();
				    men.setIdCli(rs.getInt(4));
				    men.setEstatus(rs.getString(2));
				    men.setId(rs.getInt(3));
				    men.setNumeroTarjeta(rs.getString(1));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			Conexion.cerrarConeccion(con);

		return men;
	}



	public boolean actualizarMembresia(int idCliente, String estatus){
		String query="update membresia set estatus='"+estatus+"' where idCli="+idCliente+";";
        Connection con=Conexion.conectar();
        boolean resp=false;
        int rs;

	        try {
				Conexion.sentencia=con.createStatement();
				rs=Conexion.sentencia.executeUpdate(query);
				if(rs==1){
				    resp=true;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			Conexion.cerrarConeccion(con);

		return resp;
	}

	public boolean buscarMembInser(int idCliente){
		String query="select * from membresia where membresia.idCli='"+idCliente+"' and membresia.estatus='i' order by idMembresia desc;";
		//System.out.println(query);
        Connection con=Conexion.conectar();
        boolean respuesta= false;
        ResultSet rs;

	        try {
				Conexion.sentencia=con.createStatement();
				rs=Conexion.sentencia.executeQuery(query);
				if(rs.next()){
				    respuesta=true;
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			Conexion.cerrarConeccion(con);

		return respuesta;
	}




	public boolean insertarMembresia(Membresia men, String correo){
		boolean busqueda, respuesta=false;
		busqueda=buscarMembInser(men.getIdCli());
		if(busqueda){
			//si consigue al usuario retorno false para decir q no lo inserte NUEVAMENTE.
			respuesta=false;
		}else{
			Connection con=Conexion.conectar();
			try {
				PreparedStatement sql=con.prepareStatement("insert into membresia values (?,?,?,?)");
				sql.setString(1,men.getNumeroTarjeta());
				sql.setString(2,men.getEstatus());
				sql.setInt(3, men.getId());
				sql.setInt(4,men.getIdCli());

				if(sql.executeUpdate()!=0){

					Cliente cli= new Cliente();
					cli.setCorreo(correo);

					if(cli.modificarEstatus(cli, "p")){
						respuesta=true;
					}else{
						PreparedStatement eli=con.prepareStatement("delete from membresia where idCli="+cli.getIdCli()+"; ");
					}
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return respuesta;
	}



}
