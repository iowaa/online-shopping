$(function() {
	// solving the active menu problem
	switch (menu) {

	case 'About Us':
		$('#about').addClass('active');
		break;

	case 'Contact':
		$('#contact').addClass('active');
		break;

	case 'listProducts':
		$('#listProducts').addClass('active');
	default:
		$('#home').addClass('active');
		break;
	}

});