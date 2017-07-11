
import java.sql.*;
import javax.swing.JOptionPane;
public class Conexion {
	
	    public String db = "miplaya";
	    public String url = "jdbc:mariadb://localhost/"+db;
	    public String user = "miplaya";
	    public String pass = "Contra1234";


	   public Connection Conectar(){

	       Connection link = null;

	       try{

	           Class.forName("org.mariadb.jdbc.Driver");
	           link = DriverManager.getConnection(this.url, this.user, this.pass);

	       }catch(Exception ex){

	           JOptionPane.showMessageDialog(null, ex);

	       }


	       return link;
	   }

	   

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Conexion con= new Conexion();
		java.sql.Connection cn=con.Conectar();
		 if(cn!=null){

             JOptionPane.showMessageDialog(null, "Conectado");

             try{

                 cn.close();

             }catch(SQLException ex){

                 System.out.println("Error al desconectar "+ex);

             }

		 			}
     

 }                                       
	}


