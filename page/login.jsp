<%@ page contentType="text/html;charset=UTF-8" language="java" session="false" isELIgnored="false" %>
<%@taglib prefix="tag" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Login-Gamerk</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="<%=request.getContextPath()%>/page/js/bootstrap-5.3.1-dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/page/css/login.css" rel="stylesheet">
    <script src="<%=request.getContextPath()%>/page/js/bootstrap-5.3.1-dist/js/bootstrap.bundle.min.js"></script>
    <script src="<%=request.getContextPath()%>/page/js/index.js"></script>
</head>
<body>
<div class="container-fluid" id="main">
    <nav class="navbar navbar-expand-md bg-dark navbar-dark  fixed-top">

        <a class="navbar-brand" data-bs-toggle="offcanvas" href="#offcanvasExample" role="button" aria-controls="offcanvasExample">Gamerk</a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="collapsibleNavbar">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="<%=request.getContextPath()%>/catalog">Catalogs</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<%=request.getContextPath()%>/news">News</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<%=request.getContextPath()%>/search">Search</a>
                </li>
            </ul>
        </div>
    </nav>

    <div class="offcanvas offcanvas-start" tabindex="10" id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">
        <div class="offcanvas-header">
            <h5 class="offcanvas-title" id="offcanvasExampleLabel">M E N U</h5>
            <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
        </div>
        <div class="offcanvas-body">
            <div id="sidelist" class="list-group">
                <%
                    HttpSession session = request.getSession(false);
                    if(session != null){
                        int userid = (int)session.getAttribute("userid");
                        request.setAttribute("userid1", userid);
                    }
                %>
                <h5 class="offcanvas-title" id="offcanvasExampleLabel">M E N U</h5>
                <a href="${pageContext.request.contextPath}/index" class="list-group-item list-group-item-action">H O M E</a>
                <tag:if test="${empty userid1}">
                    <a href="${pageContext.request.contextPath}/gosignup" class="list-group-item list-group-item-action">S I G N  U P</a>
                </tag:if>
                <tag:if test="${not empty userid1}">
                    <a href="<%=request.getContextPath()%>/mypage" class="list-group-item list-group-item-action">M Y P A G E</a>
                    <a href="${pageContext.request.contextPath}/logout" class="list-group-item list-group-item-action">L O G O U T</a>
                </tag:if>
                <a href="${pageContext.request.contextPath}/contact" class="list-group-item list-group-item-action">C O N T A C T</a>
            </div>
        </div>
    </div>


    <div class="row myrow">
        <h1>Login</h1>
        <form action="<%=request.getContextPath()%>/login" class="needs-validation" novalidate method="post">
            <div class="form-group">
                <label for="uname">Username:</label>
                <input type="text" class="form-control" id="uname" placeholder="Enter username" name="uname" required>
                <div class="valid-feedback">OK！</div>
                <div class="invalid-feedback">Invalid username</div>
            </div>
            <div class="form-group">
                <label for="pwd">Password:</label>
                <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pswd" required>
                <div class="valid-feedback">OK！</div>
                <div class="invalid-feedback">Invalid password！</div>
            </div>
            <!--
            <div class="form-check mb-3">
                <label class="form-check-label">
                    <input class="form-check-input" type="checkbox" name="remember"> Remember me
                </label>
            </div>
            -->
            <br>
            <button type="submit" class="btn btn-primary">LOG IN</button>
        </form>

    </div>

</div>

<script>
    (function() {
        'use strict';
        window.addEventListener('load', function() {
            var forms = document.getElementsByClassName('needs-validation');
            var validation = Array.prototype.filter.call(forms, function(form) {
                form.addEventListener('submit', function(event) {
                    if (form.checkValidity() === false) {
                        event.preventDefault();
                        event.stopPropagation();
                    }
                    form.classList.add('was-validated');
                }, false);
            });
        }, false);
    })();
</script>


</body>
</html>
