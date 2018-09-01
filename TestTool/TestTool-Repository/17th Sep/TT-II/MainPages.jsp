<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>New Document</TITLE>
<META NAME="Generator" CONTENT="EditPlus">
<META NAME="Author" CONTENT="">
<META NAME="Keywords" CONTENT="">
<META NAME="Description" CONTENT="">

<!--<link rel="stylesheet" href="css/bootstrap-theme.min.css">-->
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/dataTables.bootstrap.css">
<link rel="stylesheet" href="css/dataTables.tableTools.css">
<link rel="stylesheet" href="css/editor.bootstrap.css">
<link rel="stylesheet" href="css/Menu2.css">

<script type="text/javascript" charset="utf-8" src="js/bootstrap.min.js"></script>
<script type="text/javascript" charset="utf-8"
	src="js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" charset="utf-8"
	src="js/jquery.dataTables.min.js"></script>
<script type="text/javascript" charset="utf-8"
	src="js/dataTables.tableTools.min.js"></script>
<script type="text/javascript" charset="utf-8"
	src="js/dataTables.editor.min.js"></script>
<script type="text/javascript" charset="utf-8"
	src="js/dataTables.bootstrap.js"></script>
<script type="text/javascript" charset="utf-8"
	src="js/editor.bootstrap.js"></script>
<script type="text/javascript" charset="utf-8" src="js/customtabs.js"></script>

<!--
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="http://cdn.datatables.net/tabletools/2.2.3/css/dataTables.tableTools.css">
<link rel="stylesheet" href="http://cdn.datatables.net/plug-ins/9dcbecd42ad/integration/bootstrap/3/dataTables.bootstrap.css">
<link rel="stylesheet" href="http://editor.datatables.net/examples/resources/bootstrap/editor.bootstrap.css">

<script type="text/javascript" charset="utf-8" src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script type="text/javascript" charset="utf-8" src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script type="text/javascript" charset="utf-8" src="http://cdn.datatables.net/1.10.4/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" charset="utf-8" src="http://cdn.datatables.net/tabletools/2.2.3/js/dataTables.tableTools.min.js"></script>
<script type="text/javascript" charset="utf-8" src="http://cdn.datatables.net/plug-ins/9dcbecd42ad/integration/bootstrap/3/dataTables.bootstrap.js"></script>
<script type="text/javascript" charset="utf-8" src="http://editor.datatables.net/examples/resources/bootstrap/editor.bootstrap.js"></script>
 <script type="text/javascript" charset="utf-8" src="http://editor.datatables.net/media/js/dataTables.editor.min.js"></script>

  
<!-- <link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootstrap-theme.min.css">
<link rel="stylesheet" href="css/Menu2.CSS">
<link rel="stylesheet" href="css/Menu2.CSS">
-->


<script type="text/javascript">
    $(document).ready(function(){

	   defaultDivStatusonLoad();
       $("#home_id").click(function(){
			 $("#test_div").hide();
			 $('#services').hide();
			 $('#introdiv').show();
       }); 
       $("#help_id").click(function(){
			 $("#test_div").hide();			 
			 $('#services').show();			 
			 $('#services').load('peace.html');
			 $('#introdiv').hide();
       });
	    $("#ser_id").click(function(){
			 $("#test_div").show();
			 $('#services').load('peace.html');
			 $('#services').hide();			 
			 $('#introdiv').hide();
       });
	   
	   $("#create_grp").click(function(){
			
			$("#grpinfo_table").hide();
			$("#grpinfo_table1").show();
	   });
		
		//
	   $("#modify_grp").click(function()
	   {
			alert($('#grp_tabledata tr.selected td.t_id').text());  // If i use text() and keep on cilcikn will add data of all rows
			e.preventDefault();
			var row=$('#grp_tabledata tr.selected').html();
			//alert("Sel click  btn"+row); // This works  proper ,retuns the selected row and its data (if full row then remove td.t_id
			
		//showselRow();
	   });
				
	   $('#grp_tabledata tr').click(function (event) {
		  var rowCount = $('#grp_tabledata tr').row;
		  //alert(rowCount);
		});

	 // Below call to get checkbox selected elements @works fine 
	   $('#modify_grp').click(function(){        
			$('input[type="checkbox"]:checked').each(function(){           
				alert($(this).parent('td').parent('tr').children('td.t_id').text());
			});
	   }); 

	   // Below call for on click event on a row of table  , wil change bck color  not workin 
	   $("#grp_tabledata tr").click(function(){	
	    // $(this).addClass('selected').siblings().removeClass('selected');   // @ important to remove old selection from table 
		 //	$(this).addClass("selected");   
		//  $(this).hasClass("highlightRow");
		 // $(this).addClass('highlightRow').siblings().removeClass('highlightRow');;
		  // var row= $('#grp_tabledata tr.selected')
		  // row.addClass('highlightRow');
		//   var value=$(this).find('td.t_id').text();
		  // alert("row selected data "+value);    
		});

		// Dont work proper 
	   function showselRow()
		{
			var rowCount = $('#grp_tabledata tr').length;
		    var rows = document.getElementById('grp_tabledata').getElementsByTagName('tbody')[0].getElementsByTagName('tr');
			alert("indx :: " +rows.length);
			alert($("#grp_tabledata tr.selected td:first").html());
			var $td= $('#grp_tabledata tr.selected').children('td');  
			var sr= $td.eq(0).text();  			  
			var name= $td.eq(1).text(); 
			var city= $td.eq(2).text();  
			alert("value "+sr);  
		}

		      var tableTools = new $.fn.dataTable.TableTools( table, {
        sRowSelect: "os",
        aButtons: [
            { sExtends: "editor_create", editor: editor },
            { sExtends: "editor_edit",   editor: editor },
            { sExtends: "editor_remove", editor: editor }
        ]
    } );
    $( tableTools.fnContainer() ).appendTo( '#example_wrapper .col-sm-6:eq(0)' );
     });
	 function defaultDivStatusonLoad(){
			 $("#test_div").hide();
			 $('#services').hide();
			 $('#grpinfo_table1').hide();
			 $('#introdiv').show();
	 }
		
	
	
		
	
