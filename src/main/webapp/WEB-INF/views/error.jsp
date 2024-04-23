<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Error page</title>
    <%@ include file="bootstrap.jsp" %>
    <link href="/css/style.css" rel="stylesheet">
</head>
<body>
<div class="d-flex align-items-center background general-height">
    <div class="container">
        <div class="row d-flex justify-content-center align-items-center">
            <div class="col-12 col-md-9 col-lg-7 col-xl-6">
                <div class="card round-card">
                    <div class="card-body p-5">
                        <h5 class="mb-3 pb-3 text-center">Oops! Something went wrong.</h5>
                        <p class="text-center text-muted mt-4 mb-0">
                            We're sorry, but something went wrong. We've been notified about this issue and we'll take a look at it shortly.
                        </p>
                        <div class="d-flex justify-content-center mt-4">
                            <a href="/" class="btn btn-block btn-lg form-submit-btn">
                                Return to Home
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
