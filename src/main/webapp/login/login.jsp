<%--
  Created by IntelliJ IDEA.
  User: Hung
  Date: 10/7/2022
  Time: 6:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>

    <%--bootstrap--%>
    <jsp:include page="/bootstrap/bootstrap.jsp"></jsp:include>
    <%--bootstrap--%>

</head>
<body>

<form method="post">

    <section class="vh-100">


        <div class="container-fluid h-custom">
            <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col-md-9 col-lg-6 col-xl-5">
                    <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/draw2.webp"
                         class="img-fluid" alt="Sample image">
                </div>
                <div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">

                    <!-- Email input -->
                    <div class="form-outline mb-4">
                        <input type="text" id="username" class="form-control form-control-lg" name="username"
                               placeholder="Enter a valid email address" />
                        <div id="usernameError" style="color:red;font-size: 12px"></div>
                        <label class="form-label" for="username">User Name</label>
                    </div>

                    <!-- Password input -->
                    <div class="form-outline mb-3">
                        <input type="password" id="password" class="form-control form-control-lg" name="password"
                               placeholder="Enter password" />
                        <div id="passwordError" style="color:red;font-size: 12px"></div>
                        <label class="form-label" for="password">Password</label>
                    </div>

                    <div class="d-flex justify-content-between align-items-center">
                        <!-- Checkbox -->
                        <div class="form-check mb-0">
                            <input class="form-check-input me-2" type="checkbox" name="remember"/>
                            <label class="form-check-label" for="password">
                                Remember me
                            </label>
                        </div>
                        <a href="#!" class="text-body">Forgot password?</a>
                    </div>

                    <div class="text-center text-lg-start mt-4 pt-2">
                        <button type="submit" class="btn btn-primary btn-lg"
                                style="padding-left: 2.5rem; padding-right: 2.5rem;">Login</button>
                        <div id="logInError" style="color:red;font-size: 12px"></div>
                        <p class="small fw-bold mt-2 pt-1 mb-0">Don't have an account? <a href="user?action=register"
                                                                                          class="link-danger">Register</a></p>
                    </div>
                </div>
            </div>
        </div>


        <div
                class="d-flex flex-column flex-md-row text-center text-md-start justify-content-between py-4 px-4 px-xl-5 bg-primary">
            <!-- Copyright -->
            <div class="text-white mb-3 mb-md-0">
                Copyright © 2020. All rights reserved.
            </div>
            <!-- Copyright -->

            <!-- Right -->
            <div>
                <a href="#!" class="text-white me-4">
                    <i class="fab fa-facebook-f"></i>
                </a>
                <a href="#!" class="text-white me-4">
                    <i class="fab fa-twitter"></i>
                </a>
                <a href="#!" class="text-white me-4">
                    <i class="fab fa-google"></i>
                </a>
                <a href="#!" class="text-white">
                    <i class="fab fa-linkedin-in"></i>
                </a>
            </div>
            <!-- Right -->
        </div>
    </section>

</form>



<%--Login--%>

<%--<form method="post">--%>

<%--    <label>--%>
<%--        Username:--%>
<%--        <input type="text" name="username">--%>
<%--    </label>--%>
<%--    <label>--%>
<%--        Password:--%>
<%--        <input type="text" name="password">--%>
<%--    </label>--%>

<%--    <button>Submit</button>--%>

<%--</form>--%>

</body>
</html>
