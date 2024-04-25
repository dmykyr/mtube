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

<div class="background without-header-height">
        <div class="container-fluid p-3">
            <div class="row row-cols-1 row-cols-md-3 g-4 m-1 music-list">
                <c:forEach var="item" items="${tracks}">
                    <div class="col">
                        <div class="card h-100 shadow-sm rounded d-inline-block music-item-card-bg"
                             onmouseover="hoverIn(this)" onmouseout="hoverOut(this)">
                            <div class="card-body">
                                <h5 class="card-title music-title">${item.title}</h5>
                                <h6 class="card-subtitle mb-2 text-muted artist-title">${item.artist}</h6>
                                <audio id="audio${item.id}" src="${item.audiopath}" controls></audio>
                            </div>
                            <div class="card-footer music-card-footer-color">
                                <small class="text-muted">Created: ${item.createdAt}</small>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
</div>
</body>
</html>

<script>
    function hoverIn(card) {
        card.style.background = 'rgba(255, 255, 255, 1)';
        var audio = card.querySelector('audio');
        if(!audio) return;

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
        if(!audio) return;

        audio.classList.remove('hovered');
    }
</script>