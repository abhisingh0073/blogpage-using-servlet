<%@page import="java.util.Collections"%>
<%@page import="java.util.List"%>
<%@page import="com.blog.entities.Post"%>
<%@page import="com.blog.helper.ConnectionProvider"%>
<%@page import="com.blog.dao.PostDao"%>

<div class="container">
    <div class="row">

        <%
            PostDao d = new PostDao(ConnectionProvider.getConnection());
            
//            int cid = Integer.parseInt(request.getParameter("cid"));
String cidStr = request.getParameter("cid");
int cid = (cidStr == null) ? 0 : Integer.parseInt(cidStr);
            List<Post> posts = null;
            if(cid==0){
                posts = d.getAllPosts();
            }else{
               posts = d.getPostByCatId(cid);

            }
            
            if(posts.size() == 0){
            out.println("<h3 class='display-3 text-center'>No Posts in this category..</h3.");
            }

            for (Post p : posts) {
        %>

        <div class="col-md-3 mt-2">
            <div class="card shadow-sm border-0" style="width: 100%;">
                <img src="<%= request.getContextPath() %>/img/<%= p.getUserId() %>/postImage/<%= p.getpPic() %>"
                     class="card-img-top"
                     style="height: 200px; object-fit: cover;"
                     alt="Post Image">

                <div class="card-body">
                    <h6 class="card-title fw-bold text-primary"><%= p.getpTitle() %></h6>
                    <p class="card-text text-secondary" style="max-height: 70px; overflow: hidden;">
                        <%= p.getpContent() %>
                    </p>
                    
                    <div class="readmore-like-comment" style="display: flex; gap: 4px">
                        <a href="show_blog_page.jsp?post_id=<%= p.getPid() %>" class="btn btn-outline-primary btn-sm ">Read More</a>
                        <a href="#" class="btn btn-outline-primary btn-sm "><i class="fa-solid fa-thumbs-up"></i> <span>10</span></a>
                        <a href="#" class="btn btn-outline-primary btn-sm "><i class="fa-chisel fa-regular fa-comment"></i> <span>20</span></a>
                    </div>
                </div>
                    
<!--                    <div>
                        <div class="card-footer">
                            <a href=""# class="btn btn-outline-primary btn-sm"></a>
                        </div>
                    </div>    -->

            </div>
        </div>

        <%
            }
        %>

    </div>
</div>
