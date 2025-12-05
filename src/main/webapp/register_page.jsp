<%-- 
    Document   : register_page
    Created on : 4 Dec 2025, 1:32:21 pm
    Author     : abhis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>

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
                top: 0;
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


        <main class="d-flex align-items-center primary-background" style="height:90vh; position: relative; z-index: 0;">
            <div class="banner-background bg-white"></div>

            <div class="container" >
                <div class="row " >
                    <div class="col-md-4 offset-md-4" >
                        <div class="card" style="border-color: #2196f3 " >
                            <div class="card-header primary-background text-white text-center">
                                <h3><i class="fa-solid fa-circle-user"></i>
                                    <br>
                                    Register Here</h3>
                            </div>
                            <div class="card-body">
                                <form id="reg-form" action="SignupServlet" method="post">
                                    <div class="mb-3">
                                        <label for="username" class="form-label">User Name</label>
                                        <input type="text" class="form-control" id="username" name="username" aria-describedby="username">
                                        <div class="text-danger small mt-1" id="username-error"></div>
                                    </div>

                                    <div class="mb-3">
                                        <label for="email1" class="form-label">Email address</label>
                                        <input type="email" class="form-control" id="email1" name="email" aria-describedby="emailHelp">
                                        <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                                        <div class="text-danger small mt-1" id="email-error"></div>
                                    </div>

                                    <div class="mb-3">
                                        <label for="password1" class="form-label">Password</label>
                                        <div class="input-group">
                                            <input type="password" class="form-control" id="password1" name="password">
                                            <button class="btn btn-outline-secondary" type="button" id="toggle-password">
                                                <i class="fa-solid fa-eye" id="password-icon"></i>
                                            </button>
                                        </div>
                                        <div class="text-danger small mt-1" id="password-error"></div>
                                    </div>

                                    <div class="mb-3">
                                        <label for="confirm_password1" class="form-label">Confirm Password</label>
                                        <input type="password" class="form-control" id="con_password1" name="confirm_password">
                                        <div class="text-danger small mt-1" id="confirm-password-error"></div>

                                    </div>

                                    <div class="mb-3 form-check">
                                        <input type="checkbox" class="form-check-input" id="check" name="check">
                                        <label class="form-check-label" for="check">Term and condition</label>
                                    </div>

                                    <button type="submit" class="btn btn-primary " style="position: relative;overflow: hidden;">
                                        <div class="d-flex align-items-center justify-content-center">
                                            <span class="btn-text" id="submit-btn">Register</span>
                                            <i class="fa-solid fa-sync fa-spin fa-1x " id="loader" style="display: none; position: absolute; z-index: 10;"></i>
                                        </div>
                                    </button>
                                    <a href="login_page.jsp" class="btn btn-primary"><i class="fa-solid fa-arrow-right-to-bracket"></i> Login</a>



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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script>
            $(document).ready(function () {
                console.log("loaded...");


//           password hide and show
                let toggle = true;
                $("#toggle-password").click(function () {
                    toggle ? ($("#password1").attr("type", "text"), $("#password-icon").removeClass("fa-eye").addClass("fa-eye-slash"))
                            : ($("#password1").attr("type", "password"), $("#password-icon").removeClass("fa-eye-slash").addClass("fa-eye"));
                    toggle = !toggle;


                });

//          validation form
                function validateForm() {
                    let valid = true;

                    // Clear previous messages
                    $(".text-danger").text("");

                    let username = $("#username").val().trim();
                    let email = $("#email1").val().trim().toLowerCase();
                    let password = $("#password1").val();
                    let confirm = $("#con_password1").val();
                    let checked = $("#check").is(":checked");

                    // Username
                    if (username === "") {
                        $("#username-error").text("Username is required.");
                        valid = false;
                    }

                    // Email
                    if (email === "") {
                        $("#email-error").text("Email is required.");
                        valid = false;
                    } else {
                        let emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                        if (!emailPattern.test(email)) {
                            $("#email-error").text("Enter a valid email.");
                            valid = false;
                        }
                    }

                    // Password
                    if (password.length < 6) {
                        $("#password-error").text("Password must be at least 6 characters.");
                        valid = false;
                    }

                    // Confirm Password
                    if (password !== confirm) {
                        $("#confirm-password-error").text("Passwords do not match.");
                        valid = false;
                    }


                    // Enable/disable submit button
//        $("#submit-btn").prop("disabled", !valid);

                    return valid;
                }



                function validatePassword() {

                    $(".text-danger").text("");

                    let password = $("#password1").val();
                    let confirm = $("#con_password1").val();

                    if (password !== confirm) {
                        $("#confirm-password-error").text("Passwords do not match.");
                        valid = false;
                    }
                }

                // Attach event handlers outside the validateForm function
//    $("#username, #email1, #password1, #con_password1, #check").on("keyup change click", function(){
//        validateForm();
//    });

                $("#con_password1").on("keyup change", function () {
                    validatePassword();
                });

                // Form submit handler
                $('#reg-form').on('submit', function (event) {
                    event.preventDefault();

                    if (!validateForm()) {
                        // stop submission if validation fails
                        return;
                    }

                    let form = new FormData(this);

                    $("#submit-btn").css("visibility", "hidden");
                    $("#loader").show();

                    setTimeout(function () {

                        $.ajax({
                            url: "SignupServlet",
                            type: 'post',
                            data: form,
                            success: function (data, textStatus, jqXHR) {
                                console.log(data);

                                $("#loader").hide();
                                $("#submit-btn").css("visibility", "visible");

                                if (data.trim() === 'done') {
                                    swal("Register Successfully", {
                                        icon: "success",
                                        buttons: false,
                                        timer: 3000
                                    }).then(() => {
                                        window.location = "login_page.jsp";
                                    });
                                } else {
                                    swal(data, {
                                       icon: "error",
                                    buttons: false,
                                    timer: 3000 
                                    });
                                }
                            },
                            error: function (jqXHR, textStatus, errorThrown) {
                                console.log(jqXHR);

                                swal("Something went wrong", {
                                    icon: "error",
                                    buttons: false,
                                    timer: 3000
                                });

                                $("#loader").hide();
                                $("#submit-btn").css("visibility", "visible");
                            },
                            processData: false,
                            contentType: false
                        });

                    }, 500);

                });

                // Initial validation
//    validateForm();
            });


        </script>
    </body>
</html>