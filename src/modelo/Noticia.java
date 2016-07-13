package modelo;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

public class Noticia implements Serializable {

	private static final long serialVersionUID = 1L;
	private int id;
	private String nombreNot;
	private String contenido;
	private String estatus;
	private Vector imagenes;
	private String url;

	public String getNombreNot() {
		return nombreNot;
	}

	public void setNombreNot(String nombreNot) {
		this.nombreNot = nombreNot;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public Vector getImagenes() {
		return imagenes;
	}

	public void setImagenes(Vector imagenes) {
		this.imagenes = imagenes;
	}

	public Noticia(){
		this.id=0;
		this.nombreNot="";
		this.contenido="";
		this.estatus="";
		this.url="";
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getContenido() {
		return contenido;
	}

	public void setContenido(String contenido) {
		this.contenido = contenido;
	}

	public String getEstatus() {
		return estatus;
	}

	public void setEstatus(String estatus) {
		this.estatus = estatus;
	}

	 public String buscarNoticias(int id){

	        String query="select count(*) from noticias where noticias.id='"+id+"';";
	        Connection con=Conexion.conectar();
	        String msjRetorno=null;
	        ResultSet rs;

	        try {
	            Conexion.sentencia=con.createStatement();
	            rs=Conexion.sentencia.executeQuery(query);
	            if(rs.next()){
	                if(rs.getInt(1)==1){
	                    msjRetorno="Error, esta noticia ya esta registraga";
	                }
	            }

	            Conexion.cerrarConeccion(con);
	        } catch (SQLException e) {
	            e.printStackTrace();
	            System.out.println("ERROR");
	        }

	        //si la noticia NO esta registrada, retorna null, de lo contrario retorna una cadena.
	        return msjRetorno;
	    }

	 public boolean insertarNoticias(Noticia not){

			boolean res=false;
			Connection con=null;

			con=Conexion.conectar();
			try {
				if (con != null){
					if (buscarNoticias(not.getId())==null)
					{
						 PreparedStatement nc= con.prepareStatement("Insert into noticias values(?,?,?,?,?)");

						nc.setInt(1, not.getId());
						nc.setString(2,not.getNombreNot());
						nc.setString(3, not.getContenido());
						nc.setString(4, not.getEstatus());
						nc.setString(5, not.getUrl());
						if(nc.executeUpdate()!=0)
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

	public boolean modificarNoticias(Noticia not){

				boolean res= false;
				Connection con= null;

				con= Conexion.conectar();
				if (con !=null){
					System.out.println("conecta");

					try {
						if (buscarNoticias(not.getId())!=null)
						{
						PreparedStatement modif= con.prepareStatement("update noticias set nombreNot=?, " +
						"contenido=?,estatus=?,url=? where id = ?");

							modif.setInt(5, not.getId());
							modif.setString(1, not.getNombreNot());
							modif.setString(2, not.getContenido());
							modif.setString(3, not.getEstatus());
							modif.setString(4, not.getUrl());

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
					} finally
					{	Conexion.cerrarConeccion(con);

					}

				}
				return res;
		}

	public Noticia cargarNoticia(int id)
	{
		Noticia n= null;
		Connection con = null;

		try {
			con = Conexion.conectar();
			if (con != null)
			{	//Buscando las Noticias
				PreparedStatement ps = null;
				ps = con.prepareStatement("select * from noticias where id=?");
				ps.setInt(1, id);
				ResultSet rs = ps.executeQuery();
				if (rs != null)
				{	if (rs.next())
					{	n = new Noticia();

						n.setId(rs.getInt(1));
						n.setNombreNot(rs.getString(2));
						n.setContenido(rs.getString(3));
						n.setEstatus(rs.getString(4));
						n.setUrl(rs.getString(5));
						/*Buscando las imagenes de la Noticia
						ps = con.prepareStatement("select * from imagen where id = ?");
						ps.setInt(1, n.getId());
						ResultSet rs2 = ps.executeQuery();
						Imagen i = null;
						if(rs2 != null)
						{	n.setImagenes(new Vector());
							while (rs2.next())
							{	i = new Imagen();
								i.setRutaImagen(rs2.getString(1));
								i.setPrincipal(rs2.getString(2));
								i.setIdImagen(rs2.getInt(3));
								i.setIdProductos(rs2.getInt(4));
								n.getImagenes().add(i);
							}
						}
						ps.close();
						rs2.close();*/
					}
				}

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}


		return n;
		}
	public Vector cargarNoticias()
	{	Vector vnoc = null;
		Noticia n= null;
		Connection con = null;

		try {
			con = Conexion.conectar();
			if (con != null)
			{	//Buscando las Noticias
				PreparedStatement ps = null;
				ps = con.prepareStatement("select * from noticias where estatus=?");
				ps.setString(1, "a");
				ResultSet rs = ps.executeQuery();
				if (rs != null)
				{	vnoc = new Vector();
					while (rs.next())
					{	n = new Noticia();
						n.setId(rs.getInt(1));
						n.setNombreNot(rs.getString(2));
						n.setContenido(rs.getString(3));
						n.setEstatus(rs.getString(4));
						n.setUrl(rs.getString(5));
						//Buscando las imagenes de la Noticia
						ps = con.prepareStatement("select * from imagen where id = ?");
						ps.setInt(1, n.getId());
						ResultSet rs2 = ps.executeQuery();
						Imagen i = null;
						if(rs2 != null)
						{	n.setImagenes(new Vector());
							while (rs2.next())
							{	i = new Imagen();
								i.setRutaImagen(rs2.getString(1));
								i.setPrincipal(rs2.getString(2));
								i.setIdImagen(rs2.getInt(3));
								i.setIdProductos(rs2.getInt(4));
								n.getImagenes().add(i);
							}
						}
						vnoc.add(n);
						ps.close();
						rs2.close();
					}
				}

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}


		return vnoc;
		}
	public boolean modificarEstatus(Noticia nt, String estatus){
		boolean res= false;
		Connection con= null;
		con= Conexion.conectar();
		if (con !=null){
			try {
				  if (buscarNoticias(nt.getId())!=null)
					{	PreparedStatement modif= con.prepareStatement("update noticias set estatus=? where	id=?");
						modif.setString(1, estatus);
						modif.setInt(2, nt.getId());
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
	public int buscarNoticiasU(){
        int id = 0;
        Connection con=Conexion.conectar();
        ResultSet rs;
        try {
            Conexion.sentencia=con.createStatement();
            rs=Conexion.sentencia.executeQuery("select id from noticias");
            while(rs.next()){
                id = rs.getInt(1);
            }


        } catch (SQLException e) {
            e.printStackTrace();

        } finally
        {	Conexion.cerrarConeccion(con);

        }

        return id;
    }

}

