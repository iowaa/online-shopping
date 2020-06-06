
<%@include file="../shared/flow-header.jsp"%>

<%@include file="../../shared/navbar.jsp"%>

<div class="container register">
	<div class="row">
		<div class="col-lg register-left">
			<h2>Welcome to Online Shopping</h2>
			<h4>${registerModel.user.firstName}</h4>
			<img src="https://image.ibb.co/n7oTvU/logo_white.png" alt="" />
		</div>

		<div class="col-md register-right">

			<h2 style="text-align: center; padding-top: 15px">Login Here</h2>


			<div class="container" style="text-align: center; padding-top: 50px;">
				<label for="uname"><b>Enter Email</b></label><br /> <input
					type="email" placeholder="Enter Username" name="uname" required>
				<br /> <label for="psw"><b>Enter Password</b></label><br /> <input
					type="password" placeholder="Enter Password" name="psw" required>
				<br /> <br />

				<button type="submit" style="align: center;">Login</button>
				<label> <input style="padding-right: 25px" type="checkbox"
					checked="checked" name="remember"> Remember me
				</label>
			</div>
		</div>

	</div>
</div>




