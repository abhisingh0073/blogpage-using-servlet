/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.blog.servlets;

import com.blog.dao.UserDao;
import com.blog.entities.Message;
import com.blog.entities.User;
import com.blog.helper.ConnectionProvider;
import com.blog.helper.Helper;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author abhis
 */
@MultipartConfig
public class EditServlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditServlet</title>");
            out.println("</head>");
            out.println("<body>");
            
//            fetch all data
              
              String userName = request.getParameter("user_name");
              String userEmail = request.getParameter("user_email");
              String userAbout = request.getParameter("user_about");
              Part part = request.getPart("user_profile");
              String imageName = part.getSubmittedFileName();
              
              
              
              
//              get the user from session..

              HttpSession s = request.getSession();
              User user = (User)s.getAttribute("currentUser");
              
              user.setId(user.getId());
              user.setName(userName);
              user.setEmail(userEmail);
              user.setAbout(userAbout);
              
              String oldImage = user.getProfile();
              
              if(imageName != null && !imageName.trim().equals("")){
//                  here i add userId in the name of file
                  user.setProfile(user.getId()+File.separator+imageName);
              } else{
                  user.setProfile(oldImage);
              }
              
              
              
              UserDao dao = new UserDao(ConnectionProvider.getConnection());
              boolean ans = dao.updateUser(user);
              
              
              
              
//           delting previous profile
             
             String path = getServletContext().getRealPath("img")+File.separator+user.getId();
             File filePath = new File(path);
             
             
             if(!filePath.exists()) filePath.mkdirs();
             
             
             String oldPath = getServletContext().getRealPath("img") + File.separator + oldImage;
             String newPath = path + File.separator + imageName;
             // we are using this hole code because with old image path already contain user.id and it make defecult to delete
             
            if (imageName != null && !imageName.trim().equals("")) {

//                 Delete old file if default
                if(!oldImage.equals("default.png")){
                   Helper.deleteFile(oldPath); 
                }
                

//                   save new file
                if (Helper.saveFile(part.getInputStream(), newPath)) {
                    out.println("Profile updated");

                    Message msg = new Message("Profile Updated Successfully!", "success", "alert-success");
                    s.setAttribute("msg", msg);

                } else {
                    Message msg = new Message("Profile data is not upadated ! ", "error", "alert-danger");
                    s.setAttribute("msg", msg);
                }

            } else {
//                Message msg = new Message("Something went wrong!", "error", "alert-danger");
//                s.setAttribute("msg", msg);
            }

            Message msg = new Message("Profile Updated Successfully!", "success", "alert-success");
            s.setAttribute("msg", msg);


            response.sendRedirect("profile.jsp");


            
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private String path() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
