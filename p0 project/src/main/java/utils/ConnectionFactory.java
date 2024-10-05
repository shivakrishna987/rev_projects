package utils;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class ConnectionFactory {
	
	private static final ConnectionFactory connectionFactory=new ConnectionFactory();
	private Properties prop=new Properties();
	
	public ConnectionFactory() {
		try {
			prop.load(new FileReader("D:\\Projects\\project\\EcommerceWeb\\src\\main\\resources\\db.properties"));
//			prop.load(new FileReader("src/main/resources/db.properties"));
		}
		catch(IOException e) {
			e.getMessage();
		}
	}
	public static ConnectionFactory getConnectionFactory() {
		return connectionFactory;
	}
	public Connection getConnection() {
		try {
			getClass().forName("com.mysql.jdbc.Driver");
			return DriverManager.getConnection(
					prop.getProperty("url"),
					prop.getProperty("username"),
					prop.getProperty("password")
					);
		}catch(SQLException e) {
			e.printStackTrace();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
