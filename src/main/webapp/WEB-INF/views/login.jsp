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
                    <div class="card round-card">
                        <div class="card-body p-5">
                            <h5 class="mb-3 pb-3 text-center">Sign in to your account</h5>
                            <form action="login" method="post">
                                <div class="form-outline mb-4">
                                    <input type="email" name="email" class="form-control" />
                                    <label class="form-label">Your Email</label>
                                </div>

                                <div class="form-outline mb-3">
                                    <input type="password" name="password" class="form-control" />
                                    <label class="form-label">Password</label>
                                </div>

                                <div class="d-flex justify-content-center">
                                    <button type="submit" name="submit" class="btn btn-block btn-lg form-submit-btn">
                                        Login
                                    </button>
                                </div>

                                <p class="text-center text-muted mt-4 mb-0">
                                    Don't have an account?
                                    <a href="/register" class="fw-bold text-body"><u>Sign Up</u></a>
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
