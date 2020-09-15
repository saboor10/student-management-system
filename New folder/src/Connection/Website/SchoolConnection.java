/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Connection.Website;

import java.sql.Connection;
import java.sql.DriverManager;



/**
 *
 * @author Saboor
 */
public class SchoolConnection {
    private  Connection con= null;
   
    public Connection getConnetion(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/school", "admin", "saboor123");
        } catch (Exception e) {
            System.out.println(  e.getMessage());
           
        }
       return con; 
    }
   
    
}
