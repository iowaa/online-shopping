<h1 class="my-4">Items</h1>
<div class="list-group">

	<c:forEach var="category" items="${categories}">
		<a href="${contextPath}/show/category/${category.id}/products" class="list-group-item" id="a_${category.name}">${category.name}</a>
	</c:forEach>
</div>