<%@ page import="java.util.List" %>
<%@ page import="dataobject.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" session="false" isELIgnored="false" %>
<%@taglib prefix="tag" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    Object data_manage_result = request.getAttribute("data_manage_result");
    if(data_manage_result != null){
        Boolean checkToken = (Boolean)data_manage_result;
        request.setAttribute("resultToken", checkToken);
    }

    Object tableList = request.getAttribute("tableList");
%>

<!DOCTYPE html>
<html>
<head>
  <title>Signup-Gamerk</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="<%=request.getContextPath()%>/page/js/bootstrap-5.3.1-dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/page/css/data_manage.css" rel="stylesheet">
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
                <tag:when test="${resultToken == false}">
                    <div class="alert alert-danger alert-dismissible">
                        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                        <strong>Data update failed!</strong>
                    </div>
                </tag:when>
            </tag:choose>


            <h1>Select your Database</h1>
            <form action="${pageContext.request.contextPath}/manage">
                <div class="form-check">
                    <input type="radio" class="form-check-input" id="radio1" name="table" value="Bio">
                    <label class="form-check-label" for="radio1">Bio</label>
                </div>
                <div class="form-check">
                    <input type="radio" class="form-check-input" id="radio2" name="table" value="Game">
                    <label class="form-check-label" for="radio2">Game</label>
                </div>
                <div class="form-check">
                    <input type="radio" class="form-check-input" id="radio3" name="table" value="Info">
                    <label class="form-check-label" for="radio2">Info</label>
                </div>
                <div class="form-check">
                    <input type="radio" class="form-check-input" id="radio4" name="table" value="Mark">
                    <label class="form-check-label" for="radio2">Mark</label>
                </div>
                <div class="form-check">
                    <input type="radio" class="form-check-input" id="radio5" name="table" value="News">
                    <label class="form-check-label" for="radio2">News</label>
                </div>
                <div class="form-check">
                    <input type="radio" class="form-check-input" id="radio6" name="table" value="Tag">
                    <label class="form-check-label" for="radio2">Tag</label>
                </div>
                <div class="form-check">
                    <input type="radio" class="form-check-input" id="radio7" name="table" value="User">
                    <label class="form-check-label" for="radio2">User</label>
                </div>
                <button type="submit" class="btn btn-primary mt-3">Submit</button>
                <br>
            </form>


            <tag:if test="<%=tableList != null%>">
                <br>
                <hr>
                <%
                    String tableName = (String)request.getAttribute("tableName");%>
                <tag:choose>
                    <tag:when test="${tableName == 'Bio'}">
                        <%
                            List<Bio> tableList1 = (List<Bio>) request.getAttribute("tableList");
                        %>
                        <table>
                            <tr>
                                <th>id</th>
                                <th>gender</th>
                                <th>intro</th>
                                <th>img_src</th>
                            </tr>
                            <tag:forEach var="obj" items="<%=tableList1%>">
                                <tr>
                                    <th>${obj.id}</th>
                                    <th>${obj.gender}</th>
                                    <th>${obj.intro}</th>
                                    <th>${obj.img_src}</th>
                                </tr>
                            </tag:forEach>
                        </table>

                    </tag:when>
                    <tag:when test="${tableName == 'Game'}">
                        <%
                            List<Game> tableList1 = (List<Game>) request.getAttribute("tableList");
                        %>
                        <table>
                            <tr>
                                <th>id</th>
                                <th>name</th>
                                <th>rel_date</th>
                                <th>rating</th>
                                <th>info_id</th>
                                <th>tag_id</th>
                            </tr>
                            <tag:forEach var="obj" items="<%=tableList1%>">
                                <tr>
                                    <th>${obj.id}</th>
                                    <th>${obj.name}</th>
                                    <th>${obj.rel_date}</th>
                                    <th>${obj.rating}</th>
                                    <th>${obj.info_id}</th>
                                    <th>${obj.tag_id}</th>
                                </tr>
                            </tag:forEach>
                        </table>
                    </tag:when>
                    <tag:when test="${tableName == 'Info'}">
                        <%
                            List<Info> tableList1 = (List<Info>) request.getAttribute("tableList");
                        %>
                        <table>
                            <tr>
                                <th>id</th>
                                <th>platform</th>
                                <th>producer</th>
                                <th>intro</th>
                                <th>main_staff</th>
                                <th>img_src</th>
                            </tr>
                            <tag:forEach var="obj" items="<%=tableList1%>">
                                <tr>
                                    <th>${obj.id}</th>
                                    <th>${obj.platform}</th>
                                    <th>${obj.producer}</th>
                                    <th>${obj.intro}</th>
                                    <th>${obj.main_staff}</th>
                                    <th>${obj.img_src}</th>
                                </tr>
                            </tag:forEach>
                        </table>
                    </tag:when>
                    <tag:when test="${tableName == 'Mark'}">
                        <%
                            List<Mark> tableList1 = (List<Mark>) request.getAttribute("tableList");
                        %>
                        <table>
                            <tr>
                                <th>id</th>
                                <th>status</th>
                                <th>rating</th>
                                <th>comment</th>
                                <th>comment_date</th>
                                <th>user_id</th>
                                <th>game_id</th>
                            </tr>
                            <tag:forEach var="obj" items="<%=tableList1%>">
                            <tr>
                                <th>${obj.id}</th>
                                <th>${obj.status}</th>
                                <th>${obj.rating}</th>
                                <th>${obj.comment}</th>
                                <th>${obj.comment_date}</th>
                                <th>${obj.user_id}</th>
                                <th>${obj.game_id}</th>
                            </tr>
                            </tag:forEach>
                        </table>
                    </tag:when>
                    <tag:when test="${tableName == 'News'}">
                        <%
                            List<News> tableList1 = (List<News>) request.getAttribute("tableList");
                        %>
                        <table>
                            <tr>
                                <th>id</th>
                                <th>title</th>
                                <th>src</th>
                                <th>date</th>
                            </tr>
                            <tag:forEach var="obj" items="<%=tableList1%>">
                                <tr>
                                    <th>${obj.id}</th>
                                    <th>${obj.title}</th>
                                    <th>${obj.src}</th>
                                    <th>${obj.news_date}</th>
                                </tr>
                            </tag:forEach>
                        </table>
                    </tag:when>
                    <tag:when test="${tableName == 'Tag'}">
                        <%
                            List<Tag> tableList1 = (List<Tag>) request.getAttribute("tableList");
                        %>
                        <table>
                            <tr>
                                <th>id</th>
                                <th>tag_01</th>
                                <th>tag_02</th>
                                <th>tag_03</th>
                            </tr>
                            <tag:forEach var="obj" items="<%=tableList1%>">
                                <tr>
                                    <th>${obj.id}</th>
                                    <th>${obj.tag_01}</th>
                                    <th>${obj.tag_02}</th>
                                    <th>${obj.tag_03}</th>
                                </tr>
                            </tag:forEach>
                        </table>
                    </tag:when>
                    <tag:when test="${tableName == 'User'}">
                        <%
                            List<User> tableList1 = (List<User>) request.getAttribute("tableList");
                        %>
                        <table>
                            <tr>
                                <th>id</th>
                                <th>username</th>
                                <th>password</th>
                                <th>bio_id</th>
                            </tr>
                            <tag:forEach var="obj" items="<%=tableList1%>">
                                <tr>
                                    <th>${obj.id}</th>
                                    <th>${obj.username}</th>
                                    <th>${obj.password}</th>
                                    <th>${obj.bio_id}</th>
                                </tr>
                            </tag:forEach>
                        </table>
                    </tag:when>
                </tag:choose>
                <br>
                <br>
                <hr>

                <h1>Update</h1>

                <form action="${pageContext.request.contextPath}/update?table=<%=tableName%>" method="post">
                    <div class="form-check">
                        <input type="radio" class="form-check-input" id="radio8" name="commit" value="add">
                        <label class="form-check-label" for="radio1">Add</label>
                    </div>
                    <div class="form-check">
                        <input type="radio" class="form-check-input" id="radio9" name="commit" value="update">
                        <label class="form-check-label" for="radio2">Update</label>
                    </div>
                    <div class="form-check">
                        <input type="radio" class="form-check-input" id="radio10" name="commit" value="delete">
                        <label class="form-check-label" for="radio2">Delete</label>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Condition:</label>
                        <input type="text" class="form-control" placeholder="for update/delete where ? = (*)" name="condition">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Condition Column:</label>
                        <input type="text" class="form-control" placeholder="for update/delete where (*) = ?" name="condition_column">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Update Value:</label>
                        <input type="text" class="form-control" placeholder="set ? = (*)" name="update_value">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Update Column:</label>
                        <input type="text" class="form-control" placeholder="set (*) = ?" name="update_column">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Insert Value:</label>
                        <input type="text" class="form-control" placeholder="values(*)" name="insert_value">
                    </div>
                    <button type="submit" class="btn btn-primary">Submit</button>
                </form>
            </tag:if>



        </div>
    </div>


</body>
</html>