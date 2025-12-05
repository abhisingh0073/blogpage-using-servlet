
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
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
  
    
    
    <title>Sorry ! Something went wrong</title>
</head>
    <body>
        <div class="container text-center mt-4">
            <img src="img/error.png" class="img-fluid" style="max-width: 350px;" alt=""/>
            <h3 class="h4 mt-3">Sorry! Something went wrong..</h3>
            <span>
                <%= exception%>    
            </span>

            <a href="/BlogJava" class="btn primary-background btn-md text-white mt-3">Home</a>
        </div>

    </body>
</html>
