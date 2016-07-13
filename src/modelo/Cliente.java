package modelo;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class Cliente implements Serializable {


    private static final long serialVersionUID = 1L;

    private int idCli;
    private String nombre;
    private String apellido;
    private String cedula;
    private String correo;
    private String direccion;
    private String clave;
    private String estatus;
    private String validacion;
    private boolean membresia;

    public Cliente(){
        this.idCli=0;
        this.nombre="";
        this.apellido="";
        this.cedula="";
        this.correo="";
        this.direccion="";
        this.clave="";
        this.estatus="";
        this.validacion="";
        this.membresia=false;
    }


    public String buscarUsuario(String correo){

        String query="select count(*) from cliente where cliente.correo='"+correo+"';";
        Connection con=Conexion.conectar();
        String msjRetorno=null;
        ResultSet rs;

        try {
            Conexion.sentencia=con.createStatement();
            rs=Conexion.sentencia.executeQuery(query);
            if(rs.next()){
                if(rs.getInt(1)==1){
                    msjRetorno="Error, este usuario ya esta registrado";
                }
            }


        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("ERROR");
        }

        //si el usuario NO esta registrado, retorna null, de lo contrario retorna una cadena.

        	 Conexion.cerrarConeccion(con);

        return msjRetorno;
    }
    public Cliente cargarCliente(int id)
    {
    	Connection con= null;
    	Cliente c= null;

    	con=Conexion.conectar();
    	try {
			if (con != null)
			{
				PreparedStatement cc= con.prepareStatement("select * from cliente where idCli=? ");
				cc.setInt(1, id);
				ResultSet res= cc.executeQuery();
				if (res.next())
				{
					c= new Cliente();
					c.setIdCli(res.getInt(1));
					c.setNombre(res.getString(2));
					c.setApellido(res.getString(3));
					c.setCedula(res.getString(4));
					c.setCorreo(res.getString(5));
					c.setDireccion(res.getString(6));
					c.setClave(res.getString(7));
					c.setEstatus(res.getString(8));
					c.setValidacion(res.getString(9));

				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}


    	return c;
    }
    public Cliente cargarCliente(String correo)
    {
    	Connection con= null;
    	Cliente c= null;

    	con=Conexion.conectar();
    	try {
			if (con != null)
			{
				PreparedStatement cc= con.prepareStatement("select * from cliente where correo=? ");
				cc.setString(1, correo);
				ResultSet res= cc.executeQuery();
				if (res.next())
				{
					c= new Cliente();
					c.setIdCli(res.getInt(1));
					c.setNombre(res.getString(2));
					c.setApellido(res.getString(3));
					c.setCedula(res.getString(4));
					c.setCorreo(res.getString(5));
					c.setDireccion(res.getString(6));
					c.setClave(res.getString(7));
					c.setEstatus(res.getString(8));
					c.setValidacion(res.getString(9));

				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}


    	return c;
    }


    public Cliente iniciarSesion(String correo, String clave){
    	Cliente cliente= null;
        Connection con=Conexion.conectar();

        ResultSet rs;
        String sql="select * from cliente where cliente.correo='"+correo+"' and cliente.clave='"+clave+
        "' and cliente.estatus<>'e' and cliente.estatus<>'b' and cliente.estatus<>'r';";

        try {

			Conexion.sentencia=con.createStatement();
			rs=Conexion.sentencia.executeQuery(sql);
			if(rs.next()){
				cliente= new Cliente();
				cliente.setNombre(rs.getString(2));
				cliente.setApellido(rs.getString(3));
				cliente.setCedula(rs.getString(4));
				cliente.setCorreo(rs.getString(5));
				cliente.setDireccion(rs.getString(6));
				cliente.setIdCli(rs.getInt(1));
				cliente.setClave(rs.getString(7));
				cliente.setEstatus(rs.getString(8));
			}

			Conexion.cerrarConeccion(con);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return cliente;

    }



    public int getIdCli() {
        return idCli;
    }

    public void setIdCli(int idCli) {
        this.idCli = idCli;
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

    public String getCedula() {
        return cedula;
    }

    public void setCedula(String cedula) {
        this.cedula = cedula;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
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

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public String getValidacion() {
        return validacion;
    }

    public void setValidacion(String validacion) {
        this.validacion = validacion;
    }


	public boolean isMembresia() {
		return membresia;
	}


	public void setMembresia(boolean membresia) {
		this.membresia = membresia;
	}

	public boolean insertarUsuario(Cliente cli){

		boolean res=false;
		Connection con=null;

		con=Conexion.conectar();
		try {
			if (con != null){
				if (buscarUsuario(cli.getCorreo())==null)
				{
					PreparedStatement is= con.prepareStatement("Insert into cliente values(?,?,?,?,?,?,?,?,?)");
					is.setInt(1,cli.getIdCli());
					is.setString(2,cli.getNombre());
					is.setString(3,cli.getApellido());
					is.setString(4,cli.getCedula());
					is.setString(5,cli.getCorreo());
					is.setString(6,cli.getDireccion());
					is.setString(7, cli.getClave());
					is.setString(8, cli.getEstatus());
					is.setString(9, cli.getValidacion());

					if(is.executeUpdate()!=0)
					{
						res=true;
					}
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
	public boolean modificarEstatus(Cliente cli, String estatus){
		boolean res= false;
		Connection con= null;
		con= Conexion.conectar();
		if (con !=null){
			try {
				  if (buscarUsuario(cli.getCorreo())!=null)
					{	PreparedStatement modif= con.prepareStatement("update cliente set estatus=? where correo =?");
						modif.setString(1, estatus);
						modif.setString(2, cli.getCorreo());
						if (modif.executeUpdate()!=0)
						{	res=true;
						}
					}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally
			{	Conexion.cerrarConeccion(con);

			}
		}
		return res;
	}


	public boolean modificarCliente(Cliente cli){
		boolean res= false;
		Connection con= null;

		con= Conexion.conectar();
		if (con !=null){
			System.out.println("conecta");
			try {
				  if (buscarUsuario(cli.getCorreo())!=null)
					{
						System.out.println("Consigue cliente");
						PreparedStatement modif= con.prepareStatement("update cliente set nombre=?," +
								"apellido=?,cedula=?,direccion=?,clave=?,validacion=? where correo =?");

						modif.setString(1, cli.getNombre());
						modif.setString(2, cli.getApellido());
						modif.setString(3, cli.getCedula());
						modif.setString(4, cli.getDireccion());
						modif.setString(5, cli.getClave());
						modif.setString(6, "xy");
						modif.setString(7, cli.getCorreo());

					if (modif.executeUpdate()!=0)
						{
							res=true;
						}
					}else{
						System.out.println("no consigue");
					}

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return res;
	}

}
