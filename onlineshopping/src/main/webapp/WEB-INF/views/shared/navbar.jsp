<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
	<div class="container">
		<a class="navbar-brand" href="${contextPath}/home">Online
			Operation Market</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarResponsive" aria-controls="navbarResponsive"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav ml-auto">

				<li id="home" class="nav-item"><a class="nav-link"
					href="${contextPath}/home">Home</a></li>

				<li id="listProducts" class="nav-item"><a class="nav-link"
					href="${contextPath}/show/all/products">View Products</a></li>

				<security:authorize access="hasAuthority('ADMIN')">
					<li id="manageProducts" class="nav-item"><a class="nav-link"
						href="${contextPath}/manage/products">Manage Products</a></li>
				</security:authorize>
				
				<security:authorize access="hasAuthority('SUPPLIER')">
					<li id="manageProducts" class="nav-item"><a class="nav-link"
						href="${contextPath}/manage/products">Manage Products</a></li>
				</security:authorize>
			</ul>

			<ul class="nav navbar-nav navbar-right">
				<security:authorize access="isAnonymous()">
					<li id="register" class="nav-item"><a class="nav-link"
						href="${contextPath}/register">Sign Up</a></li>

					<li id="login" class="nav-item"><a class="nav-link"
						href="${contextPath}/login">Login</a></li>
				</security:authorize>

				<security:authorize access="isAuthenticated()">
					<li class="dropdown"><a href="javascript:void(0)"
						class="btn btn-default dropdown-toggle" id="userCart"
						data-toggle="dropdown" style="color: white">
							${userModel.fullName} <span class="caret"></span>

					</a>
						<ul class="dropdown-menu">
							<security:authorize access="hasAuthority('USER')">
								<li><a href="${contextPath}/cart/show"> <span
										class="glyphicon glyphicon-shopping-cart"></span> <span
										class="badge">${userModel.cart.cartLines}</span> - &#36;
										${userModel.cart.grandTotal}
								</a></li>
								<li class="divider" role="seperator"></li>
							</security:authorize>
							<li><a href="${contextPath}/perform-logout">Logout</a></li>
						</ul></li>
				</security:authorize>
			</ul>
		</div>
	</div>
</nav>

<script>
window.userRole = '${userModel.role}';
</script>
