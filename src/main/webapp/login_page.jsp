<%-- 
    Document   : login_page
    Created on : 3 Dec 2025, 5:19:15 pm
    Author     : abhis
--%>

<%@page import="com.blog.entities.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link href="css/mystyle.css?v=1.2" rel="stylesheet">
        <!-- Font Awesome 6 -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
        <style>
            body {
                position: relative;
                min-height: 100vh;
            }
            .banner-background{
                clip-path: polygon(0 0, 100% 0, 100% 76%, 81% 91%, 60% 84%, 39% 94%, 18% 89%, 0 100%);
                position: fixed;
                top: -20;
                left: 0;
                width: 100%;
                height: 100%;
                z-index: 0;
            }
        </style>
    
    </head>
    <body class="primary-background">
        
        <!--navbar-->
        <%@include  file="normal_navbar.jsp" %>
        
       
        <main class="d-flex align-items-center primary-background" style="height:70vh; position: relative; z-index: 0;">
            <div class="banner-background bg-white"></div>

            <div class="container" >
                <div class="row " >
                    <div class="col-md-4 offset-md-4" >
                        <div class="card" style="border-color: #2196f3 " >
                            <div class="card-header primary-background text-white text-center">
                                <h3>Login Here</h3>
                            </div>
                            
                            <%
                                Message m = (Message) session.getAttribute("msg");
                                if (m != null) {
                                %>
                                <div class  ="alert <%= m.getCssClass() %>" id="alert-banner" role="alert"
                                     style="position: fixed; top: 10%; z-index: 9999;"> <%= m.getContent() %></div >
                            <%
                                session.removeAttribute("msg");
                                }
                            %>
                            
                            
                            <div class="card-body">
                                <form action="LoginServlet" method="post">
                                    <div class="mb-3">
                                        <label for="email" class="form-label">Email address</label>
                                        <input type="email"required class="form-control" id="email" name="email">
                                        <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                                    </div>
                                    <div class="mb-3">
                                        <label for="password" class="form-label">Password</label>
                                        <input type="password" required class="form-control" id="password" name="password">
                                    </div>
                                    
                                    <button type="submit" class="btn btn-primary">Submit</button>
                                    <a href="register_page.jsp" class="btn btn-primary"><i class="fa-solid fa-user-plus"></i> Signup</a>

                                </form>
                            </div>
                            
                        </div>
                    </div>
                    
                </div>
            </div>
        </main>  
       
        
        
        
        
        
        
        
        
        
         <!--java script-->
        
        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
        
        <script src="js/myJs.js" type="text/javascript"></script>
        
        <script>
            setTimeout(() => {
                const alert = document.getElementById("alert-banner");
                if(alert) alert.remove();
            }, 4000);
        </script>
        
        
    </body>
</html>
