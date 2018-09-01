<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Insert title here</title>




<script>


$("#updateopt11").click(function(event) {
	alert("Ajax call data1"+data1);

	var dataObj1 = {
	        "data": [{
	            "dName": '20',
	            "name":  $('#name').val()
	        }]
	    };
	    
	var data1 = JSON.stringify(dataObj1);
	console.log(dataObj1); console.log(data1);
    var formData = $("#mainfoem").serialize(); //get all data from form
    console.log(formData); 
	var dataObj1 = 
		
			{
	            "dName":  $('#dName').val(),
	            "name":  $('#name').val(),

	            "desc":  $('#desc').val(),
	            "qpPage":  $('#qpPage').val(),
	            "rQue":  $('#rQue').val(),
	            "tLimit":  $('#tLimit').val(),
	            "texpiry":  $('#texpiry').val(),
	            "qMandatory":  $('#qMandatory').val(),
	            "qBack":  $('#qBack').val(),
	            "resVisble":  $('#resVisble').val(),
	            "email":  $('#email').val(),
	            "passMarks":  $('#passMarks').val()
	            
	        };
	    
	            
	    
	var dataconfig = JSON.stringify(dataObj1);
      $.ajax({    	            
      	 url: "test/configuretest+?data="+dataconfig,    // Append URL instead declaring data=''	            
          dataType: 'json',
          contentType: 'application/json;charset=utf-8',
          type: 'POST', 
          success:function(response){
          alert("success");             
          },
          error:function(jqXhr, textStatus, errorThrown){
              alert(textStatus);
          }
      });
    });
    
    
$(document).ready(function() {
	$('#example').show();
	$("#divcontent1").show();
	$("#div1").css('border-bottom','1px solid #d3d3d3')
	  $('#example').DataTable(
				{
			    "bProcessing": false,
		        "bServerSide": false,
			    "bFilter": true,
			    "bInfo": false,
			    "bAutoWidth": false ,
			    "sAjaxSource": "gridaction",
		        "aoColumns": [
		            { "mData": "name" },
		            { "mData": "desc" },
		            { "mData": "cdate" },
		            { "mData": "edate" },
		            { "mData": "performance" },
		            { "mData": "details" },
		             
		        ]});
	
        $.getJSON('test/gettestconfig', function(jsonResponse) {
     	   alert(" resp :"+jsonResponse);
     	   $('#dName').val(jsonResponse.dName);
     	  $('#qpPage').val(qpPage);

        });

	  
	    $('.collapse').on('show.bs.collapse', function() {
	        var id = $(this).attr('id');
	        $('a[href="#' + id + '"]').closest('.panel-heading').addClass('active-faq');
	        $('a[href="#' + id + '"] .panel-title span').html('<i class="glyphicon glyphicon-minus"></i>');
	    });
	    $('.collapse').on('hide.bs.collapse', function() {
	        var id = $(this).attr('id');
	        $('a[href="#' + id + '"]').closest('.panel-heading').removeClass('active-faq');
	        $('a[href="#' + id + '"] .panel-title span').html('<i class="glyphicon glyphicon-plus"></i>');
	    });
  
} );
function makeAjaxCall(){
	   alert("cliecked 01");
     $.ajax({
  	   type: "POST", 
         url: "test/configuretest",
         success:function(response){
         	alert("Success"+response)  ;
         	 $('#dName').val(response.dName);
         },
         error:function(jqXhr, textStatus, errorThrown){
             alert(textStatus);
         }
     });    
 }
$("#div1").click(function()
		{
	$('#divcontent1').show();
	$("#divcontent2").hide();
	$("#divcontent3").hide();
	$("#divcontent4").hide();
	$("#div1").css('border-bottom','1px solid #d3d3d3')
		});


$("#div2").click(function()
		{
	$('#divcontent2').show();;
	$("#divcontent1").hide();
	$("#divcontent3").hide();
	$("#divcontent4").hide();

	$("#div1").css('border-bottom','none')
		});

$("#div3").click(function()
		{
	$('#divcontent3').show();
	$("#divcontent1").hide();
	$("#divcontent2").hide();
	$("#divcontent4").hide();

	$("#div1").css('border-bottom','none')
		});
$("#div4").click(function()
		{
	$('#divcontent3').hide();
	$("#divcontent1").hide();
	$("#divcontent2").hide();
	$("#divcontent4").show();

	$("#div1").css('border-bottom','none')
		});

</script>



</head>
<body data-twttr-rendered="true" class="overflow: scroll;">
	<!--  data-twttr-rendered="true" property for vertical scroll -->
<!-- rtz accordian-->





