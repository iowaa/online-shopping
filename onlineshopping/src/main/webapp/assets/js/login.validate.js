$(function() {
	// Validation code for the login form
	var $loginForm = $('#loginForm');
	if ($loginForm.length) {
		$loginForm.validate({

			rules : {
				username : {
					required : true,
					email : true
				},

				password : {
					required : true
				}

			},

			messages : {
				username : {
					required : 'Please enter the email address!',
					email : 'Please enter valid email address'
				},

				password : {
					required : 'Please enter the password!'
				}
			},

			errorElement : 'em',
			errorPlacement : function(error, element) {
				// add the class of help-block
				error.addClass('help-block');
				// add the error element after the input element
				error.insertAfter(element);
			}

		});
	}

});