$(function() {
	// handling the click event of refresh button in cart.jsp

	$('button[name="refreshCart]').click(function() {

		// fetch the cart line id
		var cartLineId = $(this).attr('value');
		var countElement = $('#count_' + cartLineId);

		var originalCount = countElement.attr('value');
		var currentCount = countElement.val();

		// work only when the count has changed

		if (currentCount !== originalCount) {
			console.log("currentCount" + currentCount);
			console.log("originalCount" + originalCount);

			if (currentCount < 1 || current > 3) {

				// reverting back to the original count
				// user has provided value below 1 or above 3
				countElement.val(originalCount);
				bootbox.alert({
					size : 'medium',
					title : 'Error',
					message : 'Product count should be minimum 1 or maximum 3!'
				})
			}

			else {

			}

		}
	});

});