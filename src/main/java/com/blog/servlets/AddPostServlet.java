
package com.blog.servlets;

import com.blog.dao.PostDao;
import com.blog.entities.Message;
import com.blog.entities.Post;
import com.blog.entities.User;
import com.blog.helper.ConnectionProvider;
import com.blog.helper.Helper;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
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
public class AddPostServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
           
            
            
            int cid = Integer.parseInt(request.getParameter("cId"));
            String pTitle = request.getParameter("pTitle");
            String pContent = request.getParameter("pContent");
            String pCode = request.getParameter("pCode");
            Part part = request.getPart("pic");
            String picname = String.valueOf(System.currentTimeMillis())+"_"
                             +part.getSubmittedFileName();// adding date to the name img to make unique name
            
            
            
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("currentUser");
            
            Post p = new Post(pTitle, pContent, picname, null, cid, pCode, user.getId());
            
            
            PostDao dao = new PostDao(ConnectionProvider.getConnection());
            if(dao.savePost(p)){
                out.println("done");
                
                String savePath = getServletContext().getRealPath("img")+File.separator+user.getId()+File.separator+"postImage";
                
                File filepath = new File(savePath);
                
                // if file does not exist then create
                if(!filepath.exists()) filepath.mkdirs();
                String imgPath = savePath+File.separator+picname;
                
                
//                saving image in folder
                if(Helper.saveFile(part.getInputStream(), imgPath)){
//                    out.println("post image is uploaded");
//                   
//                    Message msg = new Message("Post Image is uploaded", "sucess", "alert-success");
//                    session.setAttribute("msg", msg);
                    
                    
                } else {
//                    Message msg = new Message("Post Image is not uploaded! ", "error", "alert-danger");
//                    session.setAttribute("msg", msg);
                }
                
                
            } else{
                out.println("error");
                
            }




           
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

}
