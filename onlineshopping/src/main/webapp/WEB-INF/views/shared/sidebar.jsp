<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<h1 class="my-4">Categories</h1>
<div class="list-group">

	<c:forEach var="category" items="${categories}">
		<a href="${contextPath}/show/category/${category.id}/products"
			class="list-group-item" id="a_${category.name}">${category.name}</a>
	</c:forEach>
</div>