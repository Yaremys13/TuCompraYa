package modelo;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

public class Compra implements Serializable {

	private static final long serialVersionUID = 1L;
	private int idCompra;
	private String nroVoucher;
	private int idCli;
	private String banco;
	private Date fechaCompra;
	private String estatus;
	private String formaPago;
	private String nroTC;
	private String nombreTC;
	private String calleTC;
	private String urbTC;
	private String nroCTC;
	private String tlfTC;
	private String codSTC;
	private String tipoTC;
	private String receptor;
	private String ciuTC;
	private String estTC;
	private String celTC;
	private String fvTC;


	public String getFvTC() {
		return fvTC;
	}

	public void setFvTC(String fvTC) {
		this.fvTC = fvTC;
	}

	public String getCalleTC() {
		return calleTC;
	}

	public void setCalleTC(String calleTC) {
		this.calleTC = calleTC;
	}

	public String getCelTC() {
		return celTC;
	}

	public void setCelTC(String celTC) {
		this.celTC = celTC;
	}

	public String getCiuTC() {
		return ciuTC;
	}

	public void setCiuTC(String ciuTC) {
		this.ciuTC = ciuTC;
	}

	public String getCodSTC() {
		return codSTC;
	}

	public void setCodSTC(String codSTC) {
		this.codSTC = codSTC;
	}

	public String getEstTC() {
		return estTC;
	}

	public void setEstTC(String estTC) {
		this.estTC = estTC;
	}

	public String getNombreTC() {
		return nombreTC;
	}

	public void setNombreTC(String nombreTC) {
		this.nombreTC = nombreTC;
	}

	public String getNroCTC() {
		return nroCTC;
	}

	public void setNroCTC(String nroCTC) {
		this.nroCTC = nroCTC;
	}

	public String getNroTC() {
		return nroTC;
	}

	public void setNroTC(String nroTC) {
		this.nroTC = nroTC;
	}

	public String getReceptor() {
		return receptor;
	}

	public void setReceptor(String receptor) {
		this.receptor = receptor;
	}

	public String getTlfTC() {
		return tlfTC;
	}

	public void setTlfTC(String tlfTC) {
		this.tlfTC = tlfTC;
	}

	public String getUrbTC() {
		return urbTC;
	}

	public void setUrbTC(String urbTC) {
		this.urbTC = urbTC;
	}


	public Compra (){
		this.idCompra=0;
		this.nroVoucher="";
		this.idCli=0;
		this.banco="";
		this.fechaCompra= new Date(0);
		this.estatus = "";
		this.formaPago = "";
	}

	public int getIdCompra() {
		return idCompra;
	}

	public void setIdCompra(int idCompra) {
		this.idCompra = idCompra;
	}

	public String getNroVoucher() {
		return nroVoucher;
	}

	public void setNroVoucher(String nroVoucher) {
		this.nroVoucher = nroVoucher;
	}

	public int getIdCli() {
		return idCli;
	}

	public void setIdCli(int idCli) {
		this.idCli = idCli;
	}

	public String getBanco() {
		return banco;
	}

	public void setBanco(String banco) {
		this.banco = banco;
	}

	public Date getFechaCompra() {
		return fechaCompra;
	}

	public void setFechaCompra(Date fechaCompra) {
		this.fechaCompra = fechaCompra;
	}
	public String getEstatus() {
		return estatus;
	}

	public void setEstatus(String estatus) {
		this.estatus = estatus;
	}

	public String getFormaPago() {
		return formaPago;
	}

	public void setFormaPago(String formaPago) {
		this.formaPago = formaPago;
	}

