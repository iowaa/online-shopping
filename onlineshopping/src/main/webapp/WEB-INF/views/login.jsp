<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<spring:url var="css" value="/resources/css" />
<spring:url var="js" value="/resources/js" />
<spring:url var="images" value="/resources/images" />

<%@include file="../views/flows/shared/flow-header.jsp"%>
<%@include file="../views/shared/navbar.jsp"%>



<!DOCTYPE html>
<html lang="en">

<head>



<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">



<title>Online Operation Market - ${title}</title>

<script>
	window.menu = '${title}';

	window.contextPath = '${contextPath}'
</script>


<!-- Bootstrap core CSS -->
<link href="${css}/bootstrap.min.css" rel="stylesheet">

<!-- BootStrap Readable Theme -->

<!-- BootStrap Datatable   -->
<link href="${css}/dataTables.bootstrap.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="${css}/myapp.css" rel="stylesheet">

<link href="${css}/review.css" rel="stylesheet">

<!--  Adding breadcrumb to the project -->
<link href="${css}/breadcrumb.css" rel="stylesheet">

</head>

<body>

	<div class="container register">

		<!-- Navigation -->
		<%-- <div class="content">
			<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
				<div class="container">
					<div class="navbar-header">
						<a href="${contextPath}/home">Online Shopping</a>
					</div>
				</div>
			</nav>
		</div> --%>

		<!-- Page Content -->
		<div class="row">
			<!-- Displayed if the credentials are wrong  -->
			<c:if test="${not empty message}">
				<div class="row">
					<div class="col-xs-12 col-md-offset-2 col-md-8">
						<div class="alert alert-danger fade in">${message}</div>
					</div>
				</div>
			</c:if>

			<c:if test="${not empty logout}">
				<div class="row">
					<div class="col-xs-12 col-md-offset-2 col-md-8">
						<div class="alert alert-success">${logout}</div>
					</div>
				</div>
			</c:if>

			<div class="row">
				<div class="col-lg register-left">
					<h2>Welcome to Online Shopping</h2>
					<img src="https://image.ibb.co/n7oTvU/logo_white.png" alt="" />
				</div>

				<div class="col-md-register-right">

					<h2 style="text-align: center; padding-top: 15px">Login Here</h2>

					<div class="container"
						style="text-align: center; padding-top: 50px;">
						<form action="${contextPath}/login" method="POST"
							class="form-horizontal" id="loginForm">
							<div class="form-group">
								<label for="username" class="col-md-4 control-label">Email:
								</label>
								<div class="col-md-8">
									<input type="text" name="username" id="username"
										class="form-control" />
								</div>
							</div>


							<div class="form-group">
								<label for="password" class="col-md-4 control-label">Password:
								</label>
								<div class="col-md-8">
									<input type="password" name="password" id="password"
										class="form-control" />
								</div>
							</div>
							<div class="form-group">
								<div class="col-md-offset-4 col-md-8">
									<input type="submit" value="Login" class="btn btn-primary" />
									<input type="hidden" name="${_csrf.parameterName}"
										value="${_csrf.token}" />
								</div>
							</div>
						</form>

					</div>
					<div class="panel-footer">
						<div class="text-right">
							New User - <a href="${contextPath}/register">Register Here</a>
						</div>
					</div>

				</div>

			</div>

		</div>

	</div>


	<!-- Footer -->

	<!-- Bootstrap core JavaScript -->
	<script src="${js}/jquery.js"></script>

	<script src="${js}/login.validate.js"></script>

	<!-- JQuery Validation -->
	<script src="${js}/jquery.validate.js"></script>

	<!-- Own JSP File -->
	<script src="${js}/categoryValidate.js"></script>


	<script src="${js}/bootstrap.min.js"></script>

	<!--  Own JSP FIle -->
	<script src="${js}/myapp.js"></script>


</body>

</html>