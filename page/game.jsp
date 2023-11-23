<%@ page import="dataobject.Game" %>
<%@ page import="dataobject.Tag" %>
<%@ page import="dataobject.Info" %>
<%@ page import="dataobject.Mark" %>
<%@ page import="java.util.List" %>
<%@ page import="utils.PlatformList" %>
<%@ page import="utils.TagList" %>
<%@ page import="javax.swing.text.html.HTML" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" session="false" %>
<%@taglib prefix="tag" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    Game game = (Game) request.getAttribute("game");
    Tag tag = (Tag) request.getAttribute("tag");
    Info info = (Info)request.getAttribute("info");
    List<Mark> comments = (List) request.getAttribute("comments");
%>

<!DOCTYPE html>
<html>
<head>
  <title>Game-Gamerk</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="${pageContext.request.contextPath}/page/js/bootstrap-5.3.1-dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/page/css/game.css" rel="stylesheet">
  <script src="${pageContext.request.contextPath}/page/js/bootstrap-5.3.1-dist/js/bootstrap.bundle.min.js"></script>
  <script src="${pageContext.request.contextPath}/page/js/index.js"></script>
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
                  <a class="nav-link" href="${pageContext.request.contextPath}/catalog">Catalogs</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="${pageContext.request.contextPath}/news">News</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="${pageContext.request.contextPath}/search">Search</a>
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
                        <a href="${pageContext.request.contextPath}/gosignup" class="list-group-item list-group-item-action">S I G N  U P</a>
                    </tag:if>
                    <tag:if test="${not empty userid1}">
                        <a href="${pageContext.request.contextPath}/mypage" class="list-group-item list-group-item-action">M Y P A G E</a>
                        <a href="${pageContext.request.contextPath}/logout" class="list-group-item list-group-item-action">L O G O U T</a>
                    </tag:if>
                    <a href="${pageContext.request.contextPath}/contact" class="list-group-item list-group-item-action">C O N T A C T</a>
                </div>
            </div>
        </div>
    

        <div class="row myrow">
          <div class="col">
            <h1><img src="${pageContext.request.contextPath}<%=info.getImg_src()%>" class="mainvission"/></h1>
        </div>
        <div class="col">
            <h1><%=game.getName()%></h1>
            <table class="table table-borderless">
              <thead>
                  <tr>
                      <th>Rating</th>
                      <td><%=game.getRating()%></td>
                  </tr>
              </thead>
              <tbody>
                  <tr>
                      <th>Release date</th>
                      <td><%=game.getRel_date()%></td>
                  </tr>
                  <tr>
                      <th>Tags</th>                     
                      <td><%=TagList.getTag01List().get(tag.getTag_01())%><br>
                          <%=TagList.getTag02List().get(tag.getTag_02())%><br>
                          <%=TagList.getTag03List().get(tag.getTag_03())%></td>
                  </tr>
                 
              </tbody>
          </table>
        </div>
        </div>

        <div class="row myrow">
            <div class="col">
                <h1>introduction</h1>
                <div class="card">
                  <div class="card-header">
                    <table class="table table-borderless">
                        <tr>
                          <th class="comment-table">Intro</th>
                        </tr>
                    </table>
                  </div>
                  <div class="card-body"><%=info.getIntro()%><br><br><br></div>
                  <div class="card-footer">
                    <table class="table table-borderless">
                      <tr>
                          <tag:if test="${not empty userid1}">
                              <th class="comment-table"> <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#myModal1">Mark</button></th>
                          </tag:if>
                      </tr>
                  </table>
                  </div>
                </div>
            </div>
            <div class="col">
                <br>
                <br>
                <table class="table table-dark table-striped">
                  <tbody>
                    <tr>
                      <td>Platform</td>
                      <td><%=PlatformList.getPlatformList().get(info.getPlatform())%></td>
                    </tr>
                    <tr>
                      <td>Producer</td>
                      <td><%=info.getProducer()%></td>
                    </tr>
                    <tr>
                      <td>Main staffs</td>
                      <td><%=info.getMain_staff()%></td>
                    </tr>
                  </tbody>
                </table>
            </div>
        </div>

        <div class="row myrow">
            <div class="col">
                <h1>Comments</h1>
                <tag:forEach var="comment" items="<%=comments%>">
                    <div id="accordion">
                        <div class="card">
                            <div class="card-header">
                                <a class="btn" data-bs-toggle="collapse" href="#collapseOne">
                                    <table class="table table-borderless">
                                        <tr>
                                            <th class="comment-table">User:${comment.username}</th>
                                            <th class="comment-table">Rating:${comment.rating}</th>
                                            <th class="comment-table">Rating:${comment.comment_date}</th>
                                        </tr>
                                    </table>
                                </a>
                            </div>
                            <div id="collapseOne" class="collapse show" data-bs-parent="#accordion">
                                <div class="card-body">
                                    ${comment.comment}
                                </div>
                            </div>
                        </div>
                </tag:forEach>

              </div>
            </div>
            <div class="col">
                <h1>links</h1>
                <table class="table table-dark table-striped">
                  <tbody>
                    <tr>
                      <td>Linkname</td>
                      <td>href1</td>
                    </tr>
                    <tr>
                      <td>Linkname</td>
                      <td>href1</td>
                    </tr>
                    <tr>
                      <td>Linkname</td>
                      <td>href1</td>
                    </tr>
                    <tr>
                      <td>Linkname</td>
                      <td>href1</td>
                    </tr>
                    <tr>
                      <td>Linkname</td>
                      <td>href1</td>
                    </tr>
                  </tbody>
                </table>
            </div>
        </div>
    </div>

    <div class="modal fade" id="myModal1">
      <div class="modal-dialog">
        <div class="modal-content">
          <form action="${pageContext.request.contextPath}/mark/add?com_id=${userid1}m<%=game.getId()%>&user_id=${userid1}&game_id=<%=game.getId()%>" method="post">
          
            <div class="modal-header">
              <h4 class="modal-title">Manage your comment</h4>
              <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
      
            
            <div class="modal-body">
                <table class="table table-borderless">
                  <tbody>
                    <tr>
                      <th>Rating:</th>
                      <td><input type="text" placeholder="Edit rating" name="rating"></td>
                    </tr>
                    <tr>
                        <td><input type="radio" class="form-check-input" id="radio1" name="status" value="1" CHECKED>
                            <label class="form-check-label" for="radio2">Plan</label></td>
                        <td><input type="radio" class="form-check-input" id="radio2" name="status" value="2">
                            <label class="form-check-label" for="radio2">Playing</label></td>
                        <td><input type="radio" class="form-check-input" id="radio3" name="status" value="3">
                            <label class="form-check-label" for="radio2">Played</label></td>
                    </tr>
                    <tr>
                      <td><label for="comment">Comment：</label></td>
                      <td>
                          <div class="mb-3 mt-3">
                            <textarea class="form-control" rows="5" id="comment" name="comment"></textarea>
                          </div>  
                      </td>                          
                    </tr>
                  </tbody>
                </table>               
            </div>  

            <div class="modal-footer">
              <button type="submit" class="btn btn-success" data-bs-dismiss="modal">OK</button>
              <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
            </div>
          </form>
        </div>
      </div>
    </div>
</body>
</html>