<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<%@include file="../shared/flow-header.jsp"%>



<%@include file="../../shared/navbar.jsp"%>

<div class="container register">
	<div class="row">
		<div class="col-md-3 register-left">
			<img src="https://image.ibb.co/n7oTvU/logo_white.png" alt="" />
			<h3>Welcome</h3>
			<p>Please Check Your Details Carefully</p>

		</div>
		<div class="col-md-9 register-right">

			<div class="tab-content" id="myTabContent">
				<div class="row register-form" " id="home" role="tabpanel"
					aria-labelledby="home-tab">


					<div class="col-md-6">
						<div class="form-group">
							<h4>${registerModel.user.firstName}
								${registerModel.user.lastName}</h4>
						</div>
						<div class="form-group">
							<h5>Email : ${registerModel.user.email}</h5>

						</div>
						<div class="form-group">
							<h5>Contact Number : ${registerModel.user.contactNumber}</h5>
						</div>
						<div class="form-group">
							<h5>Role : ${registerModel.user.role}</h5>
						</div>
						<div>
							<button
								onclick="window.location.href = ${flowExecutionUrl}&_eventId_personal">Edit</button>
						</div>
					</div>


					<div class="col-md-6">
						<div class="form-group">
							<h4>${registerModel.user.firstName}
								${registerModel.user.lastName}</h4>
						</div>
						<div class="form-group">
							<h5>Email : ${registerModel.user.email}</h5>

						</div>
						<div class="form-group">
							<h5>Contact Number : ${registerModel.user.contactNumber}</h5>
						</div>
						<div class="form-group">
							<h5>Role : ${registerModel.user.role}</h5>
						</div>
						<div>
							<button
								onclick="window.location.href = ${flowExecutionUrl}&_eventId_billing">Edit</button>
						</div>
					</div>

				</div>
			</div>

		</div>
	</div>
</div>