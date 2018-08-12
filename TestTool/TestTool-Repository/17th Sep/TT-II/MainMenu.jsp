<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="keywords"
	content="struts2, twitter, bootstrap, plugin, showcase" />
<meta name="description"
	content="A Showcase for the Struts2 Bootstrap Plugin" />

<sj:head jqueryui="true" />
<sb:head includeScripts="true" includeScriptsValidation="false" />
<style type="text/css">
body {
	/* padding-top: 60px; /* 60px to make the container go all the way to the bottom of the topbar */
	
}
</style>
<link rel="stylesheet" href="../css/bootstrap.min.css">
<link rel="stylesheet" href="../css/Menu2.css">
<link rel="stylesheet" href="../css/flipclock.css">




<link rel="stylesheet" href="../css/jquery.dataTables.css">
<link rel="stylesheet" href="../css/jquery.dataTables.min.css">
<link rel="stylesheet" href="../css/jquery.dataTables_themeroller.css">
<link rel="stylesheet" type="text/css"
	href="../css/jquery.countdownTimer.css" />
<script type="text/javascript" charset="utf-8"
	src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" charset="utf-8"
	src="${pageContext.request.contextPath}/js/flipclock.js"></script>

<script type="text/javascript" src="../js/jquery.countdownTimer.js"></script>
<script type="text/javascript" charset="utf-8"
	src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	
<script type="text/javascript" charset="utf-8"
	src="../js/jquery.dataTables.js"></script>
<script type="text/javascript" charset="utf-8"
	src="../js/jquery.dataTables.min.js"></script>

