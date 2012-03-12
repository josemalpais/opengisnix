package org.opengis.nix.web;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectorServlets {
	static Connection conexion;
	public ConnectorServlets(){	
	}
	public static Connection conectar() throws ClassNotFoundException, SQLException{
		Class.forName("com.mysql.jdbc.Driver");
	      conexion = DriverManager.getConnection("jdbc:mysql://84.126.170.226/pruebagis", "dai2proyecto", "dai20112012");
	      return conexion;
	}
	public static void close() throws SQLException{
		conexion.close();
		
	}
	
}
