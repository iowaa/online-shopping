
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
		
	case 'Manage Products':
		$('#manageProducts').addClass('active');
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
					data : 'id'
				},
				
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
					return '&#36;'+ data;
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
	
	// dismissing the alert after 3 seconds
	
	var $alert = $('.alert');
	if($alert.length){
		setTimeout(function(){
			$alert.fadeOut('slow');
		},3000)
	}
	
	// data table for admin
	
	var $adminProductsTable = $('#adminProductsTable');
	if ($adminProductsTable.length) {

		var jsonUrl = window.contextPath + '/json/data/admin/all/products';

		// console.log("Inside the Console");
		$adminProductsTable.dataTable({
			lengthMenu : [ [10,30,50,-1],
					[ '10 Records', '30 Records', '50 Records', 'ALL' ] ],
			pageLength : 30,
			
			ajax : {
				url : jsonUrl,
				dataSrc : '',
			},
			
			columns : [ 
				
				{
					data:'id'
				},
				
				{
				data:'code',
				bSortable:false,
				mRender: function(data,type,row){
					return '<img src = "'+window.contextPath+'/resources/images/'+data+'.jpg" class = "adminDataTableImg"/>';
				}
				},
				
				
				{
				data : 'name'

			}, 
			
			{
				data : 'brand'

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
				data : 'unitPrice',
				mRender:function(data,type,row){
					return '&#36;'+ data;
				}

			}, 
			
			{
				data:'active',
				bSortable:false,
				mRender:function(data,type,row){
					
					var str = '';
					str += '<label class="switch">';
					
					if(data){
						str +='<input type="checkbox" checked="checked" value="'+row.id+'" />';

					}
					
					else {
						str +='<input type="checkbox" value="'+row.id+'" />';

					}
					
					str += '<div class="slider"></div></label>';
					
					return str;

				}

				},
				
				{
					data: 'id',
					bSortable:false,
					mRender:function(data,type,row){
						
						var str = '';
						str += '<a href="'+window.contextPath+'/manage/'+data+'/product">';
						str += '<span class="btn btn-secondary">Edit</span></a>';
						 return str;
					}
					
				}
			],
			
			initComplete : function(){
				var api = this.api();
				api.$('.switch input[type="checkbox"]')
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
												
												var activationUrl = window.contextPath + '/manage/product/'+value+'/activation';
												$.post(activationUrl, function(data){

													
													bootbox
															.alert({
																size : 'medium',
																title : 'Information',
																message : data
															});
												});
												
											} else {
												checkbox.prop('checked', !checked);
											}
										}
									});

						});
			}
			
		});
	}
	
	
	
});

















