
import java.sql.*;
import javax.swing.JOptionPane;
public class Verificar_Conexion {
	
	    private String db = "miplaya";
	    private String url = "jdbc:mariadb://186.188.166.2:3306/"+db;
	    private String user = "miplaya";
	    private String pass = "Contra1234";


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
		Verificar_Conexion con= new Verificar_Conexion();
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


