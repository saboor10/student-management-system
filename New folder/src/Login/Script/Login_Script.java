/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Login.Script;

import Connection.Website.SchoolConnection;
import Login.Login;
import java.sql.*;



/**
 *
 * @author Saboor
 */
public class Login_Script {
    
   private String id; 
   private String password;
   private SchoolConnection schoolconnection;
  
   private Connection con = null;
    private PreparedStatement stmt = null;
    private ResultSet rs = null;
    private Statement st = null;
    private  Login login  ;
   public Login_Script(String id, String password){
       schoolconnection = new SchoolConnection();
       con = schoolconnection.getConnetion();
       this.id = id;
       this.password = password;
      
   }
   public void Logged_in(){
     
   
   }
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
   
   
    
    
    
}
