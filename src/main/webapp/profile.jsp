<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.blog.entities.Category"%>
<%@page import="com.blog.helper.ConnectionProvider"%>
<%@page import="com.blog.dao.PostDao"%>
<%@page import="com.blog.entities.Message"%>
<%@page import="com.blog.entities.User"%>
<%@page errorPage="error_page.jsp" %>


<%
    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("login_page.jsp");

    }
%>


<% PostDao catDao = new PostDao(ConnectionProvider.getConnection());
  List<Category> cat = catDao.getAllCategories();
%>





<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

    <!-- Font Awesome 6 -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
    <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
    <style>
        .banner-background{
            clip-path: polygon(0 0, 100% 0, 100% 76%, 81% 91%, 60% 84%, 39% 94%, 18% 89%, 0 100%);
        }


        .add-post-btn {
            border: 2px solid white;
            border-radius: 10px;
            padding: 6px 12px;
            display: inline-block;
            transition: all 0.3s ease;
            font-weight: 600;
        }

        .add-post-btn i {
            font-size: 18px;
            font-weight: 900;
            transition: all 0.2s ease;
        }

        .add-post-btn:hover {
            background: white;
            color: #0d6efd;
            transform: translateY(-2px);
            box-shadow: 0 4px 10px rgba(255,255,255,0.3);
        }

        .add-post-btn:hover i {
            transform: scale(1.2);
        }


    </style>


</head>

<!--nave bar-->
<nav class="navbar navbar-expand-lg bg-body-tertiary primary-background "style="position: relative; z-index: 999">
    <div class="container-fluid">
        <a class="navbar-brand" href="/BlogJava"><span class="fab fa-atlassian"></span> Note Blog</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="/BlogJava" title="Home"><i class="fa-solid fa-house"></i></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Link</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="fa-solid fa-list"></i> Categories
                    </a>
                    <ul class="dropdown-menu">
                        <% for(Category catli : cat){
                        %><li><a class="dropdown-item" href="#!" onclick="getPosts(<%= catli.getCid() %>)"><%= catli.getName() %></a></li>
                        <%
                            }
                        %>
                    </ul>
                </li>
                <li class="nav-item">
                    <a a class="nav-link active" aria-current="page" href="#" ><i class="fa-solid fa-circle-user"></i> Contact Us</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link add-post-btn" href="#!" title="Add Post" data-bs-toggle="modal" data-bs-target="#add-post-modal"><i class="fa-solid fa-plus"></i></a>
                </li>
            </ul>

            <ul class="navbar-nav ml-auto d-flex align-items-center">

                <li class="nav-item d-flex align-items-center">
                    <a class="nav-link d-flex align-items-center gap-2" href="#!" data-bs-toggle="modal" data-bs-target="#profile-modal">
                        <img
                            src="img/<%= user.getProfile()%>"
                            alt="Profile"
                            style="width: 35px; height: 35px; object-fit: cover; border-radius: 50%; border: 2px solid #ddd;"
                            />
                        <span style="font-weight: 500;"><%= user.getName()%></span>
                    </a>
                </li>

                <li class="nav-item d-flex align-items-center">
                    <a class="nav-link active d-flex align-items-center gap-1" href="LogoutServlet"> Logout <i class="fa-solid fa-arrow-right-from-bracket"></i></a>
                </li>

            </ul>

        </div>
    </div>
</nav>


<!--end of navbar-->




<!--message-->














<%
    Message m = (Message) session.getAttribute("msg");
    if (m != null) {
%>
<div class  ="alert <%= m.getCssClass()%>" id="alert-banner" role="alert"
     style="position: fixed; top: 10%; z-index: 9999;"> <%= m.getContent()%></div >
<%
        session.removeAttribute("msg");
    }
%>






<!--// showing post inside profile body-->

<div class="container-fluid mt-3">
    <div class="text-center" id="loader">
        <i class="fa fa-refresh fa-4x fa-spin"></i>
        <h3 class="mt-2">Loading...</h3>
    </div>

    <div id="post-container"></div>
</div>







