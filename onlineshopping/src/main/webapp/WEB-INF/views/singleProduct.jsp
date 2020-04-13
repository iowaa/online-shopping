<div class="container">
	<!-- Breadcrumb -->
	<div class="row">


		<div class="col-xs-12">

			<ul class="breadcrumb">

				<li><a href="${contextPath}/home">Home</a></li>
				<li><a href="${contextPath}/show/all/products">Products</a></li>

				<li class="active">${product.name}</li>

			</ul>

		</div>
	</div>

</div>

<div class="row">

	<!--  Display the product Image -->
	<div class="col-xs-12 col-sm-4">
		<div class="thumbnail">

			<img src="${images}/${product.code}.jpg" class="img img-responsice" />

		</div>
	</div>

	<div class="col-xs-12 col-sm-8">
		<h3>${product.name}</h3>
		<hr />

		<p>${product.description}</p>
		<hr />

		<h4>
			Price: <strong> &#163; ${product.unitPrice}</strong>
		</h4>
		<hr />

		<h6>Product Views: ${product.views}</h6>

		<c:choose>
			<c:when test="${product.quantity <1}">
				<h6>
					Qty Available: <span style="color: red">Out of Stock</span>
				</h6>
			</c:when>
			<c:otherwise>
				<h6>Qty Available: ${product.quantity}</h6>
			</c:otherwise>

		</c:choose>

		<c:choose>
			<c:when test="${product.quantity <1}">
				<h6>
					<a href="javascript:void(0)" class="btn btn-success disabled"><strike>Add
							to Cart</strike></a>
				</h6>
			</c:when>
			<c:otherwise>
				<a href="${contextPath}/cart/add/${product.id}/product"
					class="btn btn-success">Add to Cart</a>
			</c:otherwise>

		</c:choose>

		<a href="${contextPath}/show/all/products" class="btn btn-primary">Back</a>



	</div>

</div>