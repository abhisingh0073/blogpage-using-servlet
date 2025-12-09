/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.blog.dao;
import com.blog.entities.Category;
import com.blog.entities.Post;
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
    
    
    
    
    public boolean savePost(Post p){
        boolean f = false;
        
        try {
            
            String query = "insert into post (pTitle, pContent, pPic, catId, pCode, userId) values(?,?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, p.getpTitle());
            ps.setString(2, p.getpContent());
            ps.setString(3, p.getpPic());
            ps.setInt(4, p.getCatId());
            ps.setString(5, p.getpCode());
            ps.setInt(6, p.getUserId());
            
            ps.executeUpdate();
            
            f = true;
            
        } catch (Exception e) {
            e.printStackTrace();
            
        }
        
        
        
        
        
        return f;
    }
}
