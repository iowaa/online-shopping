<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<%@include file="../shared/flow-header.jsp"%>

<%@include file="../../shared/navbar.jsp"%>

<div class="container register">
	<div class="row">
		<div class="col-md-3 register-left">
			<img src="https://image.ibb.co/n7oTvU/logo_white.png" alt="" />
			<h3>Welcome</h3>
			<p>You are 30 seconds away from creating your account!</p>

			<button type="submit" name="" class="" value="Login">
				<a href="${contextPath}/login">Login as Guest</a>
			</button>
		</div>
		<div class="col-md-9 register-right">

			<div class="tab-content" id="myTabContent">
				<div class="tab-pane fade show active" id="home" role="tabpanel"
					aria-labelledby="home-tab">

					<h3 class="register-heading">Personal Details</h3>

					<sf:form method="POST" class="row register-form" id="registerForm"
						modelAttribute="user">

						<div class="col-md-6">
							<div class="form-group">
								<sf:input type="text" path="firstName" class="form-control"
									placeholder="First Name *" />
								<sf:errors path="firstName" class="help-block" element="em" />
							</div>
							<div class="form-group">
								<sf:input type="text" path="lastName" class="form-control"
									placeholder="Last Name *" />
								<sf:errors path="lastName" cssClass="help-block" element="em" />

							</div>
							<div class="form-group">
								<sf:input type="password" path="password" class="form-control"
									placeholder="Password *  " />
								<sf:errors path="password" cssClass="help-block" element="em" />

							</div>
							<div class="form-group">
								<sf:input type="password" path="confirmPassword"
									class="form-control" placeholder="Confirm Password *" />
								<sf:errors path="confirmPassword" cssClass="help-block" element="em" />

							</div>
							<div class="form-group">
								<label class="maxl">Select Role</label>
								<div class="maxl">
									<label class="radio-inline"> <sf:radiobutton
											path="role" value="USER" checked="checked" /> Customer
									</label> <label class="radio-inline"> <sf:radiobutton
											path="role" value="SUPPLIER" /> Supplier
									</label>
								</div>
							</div>
						</div>


						<div class="col-md-6">
							<div class="form-group">
								<sf:input type="email" path="email" class="form-control"
									placeholder="abc@xyz.com" />
								<sf:errors path="email" cssClass="help-block" element="em" />

							</div>
							<div class="form-group">
								<sf:input type="text" path="contactNumber" minlength="10"
									maxlength="10" class="form-control" placeholder="Your Phone *" />
								<sf:errors path="contactNumber" cssClass="help-block"
									element="em" />

							</div>
							<div class="form-group">
								<select class="form-control">
									<option class="hidden" selected disabled>Please select
										your Security Question</option>
									<option>What is your Birthdate?</option>
									<option>What is Your old Phone Number</option>
									<option>What is your Pet Name?</option>
								</select>
							</div>
							<div class="form-group">
								<sf:input type="text" path="" class="form-control"
									placeholder="Enter Your Answer *" value="" />
							</div>
							<button type="submit" class="btnRegister" name="_eventId_billing">
								Next-billing<span class="glyphicon glyphicon-ok"></span>
							</button>
						</div>
					</sf:form>
				</div>
			</div>

		</div>
	</div>
</div>



