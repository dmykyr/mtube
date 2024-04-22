<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <%@ include file="bootstrap.jsp" %>
</head>
<body>
<%@ include file="header.jsp" %>

<div class="container" >
    <div class="row">
        <div class="justify-content-center col-md-6 col-lg-6 col-sm-6">
            <button onClick="click1()" class="btn btn-outline-warning">+</button>
            <dialog id="add">
                <h4>Add new track</h4>
                <form action="addtrack" method="post" enctype="multipart/form-data">
                    <div class="form-group" >
                        <input type="text" name="title" class="form-control" placeholder="Title" />
                    </div>
                    <div class="form-group" >
                        <input type="text" name="artist" class="form-control" placeholder="Artist" />
                    </div>
                    <div class="form-group" >
                        <input type="file" name="audiopath" class="form-control" />
                    </div>
                    <div class="form-group" >
                        <input type="text" name="trackstatus" class="form-control" placeholder="Status" />
                    </div>
                    <div class="form-group" >
                        <input type="submit" name="submit" class="btn btn-warning" value="Add Track" />
                    </div>
                </form>
            </dialog>
        </div>
    </div>
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

<script>
    function click1(){
        let form = document.getElementById('add');
        console.log("form = "+ form);
        form.showModal();
    }
</script>

</body>
</html>
