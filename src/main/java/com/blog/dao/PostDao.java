/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.blog.dao;
import com.blog.entities.Category;
import com.blog.entities.Post;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

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
    
    
    
    
    //get all the post
    public List<Post> getAllPosts(){
        //fetch all the post
        List<Post> list = new ArrayList<>();
        
        
        try {
            PreparedStatement p = con.prepareStatement("select * from post order by pid desc");
            ResultSet rs = p.executeQuery();
            
            while(rs.next()){
                int pid = rs.getInt("pid");
                String pTitle = rs.getString("pTitle");
                String pContent = rs.getString("pContent");
                String pPic = rs.getString("pPic");
                Timestamp date = rs.getTimestamp("pDate");
                int catId = rs.getInt("catId");
                String pCode = rs.getString("pCode");
                int userId = rs.getInt("userId");
                Post post = new Post(pid, pTitle, pContent, pPic, date, catId, pCode, userId);
                
                list.add(post);
            }
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        
        
        return list;
    }
    
    
    public List<Post> getPostByCatId(int catId){
            List<Post> list = new ArrayList<>();
        
        
        try {
            PreparedStatement p = con.prepareStatement("select * from post where catId=?");
            p.setInt(1, catId);
            ResultSet rs = p.executeQuery();
            
            while(rs.next()){
                int pid = rs.getInt("pid");
                String pTitle = rs.getString("pTitle");
                String pContent = rs.getString("pContent");
                String pPic = rs.getString("pPic");
                String pCode = rs.getString("pCode");
                Timestamp date = rs.getTimestamp("pDate");
                int userId = rs.getInt("userId");
                Post post = new Post(pid, pTitle, pContent, pPic, date, catId, pCode, userId);
                
                list.add(post);
            }
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        
        
        return list;
    }
    
    
    public Post getPostByPostId(int postId) throws SQLException{
        Post post = null;
        String q = "select * from post where pid=?";
        try {
          PreparedStatement p = this.con.prepareStatement(q);
          p.setInt(1, postId); 
          ResultSet rs = p.executeQuery();
          
          if(rs.next()){
            
                int pid = rs.getInt("pid");
                String pTitle = rs.getString("pTitle");
                String pContent = rs.getString("pContent");
                String pPic = rs.getString("pPic");
                String pCode = rs.getString("pCode");
                int catId = rs.getInt("catId");
                Timestamp date = rs.getTimestamp("pDate");
                int userId = rs.getInt("userId");
                
                post = new Post(pid, pTitle, pContent, pPic, date, catId, pCode, userId);

                

                
          }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return post ;        
    }
}
