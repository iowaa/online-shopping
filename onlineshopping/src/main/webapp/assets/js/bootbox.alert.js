$(function() {
	// Bootbox
	$('.switch input[type="checkbox"]')
			.on(
					'change',
					function() {

						var checkbox = $(this);
						var checked = checkbox.prop('checked');
						var dMsg = (checked) ? 'You want to activate the product?'
								: 'You want to deactivate the product?';
						var value = checkbox.prop('value');

						bootbox
								.confirm({
									size : 'medium',
									title : 'Product Activation and Deactivation',
									message : dMsg,
									callback : function(confirmed) {

										if (confirmed) {
											console.log(value);
											bootbox
													.alert({
														size : 'medium',
														title : 'Information',
														message : 'You are going to perform operation on product '
																+ value
													});
										} else {
											checkbox.prop('checked', !checked);
										}
									}
								});

					});
});