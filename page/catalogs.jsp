<%@ page import="dataobject.Game" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" session="false" isELIgnored="false" %>
<%@taglib prefix="tag" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    List<Game> switchRanking = (List<Game>)request.getAttribute("switch");
%>

<!DOCTYPE html>
<html>
<head>
  <title>Catalogs-Gamerk</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="<%=request.getContextPath()%>/page/js/bootstrap-5.3.1-dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/page/css/catalogs.css" rel="stylesheet">
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
                        <a href="${pageContext.request.contextPath}/page/login.jsp" class="list-group-item list-group-item-action">L O G I N</a>
                        <a href="${pageContext.request.contextPath}/page/signup.jsp" class="list-group-item list-group-item-action">S I G N  U P</a>
                    </tag:if>
                    <tag:if test="${not empty userid1}">
                        <a href="<%=request.getContextPath()%>/mypage" class="list-group-item list-group-item-action">M Y P A G E</a>
                        <a href="${pageContext.request.contextPath}/logout" class="list-group-item list-group-item-action">L O G O U T</a>
                    </tag:if>
                    <a href="${pageContext.request.contextPath}/page/contact.jsp" class="list-group-item list-group-item-action">C O N T A C T</a>
                </div>
            </div>
        </div>
    

        <div class="row myrow">
          <div class="col">
              <div class="container mt-3">
                <h2>Nintendo Switch</h2>
                <div class="list-group">
                  <a href="${pageContext.request.contextPath}/game?id=<%=switchRanking.get(0).getId()%>" class="list-group-item list-group-item-action"><%=switchRanking.get(0).getName()%></a>
                  <a href="${pageContext.request.contextPath}/game?id=<%=switchRanking.get(0).getId()%>" class="list-group-item list-group-item-action"><%=switchRanking.get(0).getName()%></a>
                  <a href="${pageContext.request.contextPath}/game?id=<%=switchRanking.get(0).getId()%>" class="list-group-item list-group-item-action"><%=switchRanking.get(0).getName()%></a>
                </div>
              </div>
          </div>
          <div class="col">
            <div class="container mt-3">
              <h2>PC</h2>
              <div class="list-group">
                <a href="#" class="list-group-item list-group-item-action">1</a>
                <a href="#" class="list-group-item list-group-item-action">2</a>
                <a href="#" class="list-group-item list-group-item-action">3</a>
              </div>
            </div>
          </div>
        </div>

        <!--
        <div class="row myrow part01">
          <div class="col">
            <div class="container mt-3">
              <h2>catalog1</h2>
              <div class="list-group">
                <a href="#" class="list-group-item list-group-item-action">第一项</a>
                <a href="#" class="list-group-item list-group-item-action">第二项</a>
                <a href="#" class="list-group-item list-group-item-action">第三项</a>
              </div>
            </div>
          </div>
          <div class="col">
            <div class="container mt-3">
              <h2>catalog1</h2>
              <div class="list-group">
                <a href="#" class="list-group-item list-group-item-action">第一项</a>
                <a href="#" class="list-group-item list-group-item-action">第二项</a>
                <a href="#" class="list-group-item list-group-item-action">第三项</a>
              </div>
            </div>
          </div>
        </div>

        <div class="row myrow part01">
          <div class="col">
            <div class="container mt-3">
              <h2>catalog1</h2>
              <div class="list-group">
                <a href="#" class="list-group-item list-group-item-action">第一项</a>
                <a href="#" class="list-group-item list-group-item-action">第二项</a>
                <a href="#" class="list-group-item list-group-item-action">第三项</a>
              </div>
            </div>
          </div>
          <div class="col">
            <div class="container mt-3">
              <h2>catalog1</h2>
              <div class="list-group">
                <a href="#" class="list-group-item list-group-item-action">第一项</a>
                <a href="#" class="list-group-item list-group-item-action">第二项</a>
                <a href="#" class="list-group-item list-group-item-action">第三项</a>
              </div>
            </div>
          </div>
        </div>

        <div class="row myrow part01">
          <div class="col">
            <div class="container mt-3">
              <h2>catalog1</h2>
              <div class="list-group">
                <a href="#" class="list-group-item list-group-item-action">第一项</a>
                <a href="#" class="list-group-item list-group-item-action">第二项</a>
                <a href="#" class="list-group-item list-group-item-action">第三项</a>
              </div>
            </div>
          </div>
          <div class="col">
            <div class="container mt-3">
              <h2>catalog1</h2>
              <div class="list-group">
                <a href="#" class="list-group-item list-group-item-action">第一项</a>
                <a href="#" class="list-group-item list-group-item-action">第二项</a>
                <a href="#" class="list-group-item list-group-item-action">第三项</a>
              </div>
            </div>
          </div>
        </div>

        <div class="row myrow part01">
          <div class="col">
            <div class="container mt-3">
              <h2>catalog1</h2>
              <div class="list-group">
                <a href="#" class="list-group-item list-group-item-action">第一项</a>
                <a href="#" class="list-group-item list-group-item-action">第二项</a>
                <a href="#" class="list-group-item list-group-item-action">第三项</a>
              </div>
            </div>
          </div>
          <div class="col">
            <div class="container mt-3">
              <h2>catalog1</h2>
              <div class="list-group">
                <a href="#" class="list-group-item list-group-item-action">第一项</a>
                <a href="#" class="list-group-item list-group-item-action">第二项</a>
                <a href="#" class="list-group-item list-group-item-action">第三项</a>
              </div>
            </div>
          </div>
        </div>
        -->
</body>
</html>