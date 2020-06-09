$(function() {
	// Validation code for add new category
	var $categoryForm = $('#categoryForm');
	if ($categoryForm.length) {
		$categoryForm
				.validate({

					rules : {
						name : {
							required : true,
							minlength : 2
						},

						description : {
							required : true
						}

					},

					messages : {

						name : {
							required : 'Please add the category name!',
							minlength : 'The category name should not be less that 2 Characters'
						},

						description : {
							required : 'Please add a description!'
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

	// for handling CSRF token
	var token = $('meta[name="_csrf"]').attr('content');
	var header = $('meta[name="_csrf_header"]').attr('content');

	if ((token.length > 0 && header.length > 0)) {

		// set the token header for the ajax request
		$(document).ajaxSend(function(e, xhr, options) {
			xhr.setRequestHeader(header, token);
		});
	}

	$('button[name="refreshCart"]')
			.click(
					function() {

						// fetch the cart line id
						var cartLineId = $(this).attr('value');
						var countElement = $('#count_' + cartLineId);

						var originalCount = countElement.attr('value');
						var currentCount = countElement.val();

						// work only when the count has changed

						if (currentCount !== originalCount) {

							if (currentCount < 1 || currentCount > 3) {

								// reverting back to the original count
								// user has provided value below 1 or above 3
								countElement.val(originalCount);
								bootbox
										.alert({
											size : 'medium',
											title : 'Error',
											message : 'Product count should be minimum 1 or maximum 3!'
										})
							}

							else {
								var updateUrl = window.contextPath + '/cart/'
										+ cartLineId + '/update?count='
										+ currentCount;

								// forward it to the controller
								window.location.href = updateUrl;
							}

						}
					});

});