<script type="text/javascript">


	var clock;
	$(document).ready(function() {
		
		clock = $('.ms_timer').countdowntimer({
			 minutes : '20'
	    });
	
	});
		$(document).ready(function() {	
			clock = $('.clock').FlipClock(1 * 10  ,{
		        clockFace: 'HourlyCounter',
		        countdown: true,
		        callbacks: {
	                stop: function() {
	                }
	            }
		    });
		});  
    $(document).ready(function(){
    	defaultDivStatusonLoad();
    	
    	var iCnt = 0;
    	$('#addButton').click(function() {
    		              
               iCnt = iCnt + 1;
               alert("add me");
               $('#add_mem_form').append('<div class="row" ><div class="form-group form-horizontal"><label class="col-sm-2 control-label">Student Name:</label><div class="col-sm-4"><input type=text class="form-control" name="fullName" id=tb' + iCnt + ' ' + '" /></div> <label class="col-sm-2 control-label">Email Id:</label><div class="col-sm-4"><input type=text class="form-control" name="fullName" id=tb' + iCnt + ' ' + '" /></div>  ');
             
   	});
       $("#ser_id").click(function(){
 			 $('#test_div').hide(); 
			 $('#config_portal').show();
			 $('#config_portal').load('generateTest');
       });
       $("#help_id").click(function(){
			 $('#test_div').hide(); 
			 $('#config_portal').hide();
			 $('#registration_page').show();
			 $('#registration_page').load('registration');
       });
       $("#testmgt_id").click(function(){	

			 $('#test_div').hide();  
			 $('#config_portal').show();
			 $('#config_portal').load('testmgmt');
       });
       $("#home_id").click(function(){	
			 $('#test_div').show();    	     
			 $('#config_portal').hide();
       });
       $("#create_grp").click(function(){			
			$("#grpinfo_table").hide();
			$('#add_newmembers').hide();
			$("#grpinfo_table1").show();
	   });
       $("#cnfGrp").click(function(){	
			 $('#config_portal').load('generateTest');

       });
       $("#help_id").click(function(){
			 $('#config_portal').load('../peace.html');
       });
       $("#assign_test").click(function(){
  	   			$('#grpinfo_table1').hide();
  	   			 $('#add_newmembers').hide();
  	 			 $("#grpinfo_table").show();
  	   });
       $("#add_members").click(function(){
   			$('#grpinfo_table1').hide();
   			 $('#add_newmembers').show();
 			 $("#grpinfo_table").hide();
      });
       
       $("#group_url").click(function(){
    	   $.ajax({    	            
	        	 url: "test/listTestAction",    // think about it to load tbal e data 	            
	            type: 'GET', 
	            dataType: 'json', 
	            success:function(response){
	            },
	            error:function(jqXhr, textStatus, errorThrown){
	                alert(textStatus);
	            }
	        });
	      });
     });
   
   	
		  $('#grp_tabledata').show();


       var dataObj1 = {
           "data": [{
               "fullName": "vikram",
               "email": "vikerams@cristi.com"
           }, {
               "fullName": "snghi",
               "email": "virendra@cgi.com"
           }]
       };
       var data1 = JSON.stringify(dataObj1);
       console.log(dataObj1); console.log(data1);
       // Below block works fine
       $("#country1").change().click(function(event) {
    	      var country = $('#data2').val();
    	      alert("Ajax call"+country);
    	        $.ajax({    	            
    	        	 url: "test/creategrp+?data="+data1,    // Append URL instead declaring data=''	            
    	            dataType: 'json',
    	            contentType: 'application/json',
    	            type: 'POST', 
    	            success:function(response){
    	            alert("success");             
    	            },
    	            error:function(jqXhr, textStatus, errorThrown){
    	                alert(textStatus);
    	            }
    	        });
    	      });
       // to update data 
        var dataObj = $("#introForm").serialize();
       $('#submit-date1').click(function(data) {
       	alert("Ajax call");
   	      var country = $('#data2').val();
   	      alert("Ajax call"+country);
   	       $.ajax({ 
           type: "POST", 
           url: "test/creategrp",
           contentType: "application/x-www-form-urlencoded",
           success:function(response){
           alert("success"+lists);   
           $.each(data, function(index) {
               alert("dataLis"+dataLis);
           });  
           },
           error:function(jqXhr, textStatus, errorThrown){
               alert(textStatus);
           }
       });

       });
       $('#submit-date1').click(function(data) {
          alert("Ajax call");
   	      var country = $('#data2').val();
       $.getJSON('test/creategrp', {
    	   fullName : country
       }, function(jsonResponse) {
    	   alert(" key "+jsonResponse.lists); 
         $.each(jsonResponse.maps, function(key,value) {
        	 alert(" key "+key);
        	 alert(" val "+value);
         });
       });

       });
       $('#submit-date2').click(function(data) {
           alert("Ajax call");
        $.getJSON('test/populatData', function(jsonResponse) {
     	   alert(" key "+jsonResponse.email); 
     	   var myemail=jsonResponse.email;
     	   $('#email').val(myemail);

        });

        });
       
       $('#assignTst').click(function(data)
    		   {
		    	   $.ajax({ 
		               type: "POST", 
		               url: "test/creategrp",
		               contentType: "application/x-www-form-urlencoded",
		               success:function(response){
		               alert("success"+lists);   
		               $.each(data, function(index) {
		                   alert("dataLis"+dataLis);
		               });  
		               },
		               error:function(jqXhr, textStatus, errorThrown){
		                   alert(textStatus);
		               }
		           });
    		   });
       
      
    
    $("#cnfGrp1").on("click",function(){
			alert("Try");
        return false;
    }); 
    
    function addDynamicFileds()
    {
    	
    	
    }
    
    function makeAjaxCall(){
 	   alert("item cleicked");
        $.ajax({
     	   type: "POST", 
            url: "test/populatData",
            dataType: 'json',           
            success:function(response){
            	alert("email "+response.email)
                $('#email').val(response.email);            
            },
            error:function(jqXhr, textStatus, errorThrown){
                alert(textStatus);
            }
        });    
    }
   
 
    function defaultDivStatusonLoad(){

		 $('#grpinfo_table1').hide();
		 $('#add_newmembers').hide();
	}
    
 
    /* This method creates a group and test json, test is an jsn array and group is a key */
    function assignTest()
    {
    	var groupTestInfo="";
    	var selectedGrp=$("#allgrp").val();
    	groupTestInfo='{ "group":"'+selectedGrp+'","tests":['
    	$('input[type="checkbox"]:checked').each(function(){           
		});
    	 $("#que_tabledata :checkbox").each(function(){  
             if($(this).is(':checked')){ 
            	 alert("uiui"+$(this).parent('td').parent('tr').children('td.t_id').text());
            	 alert("uuiuui"+$(this).parent('td').parent('tr').children('td.t_name').text());
            	 
            	 var test_id=$(this).parent('td').parent('tr').children('td.t_id').text();
    			 var test_name=$(this).parent('td').parent('tr').children('td.t_name').text();
    			 
    			 var grp_test='{"testId":"'+test_id+'","testName":"'+test_name+'"},';
    			 groupTestInfo=groupTestInfo+grp_test;
 				}
    	 });
    	 
    	 groupTestInfo=groupTestInfo.substring(0, groupTestInfo.length-1);

    	 groupTestInfo=groupTestInfo+"]}";
    	 
    	 alert(" Group and test "+groupTestInfo);
    	 var queTestJson=JSON.stringify(groupTestInfo);
    	 $.ajax({
    		 url:"test/updateGrpTestInfo?grpTestStr="+groupTestInfo,
    		 content:'application/json;charset=utf-8',
    		 type:'POST',
    		 success:function(response){
    			 alert("success");
    		 }
       	 });
		
    }
       </script>
