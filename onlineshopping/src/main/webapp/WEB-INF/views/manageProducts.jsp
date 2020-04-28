<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<div class="container">
	<div class="row">

		<c:if test="${not empty message}">
			<div class="col-xs-12">
				<div class="alert alert-success alert dismissible"
					style="color: red">
					<button type="button" class="close" data-dismiss="alert">&times;</button>
					${message}
				</div>

			</div>
		</c:if>
		<div class="col-md-offset-2 col-md-8">
			<div class="panel panel-primary" align="center">
				<div class="panel-heading">
					<h4>Product Management</h4>
				</div>
				<div class="panel-body">
					<!-- Form Elements -->
					<sf:form class="form-horizontal" modelAttribute="product"
						action="${contextPath}/manage/products" method="POST"
						enctype="multipart/form-data">

						<div class="form-group">
							<label class="control-label col-md-4" for="name">Enter
								Product Name</label>
							<div class="col-md-8">
								<sf:input type="text" path="name" id="name"
									placeholder="Product Name" class="form-control" />
								<sf:errors path="name" cssClass="help-block" element="em" />

							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-md-4" for="brand">Enter
								Brand Name</label>
							<div class="col-md-8">
								<sf:input type="text" path="brand" id="brand"
									placeholder="Brand Name" class="form-control" />
								<sf:errors path="brand" cssClass="help-block" element="em" />

							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-md-4" for="brand">Product
								Description</label>
							<div class="col-md-8">
								<sf:textarea type="textarea" path="description" id="description"
									placeholder="Enter Description Here" class="form-control"
									style="height: 100px; width: s50px;"></sf:textarea>
								<sf:errors path="description" cssClass="help-block" element="em" />

							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-md-4" for="brand">Enter
								Unit Price</label>
							<div class="col-md-8">
								<sf:input type="number" step="0.01" path="unitPrice" id="price"
									placeholder="Unit Price" class="form-control" />
								<sf:errors path="unitPrice" cssClass="help-block" element="em" />

							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-md-4" for="brand">Enter
								Quantity Available</label>
							<div class="col-md-8">
								<sf:input type="number" path="quantity" id="quantity"
									placeholder="Quantity Available" class="form-control" />
							</div>
						</div>

						<!--  File Element to Upload Image -->
						<div class="form-group">
							<label class="control-label col-md-4" for="file">Upload
								Image</label>
							<div class="col-md-8">
								<sf:input type="file" path="file" id="file" class="form-control" />
								<sf:errors path="file" cssClass=" help-block" element="em"></sf:errors>
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-md-4" for="category">Select
								Category</label>
							<div class="col-md-8">
								<sf:select id="categoryId" path="categoryId"
									items="${categories}" itemLabel="name" itemValue="id"
									class="form-control" />
							</div>
						</div>

						<div class="form-group">

							<div class="col-md-offset-4 col-md-8">
								<input type="submit" name="submit" id="submit" value="Submit"
									class="btn btn-primary" />

								<!--  Hidden Fields -->
								<sf:hidden path="id" />
								<sf:hidden path="code" />
								<sf:hidden path="supplierId" />
								<sf:hidden path="active" />
								<sf:hidden path="purchases" />
								<sf:hidden path="views" />
							</div>
						</div>
					</sf:form>
				</div>

			</div>

		</div>
	</div>

	<div class="row">
		<div class="col-xs-12">
			<h3>Available Products</h3>
			<hr />
		</div>

		<div class="col-12">

			<div style="overflow: auto">

				<!--  Products table for Admin -->
				<table id="adminProductsTable"
					class="table table-scripted table-bordered">

					<thead>
						<tr>
							<th>Id</th>
							<th>&#160;</th>
							<th>Name</th>
							<th>Quantity</th>
							<th>Unit Price</th>
							<th>Active</th>
							<th>Edit</th>
						</tr>
					</thead>

					<tbody>
						<tr>
							<td>4</td>
							<td><img class="adminDataTableImg"
								src="${contextPath}/resources/images/PRD3BC2A81D00.jpg"
								style="height: 100px; width: 100px"
								alt="Bastion 20kg Rapid Set Concrete" /></td>
							<td>Bastion 20kg Rapid Set Concrete</td>
							<td>5</td>
							<td>&#36; 8</td>

							<td><label class="switch"> <input type="checkbox"
									checked="checked" value="4" />
									<div class="slider"></div>
							</label> </label></td>

							<td><a href="${contextPath}/manage/4/product"> <span
									class="btn btn-secondary">Edit</span>

							</a></td>
						</tr>

						<tr>
							<td>4</td>
							<td><img class="adminDataTableImg"
								src="${contextPath}/resources/images/PRD3BC2A81D00.jpg"
								style="height: 100px; width: 100px"
								alt="Bastion 20kg Rapid Set Concrete" /></td>
							<td>Bastion 20kg Rapid Set Concrete</td>
							<td>5</td>
							<td>&#36; 8</td>
							<td>
								<!--  Toogle Switch --> <label class="switch"> <input
									type="checkbox" value="4" />
									<div class="slider"></div>

							</label>
							</td>
							<td><a href="${contextPath}/manage/4/product"> <span
									class="btn btn-secondary">Edit</span>

							</a></td>
						</tr>
					</tbody>


				</table>


			</div>



		</div>

	</div>
</div>