package modelo;

import java.sql.Statement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexion {

	static Connection con;
	static Statement sentencia;



	public static Connection conectar(){

			try {
				Class.forName("com.mysql.jdbc.Driver");
				//con = DriverManager.getConnection("jdbc:mysql://209.62.14.197/tucompra","root","tucompraya");
				con = DriverManager.getConnection("jdbc:mysql:///tucompra","root","");
			} catch (SQLException e) {
				System.out.println("***ERROR AL CONECTARSASE A BASE DE DATOS***");
				e.printStackTrace();
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return  con;
}

	public static void cerrarConeccion(Connection con){
		try {
			if (con!= null)
				con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	} // AL PARECER ESTE METODO ES INNECESARIO





}
