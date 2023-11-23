<%@ page import="dataobject.Game" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dataobject.News" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" session="false" isELIgnored="false" %>
<%@taglib prefix="tag" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    List<Game> gamelist = (List)request.getAttribute("gamelist");
    List<Game> newgames = (List)request.getAttribute("newgames");
    List<News> newsIndex = (List)request.getAttribute("news_index");
    ArrayList<String> intro = (ArrayList<String>)request.getAttribute("newintro");
%>
<!DOCTYPE html>
<html>
<head>
  <title>Homepage-Gamerk</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="<%=request.getContextPath()%>/page/js/bootstrap-5.3.1-dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="<%=request.getContextPath()%>/page/css/index.css" rel="stylesheet">
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

                    <tag:if test="${empty userid1}">
                        <a href="${pageContext.request.contextPath}/gologin" class="list-group-item list-group-item-action">L O G I N</a>
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
            <!-- Carousel -->
          <div id="demo" class="carousel slide" data-bs-ride="carousel">

            <!-- Indicators/dots -->
            <div class="carousel-indicators">
              <button type="button" data-bs-target="#demo" data-bs-slide-to="0" class="active"></button>
              <button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
              <button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
            </div>
            
            <!-- The slideshow/carousel -->
            <div class="carousel-inner">
              <div class="carousel-item active">
                <img src="https://static.runoob.com/images/mix/img_fjords_wide.jpg" class="d-block" style="width:100%">
                <div class="carousel-caption">
                  <h3>Theme 1</h3>
                  <p>intro</p>
                </div>
              </div>
              <div class="carousel-item">
                <img src="https://static.runoob.com/images/mix/img_nature_wide.jpg" class="d-block" style="width:100%">
                <div class="carousel-caption">
                  <h3>Theme 2</h3>
                  <p>intro</p>
                </div> 
              </div>
              <div class="carousel-item">
                <img src="https://static.runoob.com/images/mix/img_mountains_wide.jpg" class="d-block" style="width:100%">
                <div class="carousel-caption">
                  <h3>Theme 3</h3>
                  <p>intro</p>
                </div>  
              </div>
            </div>
            
            <!-- Left and right controls/icons -->
            <button class="carousel-control-prev" type="button" data-bs-target="#demo" data-bs-slide="prev">
              <span class="carousel-control-prev-icon"></span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#demo" data-bs-slide="next">
              <span class="carousel-control-next-icon"></span>
            </button>
          </div>
        </div>

        <div class="row myrow">
            <div class="col">
                <div class="container mt-3">
                  <h2>ranking</h2>
                  <div class="list-group">
                      <tag:forEach var="game" items="<%=gamelist%>">
                          <a href="${pageContext.request.contextPath}/game?id=${game.id}" class="list-group-item list-group-item-action">${game.name}</a>
                      </tag:forEach>
                  </div>
                </div>
            </div>
            <div class="col">
                <div class="container mt-3">
                  <h2>news</h2>
                  <div class="list-group">
                      <tag:forEach var="news" items="<%=newsIndex%>">
                          <a href="${news.src}" class="list-group-item list-group-item-action">${news.title}</a>
                      </tag:forEach>
                  </div>
                </div>
            </div>
        </div>

        <div class="row myrow">
            <div class="col">
              <h2>new releases</h2>
              <div id="accordion">
                <div class="card">
                    <div class="card-header">
                        <a class="btn" data-bs-toggle="collapse" href="#collapseOne">
                        <%=newgames.get(0).getName()%> <%=newgames.get(0).getRel_date()%>
                        </a>
                    </div>
                    <div id="collapseOne" class="collapse show" data-bs-parent="#accordion">
                        <div class="card-body">
                        <%=intro.get(0)%>
                        </div>
                    </div>
                </div>
                <div class="card">
                    <div class="card-header">
                        <a class="collapsed btn" data-bs-toggle="collapse" href="#collapseTwo">
                            <%=newgames.get(1).getName()%> <%=newgames.get(1).getRel_date()%>
                        </a>
                    </div>
                     <div id="collapseTwo" class="collapse" data-bs-parent="#accordion">
                        <div class="card-body">
                            <%=intro.get(1)%>
                        </div>
                    </div>
                </div>
                <div class="card">
                    <div class="card-header">
                        <a class="collapsed btn" data-bs-toggle="collapse" href="#collapseThree">
                            <%=newgames.get(1).getName()%> <%=newgames.get(1).getRel_date()%>
                        </a>
                    </div>
                    <div id="collapseThree" class="collapse" data-bs-parent="#accordion">
                        <div class="card-body">
                            <%=intro.get(1)%>
                        </div>
                    </div>
                </div>
            </div>
            </div>
            <div class="col">
                <h1>others</h1>
            </div>
        </div>
    </div>

</body>
</html>