<title>MainMenu</title>
</head>
<body>

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
						<li><a id="testmgt_id" href="#">Creating Tests</a></li>
						<li><a id="help_id" href="#">Help</a></li>
					</ul>
				</div>
			</div>
			</nav>
		</div>
	</div>
	<div id="test_div" class="container">
		<ul class="nav nav-tabs">
			<s:url var="index_url" action="login" />
			<li class="active"><a id="config_url" href="#hello"
				data-toggle="tab">Configure General Settings</a></li>
			<s:url var="managegrp_url" action="listTestAction" />
			<li><a id="group_url" href="#empty" data-toggle="tab">Manage
					Groups</a></li>
			<s:url var="managetest_url" action="groupmgt" />
			<li><a href='#export' data-toggle="tab">export settings</a></li>
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
								<s:form id="introForm" theme="bootstrap" class="form-horizontal"
									method="post">
									<div class="form-group">
										<div class="col-sm-8">
											<s:textfield label="Portal Display Name:"
												class="form-control data" id="data2" name="fullName" />
										</div>
									</div>

									<div class="form-group">
										<div class="col-sm-8">
											<s:textfield label="E-Mail:" class="form-control" id="email"
												name="email" />
										</div>
									</div>

									<div class="form-group">
										<div class="col-sm-8">
											<!-- <s:file label="Logo:" 	class="filestyle" />  --commnted as form should have multipart-->
										</div>
									</div>

									<div class="form-group">
										<div class="col-sm-8 col-sm-offset-3">
											<s:select id="country" name="country" list="testList"
												label="Select Country" />
											<input id="submit-date" onclick="makeAjaxCall()"
												type="button" class="btn btn-primary" value="Search" />

										</div>
									</div>
								</s:form>
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
							<div class="panel">
							<div class="panel-body">
					          <div class="form-group">
					               <s:form theme="bootstrap" class="form-horizontal">
										<div class="col-sm-9 text-left ">
											   <s:select id="allgrp" value="" name="groups" list="grpList"
												label="Select Group" /> 
										</div>
										<div class="col-sm-12x`  form-group">
											<table id="que_tabledata"
												class="table table-striped table-bordered col-md-3">
												<thead>
													<tr>
														<th>#</th>
														<th>S.No.</th>
														<th>Test</th>
														<th>Description</th>
													</tr>
												</thead>
												<s:iterator value="aaData" status="rowstatus">
											    <tr class="<s:if test="#rowstatus.odd == true ">odd</s:if><s:else>even</s:else>">
											    <td class="t_id" style="display:none;"><s:property value="tId"/></td>
											    <td><input type="checkbox" /></td>											    
											    <td  class="t_rw"><s:property value="#rowstatus.count"/></td>
											    <td  class="t_name"><s:property value="tname" /></td>
											    <td  class="t_desc"><s:property value="desc"/></td>
											    </tr>
											</s:iterator>
								
											</table>
										
										</div>
										
										<div class="form-group">
										  <div class="col-sm-9 col-sm-offset-3 text-right">
											<input id="assignTst" 
												type="button" class="btn btn-primary" value="Submit" onclick="assignTest()"/>
										     </div>
									     </div> 
								   </s:form>
								</div></div>
									</div>
						
								
				
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
										<s:form id="registergroup" action="creategroup" theme="bootstrap" class="form-horizontal"
									method="post">
									<div class="form-group">
										<div class="col-sm-8">
											<s:textfield label="Group Name:"
												class="form-control data" id="grpName" name="groupName" />
										</div>
									</div>

									<div class="form-group">
										<div class="col-sm-8">
											<s:textfield label="Description:" class="form-control" id="grpDesc"
												name="groupDesc" />
										</div>
									</div>

									<div class="form-group">
										<div class="col-sm-8">
											<!-- <s:file label="Logo:" 	class="filestyle" />  --commnted as form should have multipart-->
										</div>
									</div>

									<div class="form-group">
								    <sj:submit cssClass="col-sm-offset-8 btn btn-primary text-right" formIds="registergroup"  
								    validateFunction="bootstrapValidation"/>
									</div>
	 							
								</s:form>
								</div>
							</div>
							<!-- @end  panel body -->
						</div>
						<!-- @end  panel primary -->
					</div>
					<!-- @end  grpinfo_tablel -->

					<div class="col-md-9" id="add_newmembers">
						<!-- start of add_newMembers-->
						<div class="panel panel-primary">
							<div class="panel-heading">
								<h3 class="panel-title">Add a student</h3>
							</div>
							<div class="panel-body">
								<div class="cliente">
									<div class="form-horizontal" role="form">
										<div class="control-group" id="add_mem_form">

											<div class="row text-left form-group form-horizontal">
												<button type="button" id="addButton" class="btn btn-default">
													<span class="glyphicon glyphicon-plus"></span> Add students
												</button>
											</div>
											<div class="form-group form-horizontal">

												<label class="col-sm-2 control-label">Student Name:</label>
												<div class="col-sm-4">
													<input type="text" class="form-control" name="fullName" />
												</div>

												<label class="col-sm-2 control-label">Email ID:</label>
												<div class="col-sm-4">
													<input type="text" id="mail1" class="form-control"
														name="fullName" />
												</div>
											</div>

											<div class="form-group form-horizontal">

												<label class="col-sm-2 control-label">Student Name:</label>
												<div class="col-sm-4">
													<input type="text" class="form-control" name="fullName" />
												</div>

												<label class="col-sm-2 control-label">Email ID:</label>
												<div class="col-sm-4">
													<input type="text" id="mail2" class="form-control"
														name="fullName" />
												</div>
											</div>
											<div class="form-group form-horizontal">

												<label class="col-sm-2 control-label">Student Name:</label>
												<div class="col-sm-4">
													<input type="text" class="form-control" name="fullName" />
												</div>

												<label class="col-sm-2 control-label">Email ID:</label>
												<div class="col-sm-4">
													<input type="text" id="mail3" class="form-control"
														name="fullName" />
												</div>
											</div>
											<div class="form-group form-horizontal">

												<label class="col-sm-2 control-label">Student Name:</label>
												<div class="col-sm-4">
													<input type="text" id="mail4" class="form-control"
														name="fullName" />
												</div>

												<label class="col-sm-2 control-label">Email ID:</label>
												<div class="col-sm-4">
													<input type="text" id="mail5" class="form-control"
														name="fullName" />
												</div>
											</div>
										</div>
									</div>
								</div>
								<!-- @end  cliente -->
								<div class="row text-right" style="padding-right: 10px">
									<button id="cnfGrp" type="button" class="btn btn-default">Save</button>
								</div>
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
								<li class="active"><a id="assign_test" href="#">Assign
										test</a></li>
								<li class="active"><a id="add_members" href="#">Add
										members to group</a></li>
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
			<!-- Started tab-pane div #empty-->
			<div class="tab-pane " id="export">
				<!-- Start of tab pane item-->

				<div class="container row col-md-9 ">
					<!-- Start of a row  if row-fluid gets strecth to write so same container row-->
					<div class="bs-example ">
						<div class="panel-group " id="accordion"
							style="padding-top: 30px; padding-right: 30px;">
							<div class="panel panel-primary">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a data-toggle="collapse" data-parent="#accordion"
											href="#collapseOne">Export question format to local disk</a>
									</h4>
								</div>
								<div id="collapseOne" class="panel-collapse collapse">
									<div class="panel-body">
										<form class="form-horizontal" role="form">
											<div class="form-group">
												<label class="col-md-6 control-label">Multiple
													select box ( Check box):</label>
												<div class="col-sm-3">
													<input type="text" class="form-control" name="chkbox" />
												</div>
											</div>

											<div class="form-group">
												<label class="col-sm-6 control-label">Radion button:</label>
												<div class="col-sm-3">
													<input type="text" class="form-control" name="radbtn" />
												</div>
											</div>

											<div class="form-group">
												<label class="col-sm-6 control-label">true/false:</label>
												<div class="col-sm-3">
													<input type="text" class="form-control" name="truefalse" />
												</div>
											</div>

											<div class="form-group">
												<label class="col-sm-6 control-label">Fill in the
													blanks:</label>
												<div class="col-sm-3">
													<input type="text" class="form-control" name="fillblank" />
												</div>
											</div>
										</form>
										<div class="row text-right" style="padding-right: 10px">
											<button id="cnfGrp" type="button" class="btn btn-default">Save</button>
										</div>
									</div>




								</div>
							</div>
							<div class="panel panel-primary">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a data-toggle="collapse" data-parent="#accordion"
											href="#collapseTwo">Export group and student file format</a>
									</h4>
								</div>
								<div id="collapseTwo" class="panel-collapse collapse">
									<div class="panel-body">
										<form class="form-horizontal" role="form">
											<div class="form-group">
												<label class="col-sm-3 control-label">Download:</label>
												<div class="col-sm-5">
													<input type="text" class="form-control" name="fullName" />
												</div>
											</div>

										</form>
									</div>
								</div>
							</div>
						</div>
					</div>


				</div>
				<!-- @end  grpinfo_tablel -->
			</div>
			<!-- End for first row  -->
		</div>
		<!-- @end #exort -->
		<div class="clock" style="margin: 2em;"></div>

	</div>
	<div id="ms_timer"></div>

	<div class="container" id="config_portal"></div>
	<div class="container" id="registration_page"></div>
	<div class="container"></div>
</body>
</html>