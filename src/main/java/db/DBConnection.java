/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db;
import java.sql.*;
/**
 *
 * @author jgale
 */
public class DBConnection {
    Connection con;
    
    public DBConnection()
    {
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/animal_store","root","");
        }catch(Exception e){
            System.err.println("Error "+e);
        }
    }
    
    public Connection getConnection(){
        return con;
    }
}
