<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<spring:url var="css" value="/resources/css" />

<link href="${css}/login-form.css" rel="stylesheet">

<%@include file="../shared/flow-header.jsp"%>

<%@include file="../../shared/navbar.jsp"%>

<div class="container register">
	<div class="row">
		<div class="col-lg register-left">
			<h2>Welcome to Online Shopping</h2>
			<h4 style="color: red">${registerModel.user.firstName}</h4>
			<img src="https://image.ibb.co/n7oTvU/logo_white.png" alt="" />
		</div>

		<div class="col-md register-right">

			<h2 style="text-align: center; padding-top: 150px">
				<a href="${contextPath}/login">Login Here</a>
			</h2>

		</div>

	</div>
</div>




