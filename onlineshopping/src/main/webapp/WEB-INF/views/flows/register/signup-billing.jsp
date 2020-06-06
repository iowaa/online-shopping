<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<%@include file="../shared/flow-header.jsp"%>

<%@include file="../../shared/navbar.jsp"%>

<div class="container register">
	<div class="row">
		<div class="col-md-3 register-left">
			<img src="https://image.ibb.co/n7oTvU/logo_white.png" alt="" />
			<h3>Welcome</h3>
			<p>Enter Your Billing Details</p>

		</div>
		<div class="col-md-9 register-right">

			<div class="tab-content" id="myTabContent">
				<div class="tab-pane fade show active" id="home" role="tabpanel"
					aria-labelledby="home-tab">

					<h3 class="register-heading">Billing Details</h3>

					<sf:form method="POST" class="row register-form" id="registerForm"
						modelAttribute="billing">

						<div class="col-md-6">
							<div class="form-group">
								<sf:input type="text" path="addressLineOne" class="form-control"
									placeholder="Address Line One *" />
								<sf:errors path="addressLineOne" class="help-block" element="em" />

							</div>
							<div class="form-group">
								<sf:input type="text" path="addressLineTwo" class="form-control"
									placeholder="Address Line Two (Optional)" />
							</div>
							<div class="form-group">
								<sf:input type="text" path="city" class="form-control"
									placeholder="City *  " />
								<sf:errors path="city" class="help-block" element="em" />


							</div>
							<div class="form-group">
								<sf:input type="text" path="state" class="form-control"
									placeholder="State *" />
								<sf:errors path="state" class="help-block" element="em" />

							</div>

						</div>
						<div class="col-md-6">
							<div class="form-group">
								<%@include file="../../countrydropdown.html"%>
							</div>

							<div class="form-group">
								<sf:input type="text" path="postalCode" minlength="4"
									maxlength="4" class="form-control" placeholder="Postal Code *" />
								<sf:errors path="postalCode" class="help-block" element="em" />

							</div>

							<sf:button type="submit" class="btnRegister"
								name="_eventId_submit">Confirm</sf:button>

							<sf:button type="submit" class="btnRegister"
								name="_eventId_personal">Back to Personal</sf:button>

						</div>
					</sf:form>
				</div>
			</div>

		</div>
	</div>
</div>



