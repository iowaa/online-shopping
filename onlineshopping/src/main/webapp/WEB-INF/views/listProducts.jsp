
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

						<script>
							window.categoryId = '';
						</script>
						<ul class="breadcrumb">
							<li><a href="${contextPath}/home">Home</a></li>
							<li class="active">All Products</li>

						</ul>
					</c:if>

					<c:if test="${userClickCategoryProducts == true}">
						<script>
							window.categoryId = '${category.id}';
						</script>
						<ul class="breadcrumb">
							<li><a href="${contextPath}/home">Home</a></li>
							<li class="active">Category</li>
							<li class="active">${category.name}</li>

						</ul>
					</c:if>

					<div class="row">

						<div class="col-xs-12">

							<div class="container-fluid">
							
								<div class="table-responsive">
								
									<table id="productListTable"
										class="table table-striped table-bordered">
										<thead>
											<tr>
												<th>S.No</th>
												<th>Image</th>
												<th>Name</th>
												<th>Brand</th>
												<th>Price</th>
												<th>Qty. Available</th>
												<th></th>
											</tr>
										</thead>
									</table>
								</div>
								
							</div>
							
						</div>

					</div>






				</div>

			</div>


		</div>
	</div>

</div>