<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <%@ include file="bootstrap.jsp" %>
    <link href="/css/style.css" rel="stylesheet">
</head>
<body>
<%@ include file="header.jsp" %>
<div class="without-header-height background">
    <div class="container" >
        <div class="row">
            <c:forEach var="item" items="${tracks}">
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
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>
</body>
</html>
