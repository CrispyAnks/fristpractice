<%@ page contentType="text/html;charset=UTF-8" language="java" session="false" isELIgnored="false" %>
<%@taglib prefix="tag" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    Object checkSignup = request.getAttribute("check_signup");
    if(checkSignup != null){
        Boolean checkToken = (Boolean)checkSignup;
        request.setAttribute("checkToken", checkToken);
    } else {

    }
%>

<!DOCTYPE html>
<html>
<head>
  <title>Signup-Gamerk</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="<%=request.getContextPath()%>/page/js/bootstrap-5.3.1-dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/page/css/signup.css" rel="stylesheet">
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
                        <a href="${pageContext.request.contextPath}/gologin" class="list-group-item list-group-item-action">L O G I N</a>
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
            <tag:choose>
                <tag:when test="${checkToken == true}">
                    <div class="alert alert-success alert-dismissible">
                        <button type="button" class="btn-close" data-bs-dismiss="alert" onclick="JumpToURL()"></button>
                        <strong>Registration Completed!</strong> close this prompt and jump to login page...
                    </div>
                </tag:when>
                <tag:when test="${checkToken == false}">
                    <div class="alert alert-danger alert-dismissible">
                        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                        <strong>Registration Failed!</strong>
                    </div>
                </tag:when>
            </tag:choose>

            <h1>Sign up</h1>

            <form action="${pageContext.request.contextPath}/signup" method="post">
              <div class="mb-3 mt-3">
                <label class="form-label">Username:</label>
                <input type="text" class="form-control" id="username" placeholder="Less than 10 characters" name="username" maxlength="10">
              </div>
              <div class="mb-3">
                <label for="pwd" class="form-label">Password:</label>
                <input type="password" class="form-control" id="pwd" placeholder="Less than 10 characters" name="pswd" maxlength="10">
              </div>
              <div class="mb-3">
                <label class="form-label">Gender:</label>
                <input type="text" class="form-control" placeholder="Male/Female/Unknown" name="gender" maxlength="8">
              </div>
              <div class="mb-3">
                <label class="form-label">Intro:</label>
                <input type="text" class="form-control" placeholder="Less than 100 characters" name="intro" maxlength="100">
              </div>
             
              <button type="submit" class="btn btn-primary">Submit</button>
            </form>
        </div>
    </div>

    <script>
        function JumpToURL(){
            location='${pageContext.request.contextPath}/page/login.jsp';
        }
    </script>

</body>
</html>