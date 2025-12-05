
<%@page import="com.blog.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>


<!DOCTYPE html>
<html>
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="css/mystyle.css?v=1.2" rel="stylesheet">
    <!-- Font Awesome 6 -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
    <style>
        .banner-background{
            clip-path: polygon(0 0, 100% 0, 100% 76%, 81% 91%, 60% 84%, 39% 94%, 18% 89%, 0 100%);
        }
    </style>
  
    
    
    <title>JSP Page</title>
</head>
    <body>
        
        <!--navbar-->
        <%@include  file="normal_navbar.jsp" %>
        
        
        
        <!--banner-->
        
        <div class="container-fluid p-0 banner-background">
            
            <div class="bg-light primary-background text-white">
                <div class="container py-5">
                    <h3 class="display-3">Welcome to Note Blog</h3>
                    <p>Welcome to Tech Book</p>
                    <p>Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took ak</p>
                    
                    <button class="btn btn-outline-light btn-lg"><i class="fas fa-share-square"></i> Start ! its Free</button>
                    <a href="login_page.jsp" class="btn btn-outline-light btn-lg"><i class="fa-solid fa-arrow-right-to-bracket"></i> Login</a>
                  
            </div>

        </div>
            
        </div>
        
        <!--cards-->
        
        <div class="container mt-5">
            
            <div class="row mb-3">
                
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Java Programing</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card’s content.</p>
                            <a href="#" class="btn primary-background text-white">Go somewhere</a>
                        </div>
                    </div> 
                </div>
                
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Java Programing</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card’s content.</p>
                            <a href="#" class="btn primary-background text-white">Go somewhere</a>
                        </div>
                    </div> 
                </div>
                
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Java Programing</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card’s content.</p>
                            <a href="#" class="btn primary-background text-white">Go somewhere</a>
                        </div>
                    </div> 
                </div>
                
            </div>
            
            <div class="row">
                
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Java Programing</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card’s content.</p>
                            <a href="#" class="btn primary-background text-white">Go somewhere</a>
                        </div>
                    </div> 
                </div>
                
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Java Programing</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card’s content.</p>
                            <a href="#" class="btn primary-background text-white">Go somewhere</a>
                        </div>
                    </div> 
                </div>
                
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Java Programing</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card’s content.</p>
                            <a href="#" class="btn primary-background text-white">Go somewhere</a>
                        </div>
                    </div> 
                </div>
                
            </div>
            
        </div>
        
        
        
        
        
        
        <!--java script-->
        
        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
        
        <script src="js/myJs.js" type="text/javascript"></script>
        
    </body>
</html>
