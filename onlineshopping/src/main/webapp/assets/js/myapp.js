$(function() {

	// Solving the active menu problem
	switch (menu) {

	case 'All Products':
		$('#listProducts').addClass('active');
		break;

	case 'Career':
		$('#career').addClass('active');
		break;

	case 'Contact':
		$('#contact').addClass('active');
		break;

	case 'About Us':
		$('#about').addClass('active');
		break;

	default:
		$('#listProducts').addClass('active');
		$('#a_' + menu).addClass('active');
		break;

	}

});