<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />


<script>
	window.contextPath = '${contextPath}'
</script>

<%@include file="../views/shared/navbar.jsp"%>

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">


<div class="container" style="padding-top: 100px">


	<div class="row">
		<aside class="col-sm-3">

			<img src="https://image.ibb.co/n7oTvU/logo_white.png" alt="" />
			<h2 style="color: #0070ff">Welcome</h2>
			<p>Enter Your Billing Details :</p>

		</aside>
		<aside class="col-sm-9">

			<article class="card">
				<div class="card-body p-5">

					<ul class="nav bg-light nav-pills rounded nav-fill mb-3"
						role="tablist">
						<li class="nav-item"><a class="nav-link active"
							data-toggle="pill" href="#nav-tab-card"> <i
								class="fa fa-credit-card"></i> Credit Card
						</a></li>
						<li class="nav-item"><a class="nav-link" data-toggle="pill"
							href="#paypal"> <i class="fab fa-paypal"></i> Paypal
						</a></li>
						<li class="nav-item"><a class="nav-link" data-toggle="pill"
							href="#bank"> <i class="fa fa-university"></i> Bank Transfer
						</a></li>
					</ul>

					<div class="tab-content">
						<div class="tab-pane fade show active" id="nav-tab-card">
							<p class="alert alert-success">Enter Your Details as in Card</p>
							<form role="form">
								<div class="form-group">
									<label for="username">Full name (on the card)</label> <input
										type="text" class="form-control" name="username"
										placeholder="" required="">
								</div>

								<div class="form-group">
									<label for="cardNumber">Card number</label>
									<div class="input-group">
										<input type="text" class="form-control" name="cardNumber"
											placeholder="">
										<div class="input-group-append">
											<span class="input-group-text text-muted"> <i
												class="fab fa-cc-visa"></i>   <i class="fab fa-cc-amex"></i>
												  <i class="fab fa-cc-mastercard"></i>
											</span>
										</div>
									</div>
								</div>

								<div class="row">
									<div class="col-sm-8">
										<div class="form-group">
											<label><span class="hidden-xs">Expiration</span> </label>
											<div class="input-group">
												<input type="number" class="form-control" placeholder="MM"
													name=""> <input type="number" class="form-control"
													placeholder="YY" name="">
											</div>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="form-group">
											<label data-toggle="tooltip" title=""
												data-original-title="3 digits code on back side of the card">CVV
												<i class="fa fa-question-circle"></i>
											</label> <input type="number" class="form-control" required="">
										</div>
									</div>
								</div>
								<button class="subscribe btn btn-primary btn-block"
									type="button">Confirm</button>
							</form>
						</div>
						<div class="tab-pane fade" id="#paypal">
							<p>Paypal is easiest way to pay online</p>
							<p>
								<button type="button" class="btn btn-primary">
									<i class="fab fa-paypal"></i> Log in my Paypal
								</button>
							</p>
							<p>
								<strong>Note:</strong> Lorem ipsum dolor sit amet, consectetur
								adipisicing elit, sed do eiusmod tempor incididunt ut labore et
								dolore magna aliqua.
							</p>
						</div>
						<div class="tab-pane fade" id="#bank">
							<p>Bank accaunt details</p>
							<dl class="param">
								<dt>BANK:</dt>
								<dd>THE WORLD BANK</dd>
							</dl>
							<dl class="param">
								<dt>Accaunt number:</dt>
								<dd>12345678912345</dd>
							</dl>
							<dl class="param">
								<dt>IBAN:</dt>
								<dd>123456789</dd>
							</dl>
							<p>
								<strong>Note:</strong> Lorem ipsum dolor sit amet, consectetur
								adipisicing elit, sed do eiusmod tempor incididunt ut labore et
								dolore magna aliqua.
							</p>
						</div>
					</div>

				</div>
			</article>


		</aside>
	</div>

</div>

<br>
<br>
