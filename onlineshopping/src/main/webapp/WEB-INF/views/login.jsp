<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<spring:url var="css" value="/resources/css" />

<!------ Include the above in your HEAD tag ---------->

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />


<script>
	window.contextPath = '${contextPath}'
</script>

<%@include file="../views/shared/navbar.jsp"%>

<link href="${css}/login-form.css" rel="stylesheet">

<div class="container">


	<div id="login-row"
		class="row justify-content-center align-items-center">
		<div id="login-column" class="col-md-6">
			<div class="box">
				<div class="shape1"></div>
				<div class="shape2"></div>
				<div class="shape3"></div>
				<div class="shape4"></div>
				<div class="shape5"></div>
				<div class="shape6"></div>
				<div class="shape7"></div>
				<div class="float">


					<form action="${contextPath}/login" method="POST" class="form"
						id="loginForm">
						<div class="form-group">
							<label for="username" class="text-white">Username:</label><br>
							<input type="text" name="username" id="username"
								class="form-control">
						</div>
						<div class="form-group">
							<label for="password" class="text-white">Password:</label><br>
							<input type="password" name="password" id="password"
								class="form-control">
						</div>
						<div class="form-group">
							<input type="submit" name="submit" class="btn btn-primary"
								value="submit"> <input type="hidden"
								name="${_csrf.parameterName}" value="${_csrf.token}" />
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>

