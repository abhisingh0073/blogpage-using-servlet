
package com.blog.entities;

import java.sql.Timestamp;
import java.time.Instant;


public class User {
   private int id;
   private String name;
   private String email;
   private String password;
   private Timestamp dateTime;
   private String profile;
   private String about;

    public User(int id, String name, String email, String password, Timestamp dateTime, String profile) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.password = password;
        this.dateTime = dateTime;
        this.profile = profile;
    }

    public User() {
    }

    public User(String name, String email, String password, String profile) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.dateTime = Timestamp.from(Instant.now());
        this.profile = profile;
    }
    
//    getters and setters

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Timestamp getDateTime() {
        return dateTime;
    }

    public void setDateTime(Timestamp dateTime) {
        this.dateTime = dateTime;
    }
    
    public void setProfile(String profile){
        this.profile = profile;
    }
    
    public String getProfile(){
        return profile;
    }    

    public String getAbout() {
        return about;
    }

    public void setAbout(String about) {
        this.about = about;
    }
    
    
    
    
   
   
}
