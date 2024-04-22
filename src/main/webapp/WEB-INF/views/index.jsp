<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <%@ include file="bootstrap.jsp" %>
</head>
<body>
<%@ include file="header.jsp" %>
<div class="container">
    <div class="row">
        <div class="container-fluid py-5">
            <div class="row">
                <div class="col-lg-3 border-end">
                    <img src="data:image/jpeg;base64, ${user.avatar}" class="img-fluid" alt="Avatar">
                </div>
                <div class="col-lg-5">
                    <h2 class="pt-5">${user.email}</h2>
                    <p>Joined: ${user.createdAt}</p>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <c:forEach var="item" items="${trackList}">
            <div class="card" style="width: 25rem;margin:4px;">
                <ul class="list-group list-group-flush">
                    <li class="list-group-item">${item.title}</li>
                    <li class="list-group-item">${item.artist}</li>
                    <li class="list-group-item">
                        <audio src="${item.audiopath}" controls />
                    </li>
                </ul>
                <div class="card-footer">
                    created: ${item.createdAt}
                    <form action="change-track-status" method="post">
                        <input type="hidden" name="trackId" value="${item.id}" />
                        <input type="submit" name="status" class="btn btn-outline-secondary btn-sm" value="${item.trackStatus}" />
                    </form>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
</body>
</html>
