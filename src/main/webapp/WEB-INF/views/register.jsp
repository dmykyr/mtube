<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@ include file="bootstrap.jsp" %>
</head>
<body>
<%@ include file="header.jsp" %>
<div class="container">
    <div class="row">
        <h3>Register</h3>
        <form action="add" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <input type="email" name="email" placeholder="Email" class="form-control" />
            </div>
            <div class="form-group">
                <input type="password" name="password" placeholder="Password" class="form-control" />
            </div>
            <div class="form-group">
                <input type="file" name="avatar" class="form-control" />
            </div>
            <div class="form-group">
                <input type="submit" name="submit" value="Register" class="btn btn-success" />
            </div>
        </form>
    </div>
</div>
</body>
</html>
