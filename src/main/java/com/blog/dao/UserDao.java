package com.blog.dao;

import com.blog.entities.User;
import java.sql.*;

public class UserDao {

    private final Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }
    
    
    
//    check email and password
    public User isUserExist(String email, String password){
        
        User user = null;
        try {
            String query = "SELECT * FROM user WHERE LOWER(email) = ? AND password = ? ";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, email.toLowerCase());
            ps.setString(2, password);
            
            ResultSet rs = ps.executeQuery();
            
            if(rs.next()){
                user = new User();
               
                user.setName(rs.getString("username"));
                user.setId(rs.getInt("id"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setDateTime(rs.getTimestamp("created_at"));
                user.setProfile(rs.getString("profile"));
                user.setAbout(rs.getString("about"));
            }
            
        } catch (Exception e) {
            e.getStackTrace();
        }
        return user;
    }
    
    
    

//    check email exist or not
    public boolean isEmailExist(String email) {
    boolean exist = false;

    try {
        String query = "SELECT id FROM user WHERE LOWER(email) = ?";
        PreparedStatement ps = con.prepareStatement(query);
        ps.setString(1, email.toLowerCase());
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            exist = true;
        }

    } catch (Exception e) {
        e.printStackTrace();
    }

    return exist;
}

    
    
//    method to insert user to databse.
    public boolean saveUser(User user) {

        boolean f = false;
        try {

            String query = "insert into user(username, email, password) values(?, ?, ?)";

            PreparedStatement psmt = this.con.prepareStatement(query);
            psmt.setString(1, user.getName());
            psmt.setString(2, user.getEmail());
            psmt.setString(3, user.getPassword());

            psmt.executeUpdate();
            f = true;
        } catch (Exception e) {

            e.printStackTrace();
        }

        return f;

    }

    
    
    public boolean updateUser(User user){
        
        boolean f = false;
        try {
            
            String query = "update user set username=?, email=?, profile=?, about=? where id=? ";
            
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getProfile());
            ps.setString(4, user.getAbout());
            ps.setInt(5, user.getId());
            
            
            ps.executeUpdate();
            f = true;
            
            
        } catch (Exception e) {
          e.printStackTrace();
        }
        
        return f;
    }
}
