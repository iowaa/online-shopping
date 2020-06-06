<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<div class="container register">
	<div class="row">
		<div class="col-md-3 register-left">
			<img src="https://image.ibb.co/n7oTvU/logo_white.png" alt="" />
			<h3>Welcome</h3>
			<p>You are 30 seconds away from creating your account!</p>

			<button type="submit" name="" value="Login">
				<a href="${contextPath}/login">Login</a>
			</button>
		</div>
		<div class="col-md-9 register-right">

			<div class="tab-content" id="myTabContent">
				<div class="tab-pane fade show active" id="home" role="tabpanel"
					aria-labelledby="home-tab">

					<h3 class="register-heading">Sign Up</h3>

					<sf:form method="POST" class="row register-form" id="registration"
						modelAttribute="user">

						<div class="col-md-6">
							<div class="form-group">
								<sf:input type="text" path="firstName" class="form-control"
									placeholder="First Name *"/>
							</div>
							<div class="form-group">
								<sf:input type="text" path="lastName" class="form-control"
									placeholder="Last Name *"/>
							</div>
							<div class="form-group">
								<sf:input type="password" path="password" class="form-control"
									placeholder="Password *  "/>
							</div>
							<div class="form-group">
								<sf:input type="password" path="" class="form-control"
									placeholder="Confirm Password *" />
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
							</div>
							<div class="form-group">
								<sf:input type="text" path="contactNumber" minlength="10"
									maxlength="10" class="form-control" placeholder="Your Phone *" />
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
							<sf:button type="submit" class="btnRegister"
								name="_eventId_billing">SignUp</sf:button>
						</div>
					</sf:form>
				</div>
			</div>

		</div>
	</div>
</div>

