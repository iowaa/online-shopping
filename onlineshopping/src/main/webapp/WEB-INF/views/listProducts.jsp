<div class="container">
	<div class="row">

		<!--  To dispaly sidebar -->
		<div class="col-md-3">
			<%@include file="./shared/sidebar.jsp"%>
		</div>

		<!--  To display Products -->
		<div class="col-md-9">
			<!--  Added breadcrumb component -->
			<div class="row">
				<div class="col-lg-12">
					<c:if test="${userClickAllProducts == true}">
						<ul class="breadcrumb">
							<li><a href="${contextPath}/home">Home</a></li>
							<li class="active">All Products</li>

						</ul>
					</c:if>

					<c:if test="${userClickCategoryProducts == true}">
						<ul class="breadcrumb">
							<li><a href="${contextPath}/home">Home</a></li>
							<li class="active">Category</li>
							<li class="active">${category.name}</li>

						</ul>
					</c:if>


				</div>

			</div>


		</div>
	</div>

</div>