/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import logic.Product;

/**
 *
 * @author jgale
 */
public class DBProducts {
    
    DBConnection cn = new DBConnection();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Product product = new Product();
    
    public List selectAll() {
        ArrayList<Product>list = new ArrayList<>();
        String sql = "SELECT * FROM products";
        try{
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next())
            {
                Product product = new Product();
                product.setId(rs.getInt("products_id"));
                product.setName(rs.getString("products_name"));
                product.setDescription(rs.getString("products_description"));
                product.setShortDescription(rs.getString("products_short_description"));
                product.setStock(rs.getInt("products_stock"));
                product.setSold(rs.getInt("products_sold"));
                product.setPrice(rs.getInt("products_price"));
                product.setImg(rs.getString("products_img"));
                list.add(product);
                
            }
        }catch(Exception e){
            System.err.println("Error " + e);
        }
        return list;
    }

    public Product selectById(int id) {
        
        ArrayList<Product>list = new ArrayList<>();
        String sql = "SELECT * FROM products WHERE products_id=? LIMIT 1;";
        try{
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while(rs.next())
            {
                product.setId(rs.getInt("products_id"));
                product.setName(rs.getString("products_name"));
                product.setDescription(rs.getString("products_description"));
                product.setShortDescription(rs.getString("products_short_description"));
                product.setStock(rs.getInt("products_stock"));
                product.setSold(rs.getInt("products_sold"));
                product.setPrice(rs.getInt("products_price"));
                product.setImg(rs.getString("products_img"));
                
            }
        }catch(Exception e){
            System.err.println("Error " + e);
        }
        return product;
    }
    
    public boolean update(int id, int plusSold) {
        String sql = "UPDATE products "
                + "SET products_sold = products_sold + ? "
                + "WHERE products_id = ?;";
        
        //System.out.println(sql);
        
        try{
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, plusSold);
            ps.setInt(2, id);
            ps.executeUpdate();
        }catch(Exception e){
            System.err.println("Error " + e);
        }
        return false;
    }
}
