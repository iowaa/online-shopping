<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<spring:url var="css" value="/resources/css" />
<spring:url var="js" value="/resources/js" />
<spring:url var="images" value="/resources/images" />

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
<link href="${css}/bootstrap-readable-theme.css" rel="stylesheet">

<!-- BootStrap Datatable   -->
<link href="${css}/dataTables.bootstrap.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="${css}/myapp.css" rel="stylesheet">

<link href="${css}/review.css" rel="stylesheet">

<!--  Adding breadcrumb to the project -->
<link href="${css}/breadcrumb.css" rel="stylesheet">



</head>

<body>

	<div class="wrapper">

		<!-- Navigation -->
		<%@include file="./shared/navbar.jsp"%>

		<!-- Page Content -->
		<div class="content">

			<c:if test="${userClickHome == true}">
				<%@include file="home.jsp"%>
			</c:if>

			<!--  Load Only When user clicks about  -->
			<c:if test="${userClickAbout == true}">
				<%@include file="about.jsp"%>
			</c:if>

			<!--  List Only when user clicks contact -->
			<c:if test="${userClickContact == true}">
				<%@include file="contact.jsp"%>
			</c:if>

			<!--  Load only when user clicks listProducts -->
			<c:if
				test="${userClickAllProducts == true or userClickCategoryProducts == true}">
				<%@include file="listProducts.jsp"%>
			</c:if>

			<!--  Load only when user clicks Career -->
			<c:if test="${userClickCareer == true}">
				<%@include file="career.jsp"%>
			</c:if>

			<!--  Load only when user click single product -->
			<c:if test="${userClickShowProduct == true}">
				<%@include file="singleProduct.jsp"%>
			</c:if>

			<!--  Load only when user click manage product -->
			<c:if test="${UserClickManageProducts == true}">
				<%@include file="manageProducts.jsp"%>
			</c:if>
		</div>

		<!-- Footer -->
		<%@include file="./shared/footer.jsp"%>

		<!-- Bootstrap core JavaScript -->
		<script src="${js}/jquery.js"></script>

		<!-- JQuery Validation -->
		<script src="${js}/jquery.validate.js"></script>

		<!-- Own JSP File -->
		<script src="${js}/validate.js"></script>


		<script src="${js}/bootstrap.min.js"></script>

		<!-- Datatable Plugins -->
		<script src="${js}/jquery.dataTables.js"></script>

		<!-- Datatable bootstrap script  -->
		<script src="${js}/dataTables.bootstrap.js"></script>

		<!-- Bootbox -->
		<script src="${js}/bootbox.min.js"></script>

		<!--  Custom JS file , will not work if in myapp.js-->
		<script src="${js}/bootbox.alert.js"></script>

		<!--  Own JSP FIle -->
		<script src="${js}/myapp.js"></script>

	</div>

</body>

</html>