<!--   -->

	<div class="row">
		<div class="col-md-9">
			<div id="test_div">

				<ul class="nav nav-tabs">
					<s:url var="index_url" action="login" />
					<li class="active"><a id="config_url" href="#"
						data-toggle="tab">Configure Test Settings</a></li>
					<s:url var="managegrp_url" action="hello" />
					<li><a id="group_url" href="#empty" data-toggle="tab">View
							tests</a></li>
					<s:url var="managetest_url" action="groupmgt" />
					<li><a href='groupmgt' data-toggle="tab">Test Results</a></li>
				</ul>

				 <!--  <div class="container row col-md-12 ">
					<!-- Start of a row  if row-fluid gets strecth to write so same container row-->
					<!-- <div class="bs-example ">
						<table id="example" class="display" cellspacing="0" width="100%">
							<thead>
								<tr>
									<th>Name</th>
									<th>Description</th>
									<th>Creation Date</th>
									<th>Expiry Date</th>
									<th>Performance</th>
									<th>Details</th>
								</tr>
							</thead>


						</table>
					</div>-->
					
<s:form action="test/configuretest" theme="bootstrap" id="mainfoem">
<div class="row" style="padding-top:px !important;">
		
		<div class="col-md-12" id="div1" style="border-top:1px solid #d3d3d3;border-left:1px solid #d3d3d3;border-right:1px solid #d3d3d3;
		height:40px !important;background-color:#fff;color
		:#ff3102;width:100% !important;border-top-radius:3px !important;vertical-align:center !important;padding-top:5px !important;cursor:pointer">
		General Configuration</div>
		<div class="d1" id="divcontent1">
		<br/>
									<div class="form-group">
										<label class="col-md-6 control-label" style="margin-top:10px !important;">Name:</label>
										<div class="col-sm-3" style="margin-top:10px !important;">
											<s:textfield class="form-control" name="testName" id="name" />
										</div>
									</div>

									<div class="form-group">
										<label class="col-sm-6 control-label">Subject/Description:</label>
										<div class="col-sm-3">
											<s:textfield class="form-control" name="testDesc"  id="desc"/>
										</div>
									</div>
									
									<div class="form-group">
										<label class="col-sm-6 control-label"  style="margin-top:10px !important;">Feedback Emails:</label>
										<div class="col-sm-3"  style="margin-top:10px !important;">
											<s:textfield class="form-control" name="email" id="email1"/>
										</div>
									</div>
						
		
		</div>

		<div class="col-md-12" id="div2" style="border:1px solid #d3d3d3;height:50px !important;background-color:#fff;color
		:#ff3102;width:100% !important;border-radius:3px !important;vertical-align:center !important;padding-top:5px !important;cursor:pointer;">
		Question Configuration</div>
		<br/>
		<div class="d1" id="divcontent2" style="display:none ;">
		
		
						         

									<div class="form-group">
										<label class="col-sm-6 control-label" style="margin-top:10px !important;">Random
											Questions:</label>
										<div class="col-sm-3" style="margin-top:10px !important;">
											<s:textfield  class="form-control" name="isRandom" id="rQue" />
										</div>
									</div>

									<div class="form-group">
										<label class="col-sm-6 control-label">Test Duration:</label>
										<div class="col-sm-3" style="margin-top:10px !important;">
											<s:textfield  class="form-control" name="tLimit" id="tLimit" />
										</div>
									</div>

									
		</div>
		
		
		
		<div class="col-md-12" id="div3" style="border:1px solid #d3d3d3;height:40px !important;background-color:#fff;color
		:#ff3102;width:100% !important;border-radius:3px !important;vertical-align:center !important;padding-top:5px !important;cursor:pointer">
		Answer Configuration</div>
		<div class="d1" id="divcontent3"style="display:none !important;">
	    <br/>

										<div class="form-group">
										<label class="col-md-6 control-label" style="margin-top:10px !important;">Mandatory:</label>
										<div class="col-sm-3" style="margin-top:10px !important;">
											<s:textfield  class="form-control" name="qMandatory" id="qMandatory" />
										</div>
									</div>

									<div class="form-group">
										<label class="col-sm-6 control-label" style="margin-top:10px !important;">Allow To Go
											Back:</label>
										<div class="col-sm-3" style="margin-top:10px !important;">
											<s:textfield  class="form-control" name="qBack"  id="qBack"/>
										</div>
									</div>
	</div>
		
		<div class="col-md-12" id="div4" style="border:1px solid #d3d3d3;height:40px !important;background-color:#fff;color
		:#ff3102;width:100% !important;border-radius:3px !important;vertical-align:center !important;padding-top:5px !important;cursor:pointer">
		Result Configuration</div>
		<div class="d1" id="divcontent4"style="display:none !important;">
	    <br/>
	     	
	     	  <div class="form-group">
										<label class="col-md-6 control-label"  style="margin-top:10px !important;">Pass Marks:</label>
										<div class="col-sm-3"  style="margin-top:10px !important;">
											<s:textfield  class="form-control" name="passMarks" id="resVisble" />
										</div>
									</div>
	     	
							   <div class="form-group">
										<label class="col-md-6 control-label"  style="margin-top:10px !important;">Test Result
											Visbility:</label>
										<div class="col-sm-3"  style="margin-top:10px !important;">
											<s:textfield class="form-control" name="resVisble" id="resVisble" />
										</div>
									</div>


						
	</div>
					
</div>
			<div class="row text-right">
						<input id="updateopt" type="submit" class="btn btn-primary" value="Save and Next" />
						</div>				
</s:form>
					