</script>

</HEAD>

<BODY>
	<div id="main" class="container">
		<div id="mainrow" class="row">
			<nav class="navbar navbar-inverse bs-docs-nav" role="banner">
			<div class="container">
				<div class="navbar-header">
					<button class="navbar-toggle" type="button" data-toggle="collapse"
						data-target=".bs-navbar-collapse">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="#">TestMaker.com</a>
				</div>
				<div>
					<ul id="myMenu" class="nav navbar-nav">
						<li class="active"><a id="home_id" href="#">Home</a></li>
						<li><a id="ser_id" href="#">Services</a></li>
						<li><a href="#">Creating Tests</a></li>
						<li><a id="help_id" href="#">Help</a></li>
					</ul>
				</div>
			</div>
			</nav>
			<!-- Stats Tabs -->
			<div id="maindiv">
				<div id="introdiv">
					<div class="row">
						<div class="row">
							<div class="col-lg-6 ">
								<h2>Easibility</h2>
								<p>Its easy product to use only a click away to create tests
									and assign test to group of students and testee.</p>
								<p>
									<a class="btn btn-default" href="#" role="button">View
										details &raquo;</a>
								</p>
							</div>
							<!--/.col-xs-6.col-lg-4-->
							<div class="col-lg-6  ">
								<h2>Fast and Secure</h2>
								<p>Easily can upload your test by downloading the sample
									files, which reduces the time to be on internet.We dont take
									any email or phone numbers of students.</p>
								<p>
									<a class="btn btn-default" href="#" role="button">View
										details &raquo;</a>
								</p>
							</div>
							<!--/.col-xs-6.col-lg-4-->
							<div class="col-lg-6 ">
								<h2>Statics</h2>
								<p>We provide clear statics of test created and the results
									of test taken by students.</p>
								<p>
									<a class="btn btn-default" href="#" role="button">View
										details &raquo;</a>
								</p>
							</div>
							<!--/.col-xs-6.col-lg-4-->
							<div class="col-lg-6 ">
								<h2>Knowledge Sharing</h2>
								<p>it can be a good knowledge sharing portal for your
									students where you can keep you assignments and also notes and
									can share among the students.</p>
								<p>
									<a class="btn btn-default" href="#" role="button">View
										details &raquo;</a>
								</p>
							</div>
						</div>
						<!--/row-->
					</div>
					<!--End of intr-div -->

				</div>
				<!-- End of intry div -->
				<!-- Make tabs-->
				<div id="test_div">
					<ul class="nav nav-tabs">
						<li class="active"><a href="#hello" data-toggle="tab">Customize
								portal</a></li>
						<li><a href="#empty" data-toggle="tab">Manage Groups</a></li>
						<li><a href="#templates" data-toggle="tab">Balance</a></li>
					</ul>
					<!-- Now start making Tab contents  -->
					<div class="tab-content">
						<!--Will write the horizaontal form -->
						<div class="tab-pane active" id="hello">
							<!-- Started tab-pane div #hello-->
							<h3></h3>
							<div id="configinbtn" class="container row">
								<div class="col-md-9">
									<!-- first column -->
									<div class="panel panel-primary">
										<div class="panel-heading">
											<h3 class="panel-title">Create a group</h3>
										</div>
										<div class="panel-body">
											<form class="form-horizontal" role="form">
												<div class="form-group">
													<label class="col-sm-3 control-label">Portal
														Display Name:</label>
													<div class="col-sm-5">
														<input type="text" class="form-control" name="fullName" />
													</div>
												</div>

												<div class="form-group">
													<label class="col-sm-3 control-label">E-Mail:</label>
													<div class="col-sm-5">
														<input type="text" class="form-control" name="company" />
													</div>
												</div>

												<div class="form-group">
													<label class="col-sm-3 control-label">Logo Image: </label>
													<div class="col-sm-5">
														<input type="file" class="filestyle">
													</div>
												</div>

												<div class="form-group">
													<div class="col-sm-5 col-sm-offset-3">
														<button type="submit" class="btn btn-default">Configure</button>
													</div>
												</div>
											</form>
										</div>
									</div>
								</div>
								<div class="col-md-3">
									<!-- second column -->
									<div class=" nav navbar-nav">
										<ul class="nav nav-pills nav-stacked">
											<li class="active"><a href="#">Upload your image</a></li>
											<li class="active"><a href="#">Change font</a></li>
											<li class="active"><a href="#">Change display name</a></li>
										</ul>
									</div>
								</div>
								<!-- second column end -->
							</div>
							<!-- End for first row configinbtn  # configinbtn-->
						</div>
						<!-- @end #hello -->

						<!-- Started tab-pane div #empty-->
						<div class="tab-pane" id="empty">
							<!-- Start of tab pane item-->
							<h3></h3>
							<div class="container row">
								<!-- Start of a row  if row-fluid gets strecth to write so same container row-->
								<div class="col-md-9 " id="grpinfo_table">
									<!-- Start of grpinfo_table-->
									<h3>
										<ul class="breadcrumb">
											<li><a href="#">Groups</a> <span class="divider"></span></li>
										</ul>
									</h3>
									<table id="grp_tabledata"
										class="table table-striped table-bordered">
										<thead>
											<tr>
												<th></th>
												<th>S.No.</th>
												<th>Group Name</th>
												<th>Description</th>
												<th>Creation Date</th>
												<th>Test Assigned</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td><input type="checkbox" /></td>
												<td class="id">1</td>
												<td class="t_id">Trial-1</td>
												<td>English</td>
												<td>25/11/2014</td>
												<td>20</td>
											</tr>
											<tr>
												<td><input type="checkbox" /></td>
												<td class="id">2</td>
												<td class="t_id">Trial-2</td>
												<td>Math</td>
												<td>25/11/2014</td>
												<td>40</td>
											</tr>
											<tr>
												<td><input type="checkbox" /></td>
												<td class="id">3</td>
												<td class="t_id">Trial-3</td>
												<td>Computer</td>
												<td>26/11/2014</td>
												<td>80</td>
											</tr>
											<tr>
												<td><input type="checkbox" /></td>
												<td class="id">3</td>
												<td class="t_id">Trial-6</td>
												<td>Computer</td>
												<td>26/11/2014</td>
												<td>100</td>
											</tr>
										</tbody>
									</table>

								</div>
								<!-- @end 1st col -->
								<!-- end of grpinfo_table-->

								<div class="col-md-9" id="grpinfo_table1">
									<!-- start of grpinfo_table1-->
									<div class="panel panel-primary">
										<div class="panel-heading">
											<h3 class="panel-title">Create a group</h3>
										</div>
										<div class="panel-body">
											<div class="cliente">
												<form class="form-horizontal" role="form">
													<div class="form-group">
														<label class="col-sm-3 control-label">Group Name:</label>
														<div class="col-sm-5">
															<input type="text" class="form-control" name="fullName" />
														</div>
													</div>

													<div class="form-group">
														<label class="col-sm-3 control-label">Assign Test:</label>
														<div class="col-sm-5">
															<select id="selectgrp" class="form-control"
																title="Select a group">
																<option>Test1</option>
																<option>Test2</option>
																<option>Test3</option>
															</select>
														</div>
													</div>

													<div class="form-group">
														<label class="col-sm-3 control-label">Add Test
															Users: </label>
														<div class="col-sm-5">
															<input type="file" class="filestyle input-md">
														</div>
													</div>
													<div class="form-group">
														<div class="col-sm-5 col-sm-offset-3">
															<button type="submit" class="ok btn btn-default">Create</button>
														</div>
													</div>
												</form>
											</div>
											<!-- @end  cliente -->
										</div>
										<!-- @end  panel body -->
									</div>
									<!-- @end  panel primary -->
								</div>
								<!-- @end  grpinfo_tablel -->

								<div class="col-md-3">
									<!--Second column -->
									<h3></h3>
									<h3></h3>
									<h3></h3>
									<div class=" nav navbar-nav spacer">
										<ul class="nav nav-pills nav-stacked">
											<li class="active"><a id="create_grp" href="#">Create
													new group</a></li>
											<li class="active"><a href="#">Assign test</a></li>
											<li class="active"><a href="#">Add members to group</a></li>
											<li class="active"><a id="modify_grp" href="#">Modify
													group</a></li>
										</ul>
									</div>
								</div>
								<!-- @end 2nd col -->

							</div>
							<!-- End for first row  -->
						</div>
						<!-- @end #empty -->
					</div>
					<!-- Tab content end -->
				</div>
				<!-- here will write all div which shod be shown on click on main menus -->
				<div class="container" id="services" style="clear: both;"></div>
			</div>
			<!-- Main_Div -->
		</div>
		<!-- @end Main_row-->
	</div>
	<!--  Div -->

	<footer>
	<div class="foot-fixed-bottom">
		<div class="container" align="center">
			<hr />
			© testmaker.com • India 2015
		</div>
	</div>
	</footer>


</BODY>
</HTML>
