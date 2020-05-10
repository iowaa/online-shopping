$(function() {
	//Validation code for category
	var $categoryForm = $('#categoryForm');
	if ($categoryForm.length) {
		$categoryForm
				.validate({

					rules : {
						name : {
							required : true,
							minLength : 2
						},

						description : {
							required : true
						}

					},

					messages : {

						name : {
							required : 'Please add the category name!',
							minLenth : 'The category name should not be less that 2 Characters'
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
});