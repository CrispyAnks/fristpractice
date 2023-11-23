<%@ page import="dataobject.User" %>
<%@ page import="dataobject.Bio" %>
<%@ page import="dataobject.Mark" %>
<%@ page import="java.util.List" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" session="false" %>
<%@taglib prefix="tag" uri="http://java.sun.com/jsp/jstl/core" %>
<% User user = (User)request.getAttribute("user");
  Bio bio = (Bio) request.getAttribute("bio");
  List<Mark> marklist = (List<Mark>) request.getAttribute("mark");

  HttpSession session = request.getSession();
  if(session != null){
    int userId = (int)session.getAttribute("userid");
  }
%>

<!DOCTYPE html>
<html>
<head>
  <title>MYpage-Gamerk</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="${pageContext.request.contextPath}/page/js/bootstrap-5.3.1-dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/page/css/user.css" rel="stylesheet">
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
        <a href="${pageContext.request.contextPath}/index" class="list-group-item list-group-item-action">H O M E</a>
        <tag:if test="${userId == -1}">
          <a href="${pageContext.request.contextPath}/gologin" class="list-group-item list-group-item-action">L O G I N</a>
          <a href="${pageContext.request.contextPath}/gosignup" class="list-group-item list-group-item-action">S I G N  U P</a>
        </tag:if>
        <tag:if test="${userId != -1}">
          <a href="${pageContext.request.contextPath}/logout" class="list-group-item list-group-item-action">L O G O U T</a>
        </tag:if>
        <a href="${pageContext.request.contextPath}/contact" class="list-group-item list-group-item-action">C O N T A C T</a>
      </div>
    </div>
  </div>


  <div class="row myrow">
    <div class="col">
      <h1>avatar img</h1>
      <img src="${pageContext.request.contextPath}${bio.img_src}" class="avatar"/>
    </div>
    <div class="col">
      <h1>bio</h1><br>
      <table class="table table-borderless">
        <thead>
        <tr>
          <th>Username:</th>
          <td>${user.username}</td>
        </tr>
        </thead>
        <tbody>
        <tr>
          <th>Gender</th>
          <td>${bio.gender}</td>
        </tr>
        <tr>
          <th>Bio</th>
          <td>${bio.intro}</td>
        </tr>
        </tbody>
      </table>
      <hr>
      <tag:if test="${user.id == 1}">
        <a class="btn btn-success" href="${pageContext.request.contextPath}/page/data_manage.jsp"}>Data</a>
      </tag:if>
    </div>
  </div>

  <div class="row myrow">
    <div class="col">
      <h1>Marked games</h1>
      <table class="table table-borderless">
        <tbody>
        <tr>
          <th>Want to play</th>
          <td>
            <tag:forEach var="mark" items="<%=marklist%>">
              <tag:if test="${mark.status == 1}">
                ${mark.name}
              </tag:if>
            </tag:forEach>
          </td>
        </tr>
        <tr>
          <th>Playing</th>
          <td>
            <tag:forEach var="mark" items="<%=marklist%>">
              <tag:if test="${mark.status == 2}">
                ${mark.name}
              </tag:if>
            </tag:forEach>
          </td>
        </tr>
        <tr>
          <th>Rated</th>
          <td>
            <tag:forEach var="mark" items="<%=marklist%>">
              <tag:if test="${mark.status == 3}">
                ${mark.name}
              </tag:if>
            </tag:forEach>
          </td>
        </tr>
        </tbody>
      </table>
    </div>
    <div class="col">
      <h1>statistics</h1>
      <table class="table table-borderless">
        <thead>
        <tr>
          <th>Marked game</th>
          <td><%=marklist.size()%></td>
        </tr>
        </thead>
        <tbody>
      </table>
    </div>
  </div>

  <div class="row myrow">
    <div class="col">
      <h1>Comments</h1>
        <tag:forEach var="mark" items="<%=marklist%>">
          <div class="card">
            <div class="card-header">
              <table class="table table-borderless">
                <tr>
                  <th class="comment-table">Game name:${mark.name}</th>
                  <th class="comment-table">Rating:${mark.rating}</th>
                </tr>
              </table>
            </div>
            <div class="card-body">${mark.comment}</div>
            <div class="card-footer">
              <table class="table table-borderless">
                <tr>
                  <th class="comment-table">${mark.comment_date}</th>
                  <th class="comment-table"> <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#myModal1">Manage</button></th>
                  <th class="comment-table"> <button type="button" class="btn btn-dark" data-bs-toggle="modal" data-bs-target="#myModal2">Delete</button></th>
                </tr>
              </table>
            </div>
          </div>
          <br>

          <div class="modal fade" id="myModal1">
            <div class="modal-dialog">
              <div class="modal-content">
                <form action="${pageContext.request.contextPath}/mark/manage?com_id=${mark.id}" method="post">

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

          <div class="modal fade" id="myModal2">
            <div class="modal-dialog">
              <div class="modal-content">


                <div class="modal-header">
                  <h4 class="modal-title">Delete this comment</h4>
                  <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>


                <div class="modal-body">
                  Are you sure you want to delete the current comment?
                </div>
                <div class="modal-footer">
                  <a href="javascript:void(0)" onclick="del('${pageContext.request.contextPath}/mark/delete?com_id=${mark.id}')" class="btn btn-dark" data-bs-dismiss="modal">YES</a>
                  <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
                </div>

              </div>
            </div>
          </div>
        </tag:forEach>
    </div>
  </div>
  <script>
    function del(src){
      document.location.href=src;
    }
  </script>

</div>

</body>
</html>