<!-- Modal -->
<div class="modal fade" id="profile-modal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header primary-background text-white">
                <h1 class="modal-title fs-5" id="staticBackdropLabel">Profile</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="container text-center">


                    <div class="profile-pic-box">
                        <img id="profile-img" src="img/<%= user.getProfile()%>" alt="Profile" class="profile-pic-icon">
                        <i class="fa-solid fa-circle-plus edit-icon"id="edit-icon"></i>
                        <input type="file" name="user_profile" id="profile-input" accept="image/*" style="display: none;">
                    </div>


                    <br>
                    <h4 class="modal-title mt-2"><%= user.getName()%></h4>




                    <!-- Details -->

                    <div id="profile-details">
                        <table class="table table-borderless">
                            <tbody>
                                <tr>
                                    <td style="width: 30%; padding: 12px 0; color: #6c757d; font-weight: 500;">ID</td>
                                    <td style="padding: 12px 0; font-weight: 500;"><%= user.getId()%></td>
                                </tr>
                                <tr>
                                    <td style="padding: 12px 0; color: #6c757d; font-weight: 500;">Name</td>
                                    <td style="padding: 12px 0;"><%= user.getName()%></td>
                                </tr>
                                <tr>
                                    <td style="padding: 12px 0; color: #6c757d; font-weight: 500;">Email</td>
                                    <td style="padding: 12px 0;"><%= user.getEmail()%></td>
                                </tr>
                                <tr>
                                    <td style="padding: 12px 0; color: #6c757d; font-weight: 500;">Status</td>
                                    <td style="padding: 12px 0;">
                                        <% if (user.getAbout() == null || user.getAbout().trim().isEmpty()) { %>
                                        <span style="color: #adb5bd; font-style: italic;">Write something..</span>
                                        <% } else {%>
                                        <%= user.getAbout()%>
                                        <% }%>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding: 12px 0; color: #6c757d; font-weight: 500;">Registered on</td>
                                    <td style="padding: 12px 0;"><%= user.getDateTime().toString()%></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>




                    <!--profile edit-->
                    <div id="profile-edit" style="display: none">
                        <form id="profile-form" action="EditServlet" method="post" enctype="multipart/form-data">


                            <!--add hidden input to send the new profile data to server because  input for new profile in present outside the form-->
                            <input type="file" name="user_profile" id="hidden-profile-input" style="display: none;">


                            <table class="table">
                                <tr>
                                    <td style="width: 25%; vertical-align: middle;"><strong>ID :</strong></td>
                                    <td><%= user.getId()%></td>
                                </tr>
                                <tr>
                                    <td style="vertical-align: middle;"><strong>Name :</strong></td>
                                    <td><input type="text" class="form-control" name="user_name" value="<%= user.getName()%>"></td>
                                </tr>
                                <tr>
                                    <td style="vertical-align: middle;"><strong>Email :</strong></td>
                                    <td><input type="email" class="form-control" name="user_email" value="<%= user.getEmail()%>"></td>
                                </tr>
                                <tr>
                                    <td style="vertical-align: top; padding-top: 12px;"><strong>About :</strong></td>
                                    <td><textarea rows="3" class="form-control" name="user_about" placeholder="Write About.."><%= user.getAbout() != null ? user.getAbout() : ""%></textarea></td>
                                </tr>
                            </table>
                        </form>
                    </div>          




                </div>

            </div>
            <div class="modal-footer">
                <button type="button" id="close-btn" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button id="edit-profile-btn" form="profile-form" class="btn btn-primary">Edit</button>
            </div>
        </div>
    </div>
</div>

<!--end of model-->





<!--add post modal-->

