<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@ include file="bootstrap.jsp" %>
    <link href="/css/style.css" rel="stylesheet">
</head>
<body>
<%@ include file="header.jsp" %>
<section class="general-height">
    <div class="mask d-flex align-items-center h-100 background">
        <div class="container">
            <div class="row d-flex justify-content-center align-items-center">
                <div class="col-12 col-md-9 col-lg-7 col-xl-6">
                    <div class="card" style="border-radius: 15px;">
                        <div class="card-body p-5">
                            <h5 class="mb-3 pb-3 text-center">Create an account</h5>

                            <form action="add" method="post" enctype="multipart/form-data">
                                <div class="form-outline mb-4">
                                    <input type="email" name="email" class="form-control" />
                                    <label class="form-label">Your Email</label>
                                </div>

                                <div class="form-outline mb-4">
                                    <input type="password" name="password" class="form-control" />
                                    <label class="form-label">Password</label>
                                </div>

                                <div class="form-outline mb-3">
                                    <input type="file" name="avatar" class="form-control" />
                                    <label class="form-label">Avatar</label>
                                </div>

                                <div class="d-flex justify-content-center mb-3">
                                    <button type="submit" name="submit" class="btn btn-block btn-lg form-submit-btn">
                                        Register
                                    </button>
                                </div>

                                <p class="text-center text-muted mb-0">
                                    Have already an account?
                                    <a href="/login" class="fw-bold text-body"><u>Login here</u></a>
                                </p>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
</html>
