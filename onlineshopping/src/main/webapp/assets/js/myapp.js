$(function() {

	// Solving the active menu problem
	switch (menu) {

	default:
		$('#home').addClass('active');
		break;

	case 'listProducts':
		$('#listProducts').addClass('active');
		break;

	case 'Career':
		$('#career').addClass('active');
		break;

	case 'Contact Us':
		$('#contact').addClass('active');
		break;

	case 'About Us':
		$('#about').addClass('active');
		break;

	}

});