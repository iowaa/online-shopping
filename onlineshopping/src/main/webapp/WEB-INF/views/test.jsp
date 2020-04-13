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
		if (menu == "Home")
			break;
		$('#listProducts').addClass('active');
		$('#a_' + menu).addClass('active');
		break;

	}

	// code for jquery dataTable

	var $table = $('#productListTable');
	if ($table.length) {

		var jsonUrl = '';
		if (window.categoryId == '') {
			jsonUrl = window.contextPath + '/json/data/all/products';
		} else {
			jsonUrl = window.contextPath + '/json/data/category/'
					+ window.categoryId + '/products';

		}

		// console.log("Inside the Console");
		$table.dataTable({
			lengthMenu : [ [ 3, 5, 10, -1 ],
					[ '3 Records', '5 Records', '10 Records', 'ALL' ] ],
			pageLength : 5,
			ajax : {
				url : jsonUrl,
				dataSrc : '',
			},
			
			columns : [ 
				{
				data:'code',
				mRender: function(data,type,row){
					return '<img src = "'+window.contextPath+'/resources/images/'+data+'.jpg" class = "dataTableImg"/>';
				}
				},
				
				
				{
				data : 'name'

			}, 
			
			{
				data : 'brand'

			}, 
			
			{
				data : 'unitPrice',
				mRender:function(data,type,row){
					return '&#163;'+ data;
				}

			}, 
			
			{
				data : 'quantity',
					mRender:function(data,type,row){
						if(data < 1){
							return '<span style = "color:red">Out Of Stock</span>';
						}
						
						return data;
					}
			}, 
			
			{
				data:'id',
				mRender(data, type, row){
					var str = '';
					str+= '<a href = "'+window.contextPath+'/show/'+data+'/product" class="btn btn-primary">View</a>';
					
					if(row.quantity < 1){
						str+='<a href = "javascript:void(0)" class="btn btn-success disabled">Add to Cart</a>';
					}
					else{
						str+= '<a href = "'+window.contextPath+'/cart/add/'+data+'/product" class="btn btn-success">Add to Cart</a>';

					}
					
					return str;

				}
			}
			]
		});
	}

});