	 public boolean insertarCompras(Compra comp){

			boolean res=false;
			Connection con=null;
			PreparedStatement cn;
			con=Conexion.conectar();
			try {
				if (con != null){
					Compra c = cargarCompra(comp.getIdCompra());
					if (c==null)
					{	if (comp.getFormaPago().equals("c"))
						{	cn = con.prepareStatement("Insert into compra values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
							cn.setString(8, comp.getNroTC());
							cn.setString(9, comp.getNombreTC());
							cn.setString(10, comp.getFvTC());
							cn.setString(11, comp.getCodSTC());
							cn.setString(12, comp.getReceptor());
							cn.setString(13, comp.getUrbTC());
							cn.setString(14, comp.getCalleTC());
							cn.setString(15, comp.getNroCTC());
							cn.setString(16, comp.getCiuTC());
							cn.setString(17, comp.getEstTC());
							cn.setString(18, comp.getTlfTC());
							cn.setString(19, comp.getCelTC());
							cn.setString(20, comp.getTipoTC());
						}
						else
							cn= con.prepareStatement("Insert into compra (idCompra,nroVoucher,idCli,banco,fechaCompra,estatus,formaPago) values(?,?,?,?,?,?,?)");
						cn.setInt(1, comp.getIdCompra());
						cn.setString(2, comp.getNroVoucher());
						cn.setInt(3, comp.getIdCli());
						cn.setString(4,comp.getBanco());
						cn.setDate(5, comp.getFechaCompra());
						cn.setString(6, comp.getEstatus());
						cn.setString(7, comp.getFormaPago());

						if(cn.executeUpdate()!=0)
						{
							res=true;
						}

					}

				}
			} catch (SQLException e) {
				e.printStackTrace();

			}
			finally {
				try {
					if(con!=null)
						con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}

			}

			return res;
	 }

	 public boolean actualizarCompra(Compra comp)
	 {	boolean res = false;
	 	Connection con = Conexion.conectar();
	 	try {
			if (con != null)
			{	PreparedStatement cn = con.prepareStatement("update compra set nroVoucher=?,banco=?,receptor=?,urbTC=?,calleTC=?," +
					"nroCTC=?,ciuTC=?,estTC=?,tlfTC=?,celTC=?,estatus=? where idCompra = ?");
				cn.setString(1, comp.getNroVoucher());
				cn.setString(2, comp.getBanco());
				cn.setString(3, comp.getReceptor());
				cn.setString(4, comp.getUrbTC());
				cn.setString(5, comp.getCalleTC());
				cn.setString(6, comp.getNroCTC());
				cn.setString(7, comp.getCiuTC());
				cn.setString(8, comp.getEstTC());
				cn.setString(9, comp.getTlfTC());
				cn.setString(10, comp.getCelTC());
				cn.setString(11, comp.getEstatus());
				cn.setInt(12, comp.getIdCompra());
				if (cn.executeUpdate() != 0)
					res = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return res;
	 }

	 public String buscarCompras(int idCompra){

	        String query="select count(*) from compra where compra.idCompra='"+idCompra+"';";
	        Connection con=Conexion.conectar();
	        String msjRetorno=null;
	        ResultSet rs;

	        try {
	            Conexion.sentencia=con.createStatement();
	            rs=Conexion.sentencia.executeQuery(query);
	            if(rs.next()){
	                if(rs.getInt(1)==1){
	                    msjRetorno="Error, esta Compra ya esta registrada";
	                }
	            }

	            Conexion.cerrarConeccion(con);
	        } catch (SQLException e) {
	            e.printStackTrace();
	            System.out.println("ERROR");
	        }

	        return msjRetorno;
	    }
	 	public boolean cambiarEstatus(String est,int idCompra)
	 	{	boolean cam = false;
	 		Connection con = Conexion.conectar();
	 		try {
				if (con != null)
				{	PreparedStatement ps = con.prepareStatement("update compra set estatus = ? where idCompra = ?");
					ps.setString(1, est);
					ps.setInt(2, idCompra);
					if (ps.executeUpdate()!= 0)
						cam = true;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally
			{	Conexion.cerrarConeccion(con);
			}

	 		return cam;
	 	}
	 	public Vector buscarComprasCliente(int idCliente){

	        String query="select * from compra where compra.idCli='"+idCliente+"';";
	        Connection con=Conexion.conectar();
	        Vector compras = null;
	        ResultSet rs;
	        Compra c= new Compra();
	        try {
	            Conexion.sentencia=con.createStatement();
	            rs=Conexion.sentencia.executeQuery(query);
	            if (rs != null)
	            {	compras = new Vector();
	            	while(rs.next()){
	            		c = new Compra();
	            		c.setIdCompra(rs.getInt(1));
		                c.setNroVoucher(rs.getString(2));
		                c.setIdCli(rs.getInt(3));
		                c.setBanco(rs.getString(4));
		                c.setFechaCompra(rs.getDate(5));
		                c.setEstatus(rs.getString(6));
		                c.setFormaPago(rs.getString(7));
		                c.setNroTC(rs.getString(8));
		                c.setNombreTC(rs.getString(9));
		                c.setFvTC(rs.getString(10));
		                c.setCodSTC(rs.getString(11));
		                c.setReceptor(rs.getString(12));
		                c.setUrbTC(rs.getString(13));
		                c.setCalleTC(rs.getString(14));
		                c.setNroCTC(rs.getString(15));
		                c.setCiuTC(rs.getString(16));
		                c.setEstTC(rs.getString(17));
		                c.setTlfTC(rs.getString(18));
		                c.setCelTC(rs.getString(19));
		                c.setTipoTC(rs.getString(20));
		                compras.add(c);
	            	}
	            }


	        } catch (SQLException e) {
	            e.printStackTrace();
	            System.out.println("ERROR");
	        } finally
	        {	Conexion.cerrarConeccion(con);
	        }

	        return compras;
	    }
	 	public int buscarComprasU(){
	        int id = 0;
	        Connection con=Conexion.conectar();
	        ResultSet rs;
	        try {
	            Conexion.sentencia=con.createStatement();
	            rs=Conexion.sentencia.executeQuery("select idCompra from compra");
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
	 public Compra cargarCompra(int idCom)
		{
			Compra c= null;
			Connection con = null;

			try {
				con = Conexion.conectar();
				if (con != null)
				{	//Buscando las Noticias
					PreparedStatement ps = null;
					ps = con.prepareStatement("select * from compra where idCompra=?");
					ps.setInt(1, idCom);
					ResultSet rs = ps.executeQuery();
					if (rs != null)
					{	if (rs.next())
						{	c = new Compra();
							c.setIdCompra(rs.getInt(1));
							c.setBanco(rs.getString(4));
							c.setIdCli(rs.getInt(3));
							c.setFechaCompra(rs.getDate(5));
							c.setEstatus(rs.getString(6));
							c.setNroVoucher(rs.getString(2));
							c.setFormaPago(rs.getString(7));
							c.setNroTC(rs.getString(8));
			                c.setNombreTC(rs.getString(9));
			                c.setFvTC(rs.getString(10));
			                c.setCodSTC(rs.getString(11));
			                c.setReceptor(rs.getString(12));
			                c.setUrbTC(rs.getString(13));
			                c.setCalleTC(rs.getString(14));
			                c.setNroCTC(rs.getString(15));
			                c.setCiuTC(rs.getString(16));
			                c.setEstTC(rs.getString(17));
			                c.setTlfTC(rs.getString(18));
			                c.setCelTC(rs.getString(19));
			                c.setTipoTC(rs.getString(20));
						}
							ps.close();
						}
					}

			} catch (SQLException e) {
				e.printStackTrace();
			}

			return c;
			}

		public Vector buscarCompras(){

	        String query="select * from compra where compra.estatus = 'p' or compra.estatus = 'c'";
	        Connection con=Conexion.conectar();
	        Vector compras = null;
	        ResultSet rs;
	        Compra c= new Compra();
	        try {
	            Conexion.sentencia=con.createStatement();
	            rs=Conexion.sentencia.executeQuery(query);
	            if (rs != null)
	            {	compras = new Vector();
	            	while(rs.next()){
	            		c = new Compra();
	            		c.setIdCompra(rs.getInt(1));
		                c.setNroVoucher(rs.getString(2));
		                c.setIdCli(rs.getInt(3));
		                c.setBanco(rs.getString(4));
		                c.setFechaCompra(rs.getDate(5));
		                c.setEstatus(rs.getString(6));
		                c.setFormaPago(rs.getString(7));
		                c.setNroTC(rs.getString(8));
		                c.setNombreTC(rs.getString(9));
		                c.setFvTC(rs.getString(10));
		                c.setCodSTC(rs.getString(11));
		                c.setReceptor(rs.getString(12));
		                c.setUrbTC(rs.getString(13));
		                c.setCalleTC(rs.getString(14));
		                c.setNroCTC(rs.getString(15));
		                c.setCiuTC(rs.getString(16));
		                c.setEstTC(rs.getString(17));
		                c.setTlfTC(rs.getString(18));
		                c.setCelTC(rs.getString(19));
		                c.setTipoTC(rs.getString(20));
		                compras.add(c);
	            	}
	            }


	        } catch (SQLException e) {
	            e.printStackTrace();
	            System.out.println("ERROR");
	        } finally
	        {	Conexion.cerrarConeccion(con);
	        }

	        return compras;
	    }
		public Vector buscarComprasPorEstatus(String est){
			ResultSet rs = null;
	        Connection con=Conexion.conectar();
	        Vector compras = null;
	        boolean ban = false;
	        Compra c= new Compra();
	        try {
	        	if (con != null)
	            {	PreparedStatement ps = con.prepareStatement("select * from compra where compra.estatus = ? or compra.estatus = 'p'");
	            	ps.setString(1, est);
	            	rs = ps.executeQuery();
	            	compras = new Vector();
	            	while(rs.next()){
	            		c = new Compra();
	            		c.setIdCompra(rs.getInt(1));
		                c.setNroVoucher(rs.getString(2));
		                c.setIdCli(rs.getInt(3));
		                c.setBanco(rs.getString(4));
		                c.setFechaCompra(rs.getDate(5));
		                c.setEstatus(rs.getString(6));
		                c.setFormaPago(rs.getString(7));
		                c.setNroTC(rs.getString(8));
		                c.setNombreTC(rs.getString(9));
		                c.setFvTC(rs.getString(10));
			            c.setCodSTC(rs.getString(11));
			            c.setReceptor(rs.getString(12));
			            c.setUrbTC(rs.getString(13));
			            c.setCalleTC(rs.getString(14));
			            c.setNroCTC(rs.getString(15));
			            c.setCiuTC(rs.getString(16));
			            c.setEstTC(rs.getString(17));
			            c.setTlfTC(rs.getString(18));
			            c.setCelTC(rs.getString(19));
			            c.setTipoTC(rs.getString(20));
			            compras.add(c);
			            ban = true;
		            }
	            	if (!ban)
	            		compras = null;
	            }

	        } catch (SQLException e) {
	            e.printStackTrace();
	            System.out.println("ERROR");
	        } finally
	        {	Conexion.cerrarConeccion(con);
	        }

	        return compras;
	    }
		public String getTipoTC() {
			return tipoTC;
		}

		public void setTipoTC(String tipoTC) {
			this.tipoTC = tipoTC;
		}
}

