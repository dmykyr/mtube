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
<div class="profile-background">
    <div class="row">
        <div class="container-fluid p-3 profile-card">
            <div class="row">
                <div class="col-lg-3 border-end border-dark">
                    <img src="data:image/jpeg;base64, ${user.avatar}" class="img-fluid" alt="Avatar">
                </div>
                <div class="col-lg-5">
                    <h2 class="pt-5">${user.email}</h2>
                    <p>Joined: ${user.createdAt}</p>
                </div>
            </div>
        </div>
    </div>
    <div class="row row-cols-1 row-cols-md-3 g-4 m-2 music-list">
        <c:forEach var="item" items="${trackList}">
            <div class="col">
                <div class="card h-100 shadow-sm rounded d-inline-block music-item-card-bg"
                     onmouseover="hoverIn(this)" onmouseout="hoverOut(this)">
                    <div class="card-body">
                        <h5 class="card-title music-title">${item.title}</h5>
                        <h6 class="card-subtitle mb-2 text-muted artist-title">${item.artist}</h6>
                        <audio id="audio${item.id}" src="${item.audiopath}" controls></audio>
                    </div>
                    <div class="card-footer" style="background: #1a237e; color: #e8eaf6;">
                        <small class="text-muted">Created: ${item.createdAt}</small>
                        <div class="d-flex justify-content-between align-items-center mt-2 mb-0">
                            <form action="change-track-status" method="post" class="d-inline">
                                <input type="hidden" name="trackId" value="${item.id}" />
                                <input type="submit" name="status" class="btn btn-outline-light btn-sm" value="${item.trackStatus}" />
                            </form>
                            <form action="delete-track" method="post" class="d-inline">
                                <input type="hidden" name="trackId" value="${item.id}" />
                                <input type="submit" class="btn btn-outline-danger btn-sm" value="Delete" />
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
</body>
</html>

<script>
    function hoverIn(card) {
        card.style.background = 'rgba(255, 255, 255, 1)';
        var audio = card.querySelector('audio');
        audio.classList.add('hovered');

        var style = document.createElement('style');
        style.innerHTML = `
    .hovered::-webkit-media-controls-panel {
        background-color: #3949ab;
    }`;
        document.head.appendChild(style);
    }

    function hoverOut(card) {
        card.style.background = 'rgba(255, 255, 255, 0.8)';
        var audio = card.querySelector('audio');
        audio.classList.remove('hovered');
    }
</script>
