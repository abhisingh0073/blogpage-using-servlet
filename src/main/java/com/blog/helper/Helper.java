/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.blog.helper;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

/**
 *
 * @author abhis
 */
public class Helper {
    
    public static void deleteFile(String path){
        boolean f = false;
        
        File file = new File(path);
        if(file.exists()){
            file.delete();
        }
    }
    
    
    
    
    public static boolean saveFile(InputStream image, String path){
        boolean f = false;
        
        
        try {
            FileOutputStream fos = new FileOutputStream(path);
            
            byte b[] = new byte[1024];
            int bytesRead;
            
            
            while((bytesRead = image.read(b)) != -1){
                fos.write(b, 0, bytesRead);
            }
            fos.close();
            

            
            f = true;
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
       return f;
    }
    
}
