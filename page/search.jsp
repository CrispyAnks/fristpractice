<%@ page import="dataobject.Info" %>
<%@ page import="java.util.List" %>
<%@ page import="dataobject.Game" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" session="false" isELIgnored="false" %>
<%@taglib prefix="tag" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    Object result1 = request.getAttribute("result");
    if(result1 == null){
        request.setAttribute("token", false);
    }else {
        request.setAttribute("token", true);
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Search-Gamerk</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="<%=request.getContextPath()%>/page/js/bootstrap-5.3.1-dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/page/css/search.css" rel="stylesheet">
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
            <h1>Search</h1>
            <form action="<%=request.getContextPath()%>/result" class="needs-validation" novalidate method="post">
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="Find a game?" name="game_name" required>
                    <button class="btn btn-success" type="submit">Go</button>
                </div>
            </form>
        </div>

        <div class="row myrow">
            <tag:if test="${token}">
                <%
                    List<Game> result = (List<Game>)request.getAttribute("result");
                    List<Info> info = (List<Info>) request.getAttribute("result_info");
                    int i = 0;
                %>
                <tag:choose>
                    <tag:when test="<%=result.isEmpty()%>">
                        <div class="alert alert-danger alert-dismissible">
                            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                            <strong>No result...</strong>
                        </div>
                    </tag:when>
                    <tag:otherwise>
                        <tag:forEach var="game" items="<%=result%>">
                            <table class="card">
                                <tbody>
                                <tr>
                                    <th rowspan="2"><img class="" src="${pageContext.request.contextPath}<%=info.get(i).getImg_src()%>" alt="Card image" style="max-height: 150px;height: auto"></th>
                                    <td><a href="${pageContext.request.contextPath}/game?id=${game.id}" class="display-6 result_title">${game.name}</a><hr></td>
                                </tr>
                                <tr>
                                    <td><p class="h6 result_intro"><%=info.get(i).getIntro()%></p></td>
                                </tr>
                                </tbody>
                            </table>
                            <%i++;%>
                        </tag:forEach>
                        <p class="result_intro">Total: <%=i%> results.</p>
                    </tag:otherwise>
                </tag:choose>
            </tag:if>
        </div>
    </div>

</body>
</html>