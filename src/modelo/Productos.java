package modelo;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

public class Productos implements Serializable {

	private static final long serialVersionUID = 1L;
	private int idPro;
	private String codigoVerificacion;
	private String nombre;
	private String descripcion;
	private float precioCliente;
	private float precioMiembro;
	private String estatus;
	private String marca;
	private int cantidad;
	private String color;
	private int idTp;
	private int cantidadP;

	//Atributos Foraneos
	private Vector imagenes;

	public Productos() {

		idPro=0;
		codigoVerificacion="";
		nombre="";
		descripcion="";
		precioCliente=0;
		precioMiembro=0;
		estatus="";
		marca="";
		cantidad=0;
		color="";
		idTp=0;
		imagenes = null;
	}

	public int getIdPro() {
		return idPro;
	}

	public void setIdPro(int idPro) {
		this.idPro = idPro;
	}

	public String getCodigoVerificacion() {
		return codigoVerificacion;
	}

	public void setCodigoVerificacion(String codigoVerificacion) {
		this.codigoVerificacion = codigoVerificacion;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public float getPrecioCliente() {
		return precioCliente;
	}

	public void setPrecioCliente(float precioCliente) {
		this.precioCliente = precioCliente;
	}

	public float getPrecioMiembro() {
		return precioMiembro;
	}

	public void setPrecioMiembro(float precioMiembro) {
		this.precioMiembro = precioMiembro;
	}

	public String getEstatus() {
		return estatus;
	}

	public void setEstatus(String estatus) {
		this.estatus = estatus;
	}

	public String getMarca() {
		return marca;
	}

	public void setMarca(String marca) {
		this.marca = marca;
	}

	public int getCantidad() {
		return cantidad;
	}

	public void setCantidad(int cantidad) {
		this.cantidad = cantidad;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public int getIdTp() {
		return idTp;
	}

	public void setIdTp(int idTp) {
		this.idTp = idTp;
	}

	public Vector getImagenes() {
		return imagenes;
	}

	public void setImagenes(Vector imagenes) {
		this.imagenes = imagenes;
	}


    public String buscarProductos(int idPro ){

        String query="select count(*) from productos where productos.idPro='"+idPro+"';";
        Connection con=Conexion.conectar();
        String msjRetorno=null;
        ResultSet rs;

        try {
            Conexion.sentencia=con.createStatement();
            rs=Conexion.sentencia.executeQuery(query);
            if(rs.next()){
                if(rs.getInt(1)==1){
                    msjRetorno="Error, este Producto ya esta registrago";
                }
            }

            Conexion.cerrarConeccion(con);
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("ERROR");
        }

        //si el usuario NO esta registrado, retorna null, de lo contrario retorna una cadena.
        return msjRetorno;
    }

    public Productos buscarProducto(int idPro){

        String query="select * from productos where productos.idPro='"+idPro+"' and estatus = 'a';";
        Connection con=Conexion.conectar();
        ResultSet rs;
        Productos p = null;
        try {
            Conexion.sentencia=con.createStatement();
            rs=Conexion.sentencia.executeQuery(query);
            if(rs.next()){
                p = new Productos();
                p.setIdPro(rs.getInt(1));
                p.setCodigoVerificacion(rs.getString(2));
                p.setNombre(rs.getString(3));
                p.setDescripcion(rs.getString(4));
                p.setPrecioCliente(rs.getFloat(5));
                p.setPrecioMiembro(rs.getFloat(6));
                p.setEstatus(rs.getString(7));
                p.setMarca(rs.getString(8));
                p.setCantidad(rs.getInt(9));
                p.setColor(rs.getString(10));
                p.setIdTp(rs.getInt(11));
                PreparedStatement ps = null;
                ps = con.prepareStatement("select * from imagen where idProductos = ?");
				ps.setInt(1, p.getIdPro());
				ResultSet rs2 = ps.executeQuery();
				Imagen i = null;
				if(rs2 != null)
				{	p.setImagenes(new Vector());
					while (rs2.next())
					{	i = new Imagen();
						i.setRutaImagen(rs2.getString(1));
						i.setPrincipal(rs2.getString(2));
						i.setIdImagen(rs2.getInt(3));
						i.setIdProductos(rs2.getInt(4));
						p.getImagenes().add(i);
					}
				}
				ps.close();
				rs2.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("ERROR");
        } finally
        {	 Conexion.cerrarConeccion(con);

        }

        //si el usuario NO esta registrado, retorna null, de lo contrario retorna una cadena.
        return p;
    }




    public Productos buscarProducto(String codV){

        String query="select * from productos where productos.codigoVerificacion='"+codV+"' and estatus = 'a';";
        Connection con=Conexion.conectar();
        ResultSet rs;
        Productos p = null;
        try {
            Conexion.sentencia=con.createStatement();
            rs=Conexion.sentencia.executeQuery(query);
            if(rs.next()){
                p = new Productos();
                p.setIdPro(rs.getInt(1));
                p.setCodigoVerificacion(rs.getString(2));
                p.setNombre(rs.getString(3));
                p.setDescripcion(rs.getString(4));
                p.setPrecioCliente(rs.getFloat(5));
                p.setPrecioMiembro(rs.getFloat(6));
                p.setEstatus(rs.getString(7));
                p.setMarca(rs.getString(8));
                p.setCantidad(rs.getInt(9));
                p.setColor(rs.getString(10));
                p.setIdTp(rs.getInt(11));
//              Buscando las imagenes del producto
				PreparedStatement ps = null;
                ps = con.prepareStatement("select * from imagen where idProductos = ?");
				ps.setInt(1, p.getIdPro());
				ResultSet rs2 = ps.executeQuery();
				Imagen i = null;
				if(rs2 != null)
				{	p.setImagenes(new Vector());
					while (rs2.next())
					{	i = new Imagen();
						i.setRutaImagen(rs2.getString(1));
						i.setPrincipal(rs2.getString(2));
						i.setIdImagen(rs2.getInt(3));
						i.setIdProductos(rs2.getInt(4));
						p.getImagenes().add(i);
					}
				}
				ps.close();
				rs2.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("ERROR");
        } finally
        {	 Conexion.cerrarConeccion(con);

        }

        //si el usuario NO esta registrado, retorna null, de lo contrario retorna una cadena.
        return p;
    }
	public boolean insertarProductos(Productos pro){

		boolean res=false;
		Connection con=null;

		con=Conexion.conectar();
		try {
			if (con != null){
				if (buscarProductos(pro.getIdPro())==null)
				{	PreparedStatement is= con.prepareStatement("Insert into productos values(?,?,?,?,?,?,?,?,?,?,?)");
					is.setInt(1, pro.getIdPro());
					is.setString(2, pro.getCodigoVerificacion());
					is.setString(3,pro.getNombre());
					is.setString(4, pro.getDescripcion());
					is.setFloat(5, pro.getPrecioCliente());
					is.setFloat(6, pro.getPrecioMiembro());
					is.setString(7, pro.getEstatus());
					is.setString(8, pro.getMarca());
					is.setInt(9, pro.getCantidad());
					is.setString(10, pro.getColor());
					is.setInt(11, pro.getIdTp());
					if(is.executeUpdate()!=0)
					{	res=true;
					}
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

	public boolean modificarProductos(Productos pro){

		boolean res= false;
		Connection con= null;
		System.out.println(pro.getCodigoVerificacion());
		con= Conexion.conectar();
		if (con !=null){
			try {
				if (buscarProducto(pro.getCodigoVerificacion())!=null)
				{
				PreparedStatement modif= con.prepareStatement("update productos set nombre=?, " +
				"descripcion=?,precioCliente=?,precioMiembro=?,marca=?,cantidad=?,color=?,idTp=? where codigoVerificacion =?");

					modif.setString(9, pro.getCodigoVerificacion());
					modif.setString(1, pro.getNombre());
					modif.setString(2, pro.getDescripcion());
					modif.setFloat (3, pro.getPrecioCliente());
					modif.setFloat(4, pro.getPrecioMiembro());
					modif.setString(5, pro.getMarca());
					modif.setInt(6, pro.getCantidad());
					modif.setString(7, pro.getColor());
					modif.setInt(8, pro.getIdTp());

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

	public Vector cargarProductos(int cat)
	{	Vector prods = null;
		Connection con = null;
		try {
			con = Conexion.conectar();
			if (con != null)
			{	//Buscando los productos
				PreparedStatement ps = null;
				if (cat == 0)
					ps = con.prepareStatement("select * from productos where estatus = 'a'");
				else
				{	ps = con.prepareStatement("select * from productos where idTp = ? and estatus = 'a'");
					ps.setInt(1, cat);
				}
				ResultSet rs = ps.executeQuery();

				Productos p = null;
				int ban = 0;
				while (rs.next())
				{	if (ban == 0 )
					{	prods = new Vector();
						ban = 1;
					}
					p = new Productos();
					p.setIdPro(rs.getInt(1));
					p.setCodigoVerificacion(rs.getString(2));
					p.setNombre(rs.getString(3));
					p.setDescripcion(rs.getString(4));
					p.setPrecioCliente(rs.getFloat(5));
					p.setPrecioMiembro(rs.getFloat(6));
					p.setEstatus(rs.getString(7));
					p.setMarca(rs.getString(8));
					p.setCantidad(rs.getInt(9));
					p.setColor(rs.getString(10));
					p.setIdTp(rs.getInt(11));
					//Buscando las imagenes del producto
					ps = con.prepareStatement("select * from imagen where idProductos = ?");
					ps.setInt(1, p.getIdPro());
					ResultSet rs2 = ps.executeQuery();
					Imagen i = null;
					if(rs2 != null)
					{	p.setImagenes(new Vector());
						while (rs2.next())
						{	i = new Imagen();
							i.setRutaImagen(rs2.getString(1));
							i.setPrincipal(rs2.getString(2));
							i.setIdImagen(rs2.getInt(3));
							i.setIdProductos(rs2.getInt(4));
							p.getImagenes().add(i);
						}
					}
					ps.close();
					rs2.close();
					prods.add(p);

				}
				rs.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally
		{	try {
				if(con!= null)
					con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return prods;
	}



	public Vector cargarProductos(String like)
	{	Vector prods = null;
		Connection con = null;
		try {
			con = Conexion.conectar();
			if (con != null)
			{	//Buscando los productos
				PreparedStatement ps = null;

					ps = con.prepareStatement("select * from productos where nombre like '%"+like+"%' and estatus = 'a'");

				ResultSet rs = ps.executeQuery();
				Productos p = null;
				int ban = 0;
				while (rs.next())
				{	if (ban == 0 )
					{	prods = new Vector();
						ban = 1;
					}
					p = new Productos();
					p.setIdPro(rs.getInt(1));
					p.setCodigoVerificacion(rs.getString(2));
					p.setNombre(rs.getString(3));
					p.setDescripcion(rs.getString(4));
					p.setPrecioCliente(rs.getFloat(5));
					p.setPrecioMiembro(rs.getFloat(6));
					p.setEstatus(rs.getString(7));
					p.setMarca(rs.getString(8));
					p.setCantidad(rs.getInt(9));
					p.setColor(rs.getString(10));
					p.setIdTp(rs.getInt(11));
					//Buscando las imagenes del producto
					ps = con.prepareStatement("select * from imagen where idProductos = ?");
					ps.setInt(1, p.getIdPro());
					ResultSet rs2 = ps.executeQuery();
					Imagen i = null;
					if(rs2 != null)
					{	p.setImagenes(new Vector());
						while (rs2.next())
						{	i = new Imagen();
							i.setRutaImagen(rs2.getString(1));
							i.setPrincipal(rs2.getString(2));
							i.setIdImagen(rs2.getInt(3));
							i.setIdProductos(rs2.getInt(4));
							p.getImagenes().add(i);
						}
					}
					ps.close();
					rs2.close();
					prods.add(p);

				}
				rs.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally
		{	try {
				if(con!= null)
					con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return prods;
	}




	public Productos cargarProducto(String cod)
	{
		Productos p= null;
		Connection con = null;
		try {
			con = Conexion.conectar();
			if (con != null)
			{	//Buscando los productos
				PreparedStatement ps = null;
				ps = con.prepareStatement("select * from productos where codigoVerificacion=? and estatus = 'a'");
				ps.setString(1, cod);
				ResultSet rs = ps.executeQuery();
				if (rs != null)
				{	if (rs.next())
					{	p = new Productos();

						p.setIdPro(rs.getInt(1));
						p.setCodigoVerificacion(rs.getString(2));
						p.setNombre(rs.getString(3));
						p.setDescripcion(rs.getString(4));
						p.setPrecioCliente(rs.getFloat(5));
						p.setPrecioMiembro(rs.getFloat(6));
						p.setEstatus(rs.getString(7));
						p.setMarca(rs.getString(8));
						p.setCantidad(rs.getInt(9));
						p.setColor(rs.getString(10));
						p.setIdTp(rs.getInt(11));
						//Buscando las imagenes del producto
						ps = con.prepareStatement("select * from imagen where idProductos = ?");
						ps.setInt(1, p.getIdPro());
						ResultSet rs2 = ps.executeQuery();
						Imagen i = null;
						if(rs2 != null)
						{	p.setImagenes(new Vector());
							while (rs2.next())
							{	i = new Imagen();
								i.setRutaImagen(rs2.getString(1));
								i.setPrincipal(rs2.getString(2));
								i.setIdImagen(rs2.getInt(3));
								i.setIdProductos(rs2.getInt(4));
								p.getImagenes().add(i);
							}
						}
						ps.close();
						rs2.close();
					}
				}

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}


		return p;
		}
	public boolean modificarEstatus(Productos pro, String estatus){
		boolean res= false;
		Connection con= null;
		con= Conexion.conectar();
		if (con !=null){
			try {
				  if (buscarProducto(pro.getCodigoVerificacion())!=null)
					{	PreparedStatement modif= con.prepareStatement("update productos set estatus=? where codigoVerificacion =?");
						modif.setString(1, estatus);
						modif.setString(2, pro.getCodigoVerificacion());
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

	public boolean vender(int cant)
	{	boolean res = false;
		Connection con = Conexion.conectar();
		try {
			if (con != null)
			{	PreparedStatement ps = con.prepareStatement("update productos set cantidad = ? where idPro = ?");
				ps.setInt(1, this.getCantidad()-cant);
				ps.setInt(2, this.getIdPro());
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

	public int buscarUltimoP()
	{	int id = 0;
		Connection con = Conexion.conectar();
		try {
			if (con != null)
			{	PreparedStatement ps = con.prepareStatement("select idPro from productos");
				ResultSet rs = ps.executeQuery();
				while (rs.next())
				{	id = rs.getInt(1);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally
		{	Conexion.cerrarConeccion(con);
		}
		return id;
	}
	public int getCantidadP() {
		return cantidadP;
	}

	public void setCantidadP(int cantidadP) {
		this.cantidadP = cantidadP;
	}

	}