<!-- 

				<s:form action="test/configuretest" theme="bootstrap" id="mainfoem"
						 >
					<div class="container" id="MainMenu">
						<div class="panel list-group container">
							<a href="#" class="list-group-item" data-target="#demo3"
								data-toggle="collapse" data-parent="#MainMenu">General
								Configuration<span class="glyphicon glyphicon-stats pull-right"></span>
							</a>

							<div class="collapse" id="demo3">
								<s:form class="form-horizontal"   role="form">
									<div class="form-group">
										<label class="col-md-6 control-label">Name:</label>
										<div class="col-sm-3">
											<s:textfield class="form-control" name="name" id="name" />
										</div>
									</div>

									<div class="form-group">
										<label class="col-sm-6 control-label">Display Name:</label>
										<div class="col-sm-3">
											<s:textfield class="form-control"  name="dName" id="dName"/>
										</div>
										
									</div>

									<div class="form-group">
										<label class="col-sm-6 control-label">Subject/Description:</label>
										<div class="col-sm-3">
											<s:textfield class="form-control" name="desc"  id="desc"/>
										</div>
									</div>
								</s:form>
							</div>
							<a href="#demo4" class="list-group-item" data-toggle="collapse"
								data-parent="#MainMenu">Question Configuration</a>
							<div class="collapse" id="demo4">
								<form class="form-horizontal" role="form">
									<div class="form-group">
										<label class="col-md-6 control-label">Question Per
											Page:</label>
										<div class="col-sm-3">
											<s:textfield class="form-control" name="qpPage" id="qpPage" />
										</div>
									</div>

									<div class="form-group">
										<label class="col-sm-6 control-label">Random
											Questions:</label>
										<div class="col-sm-3">
											<input type="text" class="form-control" name="rQue" id="rQue" />
										</div>
									</div>
								</form>
							</div>
							<a href="#demo5" class="list-group-item" data-toggle="collapse"
								data-parent="#MainMenu">Answer Configuration:</a>
							<div class="collapse" id="demo5">
								<form class="form-horizontal" role="form">
									<div class="form-group">
										<label class="col-md-6 control-label">Mandatory:</label>
										<div class="col-sm-3">
											<input type="text" class="form-control" name="qMandatory" id="qMandatory" />
										</div>
									</div>

									<div class="form-group">
										<label class="col-sm-6 control-label">Allow To Go
											Back:</label>
										<div class="col-sm-3">
											<input type="text" class="form-control" name="qBack"  id="qBack"/>
										</div>
									</div>


								</form>
							</div>
							<a href="#demo6" class="list-group-item" data-toggle="collapse"
								data-parent="#MainMenu">Test Result Configuration</a>
							<div class="collapse" id="demo6">
								<form class="form-horizontal" role="form">
									<div class="form-group">
										<label class="col-md-6 control-label">Test Result
											Visbility:</label>
										<div class="col-sm-3">
											<input type="text" class="form-control" name="resVisble" id="resVisble" />
										</div>
									</div>

									<div class="form-group">
										<label class="col-sm-6 control-label">Feedback Emails:</label>
										<div class="col-sm-3">
											<input type="text" class="form-control" name="email" id="email"/>
										</div>
									</div>

									<div class="form-group">
										<label class="col-sm-6 control-label">Passing Marks:</label>
										<div class="col-sm-3">
											<input type="text" class="form-control" name="passMarks" id="passMarks" />
										</div>
									</div>

								</form>
							</div>
						</div>
						<div class="row text-right">
						<input id="updateopt" type="button" class="btn btn-primary" value="Save and Next" />
						</div>
						
					</div>
						
						
					</s:form>
					<!-- <div class="container">   
    <div class="row">
        <div class="col-md-6 col-md-offset-3">
            <!-- Nav tabs category -->

					<!-- Tab panes -->
					<!--  <div class="tab-content faq-cat-content">
                <div class="tab-pane active in fade" id="faq-cat-1">
                    <div class="panel-group" id="accordion-cat-1">
                        <div class="panel panel-default panel-faq">
                            <div class="panel-heading">
                                <a data-toggle="collapse" data-parent="#accordion-cat-1" href="#faq-cat-1-sub-1">
                                    <h4 class="panel-title">
                                        FAQ Item Category #1
                                        <span class="pull-right"><i class="glyphicon glyphicon-plus"></i></span>
                                    </h4>
                                </a>
                            </div>
                            <div id="faq-cat-1-sub-1" class="panel-collapse collapse">
                                <div class="panel-body">
                                    Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default panel-faq">
                            <div class="panel-heading">
                                <a data-toggle="collapse" data-parent="#accordion-cat-1" href="#faq-cat-1-sub-2">
                                    <h4 class="panel-title">
                                        FAQ Item Category #1
                                        <span class="pull-right"><i class="glyphicon glyphicon-plus"></i></span>
                                    </h4>
                                </a>
                            </div>
                            <div id="faq-cat-1-sub-2" class="panel-collapse collapse">
                                <div class="panel-body">
                                    Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
     
            </div>
          </div>
        </div>
    </div>	 -->
				</div>
				<!-- @end  grpinfo_tablel -->
			</div>

		</div>

		<div class="col-md-3"></div>
	</div>
</body>
</html>