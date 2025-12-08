/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.blog.dao;
import com.blog.entities.Category;
import java.sql.*;
import java.util.ArrayList;

public class PostDao {
    Connection con;
    
    public PostDao(Connection con){
        this.con = con;
    }
    
    public ArrayList<Category> getAllCategories(){
        ArrayList<Category> list = new ArrayList<>();
        
        try {
            
            String query = "select * from categories";
            
            Statement st = this.con.createStatement();
            ResultSet set = st.executeQuery(query);
            while(set.next()){
                int cid = set.getInt("cid");
                String name = set.getString("name");
                String description = set.getString("description");
                Category c = new Category(cid, name, description);
                list.add(c);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        
        
        
        return list;
    }
    
    
}
