import java.sql.Connection;
import java.sql.DriverManager;

public class iziConn {

	 public String db = "miplaya";
	 public String url = "jdbc:mariadb://186.188.166.2:3306/"+db;
	 public String user = "miplaya";
	 public String pass = "Contra1234";
	 
	 public Connection Conectar(){

	       Connection link = null;
	       try{
	       Class.forName("org.mariadb.jdbc.Driver");
	       link = DriverManager.getConnection(this.url, this.user, this.pass);
	       }
	       catch(Exception ex){
	       System.err.println(ex);
	       }
	       return link;
	   }
}
