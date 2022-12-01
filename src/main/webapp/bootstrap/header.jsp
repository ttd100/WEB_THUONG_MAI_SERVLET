<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<nav class="navbar navbar-expand-lg" id="navbar" style="background: #eeeeee;">
    <div class="container-fluid">
        <a class="navbar-brand" href="home">
            <img id="navbar-image" src="/image/Fnatic_icon.png" alt="" width="30" height="27"
                 class="d-inline-block align-text-top">
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <div class="dropdown">
                    <li class="nav-item">
                        <a class="nav-link active" id="esport" aria-current="page">Esports</a>
                    </li>
                </div>
                <div class="dropdown">
                    <li class="nav-item">
                        <a class="nav-link active" id="product" aria-current="page">Product</a>
                    </li>
                </div>
                <div class="dropdown">
                    <li class="nav-item">
                        <a class="nav-link active" id="community" aria-current="page">Community</a>
                    </li>
                </div>
                <div class="dropdown">
                    <li class="nav-item">
                        <a class="nav-link active" id="company" aria-current="page">Company</a>
                    </li>
                </div>
                <div class="dropdown">
                    <li class="nav-item">
                        <a class="nav-link active" id="shop" aria-current="page">Shop</a>
                    </li>
                </div>
            </ul>
            <ul class="nav justify-content-end align-items-center">
                <li class="nav-item dropdown">
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" style="font-weight: 500; font-size:15px" href="#">$ United
                            State</a></li>
                        <li><a class="dropdown-item" style="font-weight: 500; font-size:15px" href="#">£ United
                            Kingdom</a></li>
                        <li><a class="dropdown-item" style="font-weight: 500; font-size:15px" href="#">€
                            International</a></li>
                    </ul>
                </li>
                <li>
                    <form class="d-flex align-items-center m-0" method="post">
                        <div class="input-group ">
                            <input id="searchInput" type="text" class="form-control" placeholder="Search something"
                                   aria-describedby="basic-addon2" name="search">
                            <button type="submit" style="border: 1px solid lightgrey; border-radius: 0 6px 6px 0"><i class="bi bi-search"
                                                                                                                     aria-hidden="true"></i>
                            </button>
                        </div>
                    </form>
                </li>
                <c:if test="${sessionScope['userLogin'] == null}">
                    <li class="nav-item">
                        <a type="button" class="btn btn-secondary ms-3" id="logIn" href="user?action=login">Log In</a>
                    </li>
                    <li class="nav-item">
                        <a type="button" class="btn btn-dark ms-3" id="signUp" href="user?action=register">Sign Up</a>
                    </li>
                </c:if>
                <c:if test="${sessionScope['userLogin'] != null}">
                    <li class="nav-item">
                        <a type="button" class="btn btn-secondary ms-3" href="user?action=logout">Log Out</a>
                    </li>
                </c:if>
                <%--                <li class="nav-item">--%>
                <%--                    <a type="button" class="btn btn-dark" id="logOut" onclick="logOut()" href="index.html">Log Out</a>--%>
                <%--                </li>--%>
            </ul>
        </div>
    </div>


    <c:if test="${sessionScope['role'] == 'pm' || sessionScope['role'] == 'admin'}">
        <a href="manage">
            <button class="btn btn-primary">
                Manager
            </button>
        </a>
    </c:if>

    <c:if test="${sessionScope['userLogin'] != null}">
        <a href="${sessionScope['userLogin'] != null ? "cart" : "user?action=login"}">
            <button id="cartButton" class="btn btn-danger mx-2"
                    style="width: 150px; background:#FF6027FF;border: #FF6027FF">
                <span class="bi bi-bag-plus"
                      aria-hidden="true"> Shopping
                    cart</span></button>
        </a>
<%--        <a href="profile">--%>
<%--            <button id="profile" class="btn btn-dark ms-2" style="width: 130px;"><span class="bi bi-person-plus-fill"> My Profile</span>--%>
<%--            </button>--%>
<%--        </a>--%>
    </c:if>

</nav>