<div class="modal fade" id="add-post-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Create Post</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">

                <form id="add-post-form" class="d-flex flex-column gap-3" action="AddPostServlet" method="post">

                    <div class="form-group">
                        <select class="form-control" name="cId">
                            <option selected disabled>--- Categories---</option>
                            <%
                                PostDao postd = new PostDao(ConnectionProvider.getConnection());
                                ArrayList<Category> list = postd.getAllCategories();
                                for (Category c : list) {
                            %><option value="<%=c.getCid()%>"><%=c.getName()%></option><%
                                }
                            %>
                        </select>  
                    </div>

                    <div class="form-group">
                        <input name="pTitle" type="text" placeholder="Enter Post Title" class="form-control" >
                    </div>

                    <div class="form-group">
                        <textarea name="pContent" class="form-control" style="height: 200px" placeholder="Enter Your Content"></textarea>
                    </div>
                    <div class="form-group">
                        <textarea name="pCode" class="form-control" style="height: 200px" placeholder="Enter Your Program"></textarea>
                    </div>

                    <div class="form-group">
                        <label>Select Your pic</label>
                        <br>
                        <input type="file" name="pic">
                    </div>

                    <div class="container text-center" >
                        <button type="submiy" class="btn btn-outline-primary">Post</button>
                    </div>


                </form>
            </div>
        </div>
    </div>
</div>


<!--end post modal-->







<!--script-->

<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>

<script src="js/myJs.js" type="text/javascript"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<script>
    $(document).ready(function () {
//                let editStatus = false;



        let isEditMode = false;
        $('#edit-profile-btn').click(function (e) {


            if (!isEditMode) {
                e.preventDefault();
                isEditMode = true;
            }



            $('#profile-details').hide();
            $('#profile-edit').show();

//                    here "this" denote to edit-profile-btn
            $(this).text("Save");



            $("#close-btn").text("Back");
            $("#close-btn").addClass("back-btn");

            // IMPORTANT: Prevent the modal from closing
            $("#close-btn").removeAttr("data-bs-dismiss");

//                    showing input-icon
            $("#edit-icon").show();
        });

        $(document).on("click", ".back-btn", function () {

            $("#profile-details").show();
            $('#profile-edit').hide();

            $('#edit-profile-btn').text("Edit");
            $("#edit-profile-btn").removeAttr("type");

            $("#close-btn").text("Close");
            $("#close-btn").removeClass("back-btn");

            $(this).removeAttr("type");

            // Restore the attribute so modal can close again
            $("#close-btn").attr("data-bs-dismiss", "modal");

//                    hiding edit-icon
            $("#edit-icon").hide();
            isEditMode = false;

        });





        $('.edit-icon').click(function () {
            $('#profile-input').click();  // open file picker
        });




//                sending file to input that present inside form
        $('#profile-input').change(function () {

            const file = this.files[0];

            if (file) {
                const dt = new DataTransfer();
                dt.items.add(file);
                $('#hidden-profile-input')[0].files = dt.files;



//                        preview the image instantly
                const reader = new FileReader();
                reader.onload = function (e) {
                    $("#profile-img").attr("src", e.target.result);
                };
                reader.readAsDataURL(file);
            }
        });






    });





    setTimeout(() => {
        const alert = document.getElementById("alert-banner");
        if (alert)
            alert.remove();
    }, 4000);






      
      //            showing all post 
    $.ajax({
        url: "load_post.jsp",
        success: function (data, textStatus, jqXHR) {
            $("#loader").hide();
            $("#post-container").html(data);
        }
    });



//showing post by categories

function getPosts(catId){
    //            showing all post 
    $.ajax({
        url: "load_post.jsp",
        data: {cid: catId},
        success: function (data, textStatus, jqXHR) {
            $("#loader").hide();
            $("#post-container").html(data);
        }
    });
}









</script>





<!--now add post js-->
<script>
    $(document).ready(function (e) {

        $("#add-post-form").on("submit", function (event) {

            event.preventDefault();

            let form = new FormData(this);

            $.ajax({
                url: "AddPostServlet",
                type: 'POST',
                data: form,
                success: function (data, textStatus, jqXHR) {

                    if (data.trim() === 'done') {
//                    $('#add-post-modal').modal('hide');

                        swal({
                            title: "Good job!",
                            text: "Posted Successfully",
                            icon: "success",
                            buttons: false,
                            timer: 1000
                        });


                    } else {
                        swal("", "Something went wrong", "error");
                    }
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    swal("", "Something went wrong", "error");
                },
                processData: false,
                contentType: false
            });

        });

    });

</script>
















