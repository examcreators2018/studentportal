<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags"%>
<%@taglib uri="/struts-dojo-tags" prefix="sx"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/bootstrap.min.css">

<link rel="stylesheet" href="../css/jquery.cleditor.css">	
<link rel="stylesheet" href="../css/Menu2.css">

<script type="text/javascript" charset="utf-8"
	src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" charset="utf-8"
	src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<script type="text/javascript" charset="utf-8"
	src="${pageContext.request.contextPath}/js/jquery.cleditor.min.js"></script>
<script type="text/javascript">

//var que_ans2=' {"que":"what is capital of karnataka","type":"radio","ID":"Q!!","options": [{"opt":"KC ","ans":"choice", "seq":"A"},{"opt":" KA","ans":"cjoice2","seq":"B"}]}';
//var que_ans3=' {"que":"what is capital of India","type":"checkbox","ID":"Q11","options": [{"opt":"DL ","ans":"choice", "seq":"A"},{"opt":" KA","ans":"cjoice2","seq":"B"}]}';
//var que_ans4=' {"que":"what is capital of UP","type":"checkbox","ID":"Q22","options": [{"opt":"LKo ","ans":"choice", "seq":"A"},{"opt":" KA","ans":"cjoice2","seq":"B"}]}';

// This is the array which shuld replace by browser cache which may solve other issues for client 
var  queArr=new Array(); //r=[que_ans2,que_ans3,que_ans4];

    $(document).ready(function(){
    	
    	
    	$(document).ready(function () { $("#queInputBox").cleditor(); });
    	// Load defaults for page 
    	var iCnt = 5;
    	var iCnt1 = 100;
    	defaultDivVisiblity(); 
    	var masked = $('.masked');
    	
        $.each(masked, function() {
            var idx = $(this).index();
            $.each($('tr'), function() {
                $(this).find('td').eq(idx).hide();
            });
        });        
		
    	$('#que_tabledata tr').click(function (event) {
    		e.preventDefault();
    		var row=$('#que_tabledata tr.selected').html();
    		alert("Sel click  btn"+row); // This works  proper ,retuns the selected row and its data (if full row then remove td.t_id   				
    				
  		});
    	
      // Add button
    	$('#btAdd').click(function() {    		
    			//var test =  JSON.parse($.cookie("test-data"));    		
    			var selected_value = $('#selectqueopt').val();
                iCnt = iCnt + 1;
                iCnt1 = iCnt1+1;
                $('#chkBoxque').append('<div id="rwk' + iCnt + '" class="row" style="margin-top: 14px;" ><div class="col-md-1"><input type=checkbox id=ck' + iCnt + '></div><div ><input type=text class="input col-md-9" id=tx' + iCnt + '></div>');             
    	});
    	
    	// Remove button
    	$('#btRemove').click(function() {    		
	            if(iCnt>=5)
	           	{            
	           	  $('#rwk' + iCnt).remove();
	           	  iCnt=iCnt-1;
	           	}
	    });
    	
    	var queType="";
    	$('#selectqueopt').on('change', function(){
    		 queType="";
					 var selected_value = $(this).val();
		             switch (selected_value) { 
		             case 'Multiple Choice': 
		            	 $('#chkBoxque').show();
		            	 $('#radiobtnque').hide();
		            	 $('#truefalseque').hide();
		            	 $('#fillinbkankque').hide(); 
	            		 $('#rwk3').show();
		         		 $('#rwk4').show();
		            	 queType=selected_value;
			         	 manageInputFields(4);
		                 break;
		             case 'Multiple Response': 
		            	 $('#chkBoxque').show();
		            	 $('#radiobtnque').hide();
		            	 $('#truefalseque').hide();
		            	 $('#fillinbkankque').hide();
	            		 $('#rwk3').show();
		         		 $('#rwk4').show();
		            	 queType=selected_value;
		            	 manageInputFields(4);
		            	 break;     
		             case 'true/false':
		            	 $('#chkBoxque').show();
		         		$('#radiobtnque').hide();
		         		$('#truefalseque').hide();
		         		$('#fillinbkankque').hide();		         	
		         		queType=selected_value;
		         		manageInputFields(2);
		                break;
		             case 'Fill in the blanks': 
		            	$('#chkBoxque').show();
		         		$('#radiobtnque').hide();
		         		$('#truefalseque').hide();
		         		$('#fillinbkankque').hide();
		         		$('#rwk3').show();
		         		$('#rwk4').show();
		         		queType=selected_value;
		         		manageInputFields(4);
		                 break;
		             default:
		                 alert('Nobody Wins!');
		         }
			});  	
    	
    });

    	// It is a default method to keep default fields and on load
	function defaultDivVisiblity() 
	{
		$('#chkBoxque').show();
		$('#radiobtnque').hide();
		$('#truefalseque').hide();
		$('#fillinbkankque').hide();
		$('#servIDTxt').hide();
		$('#thddicopt').show();
 		$('#frthdicopt').show();		
	}
    var cuntQueId=1;
    // THis is the main method which saves dat to DB using ajax call, gets reply of the question in form of question ID updated in DB and then
    // it remove all fields and responsible to keep question in an array which is used at client side and maintained.
    // I may use better caching mechanism where can keep question in browser cache
    function saveQuestion(){
    	cuntQueId++;
    	var queId="";
    	var Contain = "";
    	// Default add for quetion
    	var returnedQueId="";
    	var serQId=$('#servIDTxt').val();
    	//var serQName= $('#servIDTxt').attr("name");
    	var qusIdToSer="qtid"+cuntQueId;
    	var setModifyFlag=0;
    	alert("ser id " +serQId+" serQName");
    	if( serQId.length == 0)
    		{
    			serQId="AAA";
    			alert("ser is not a modify ");    		
    		}
    	else
    		{
	    		qusIdToSer=serQId;
	    		setModifyFlag=1;
	    		alert("ser is a modify "+qusIdToSer);
    		}
    	
    	// This is default construction of question object which later is filled by other text input 
    	var queToSend='{"questions": {"que":"'+$('#queInputBox').val()+'","type":"'+$('#selectqueopt').val()+'","ismodify":"'+setModifyFlag+'","ID":"'+qusIdToSer+'","serID":"'+serQId+'","options":[';
        
    	 /* $( "#chkBoxque" ).html( $( "input:checked" ).val() + " is checked!" );
		    Iterate on each chekbox and corrssponding text box also
            $("#chkBoxque :text").each(function(){
                Contain += $(this).val() + "$";
            }); */
          
            
        // Below is used to construtct the arrry of questions oject
         var item=0;
        $("#chkBoxque :checkbox").each(function(){  
        	item++;
        	
            // Get checked/unchecked state and the text box data also
            if($(this).is(':checked')){ 
	            	Contain= $(this).val(); // get checked value
	            	var selId= $(this).attr("id");
	            	var selId1=selId.replace("ck","tx");
	            	selId1="#"+selId1;
	                var selQue='{"opt":"'+$(selId1).val()+'","isans":"Y"},';
	                queToSend=queToSend+selQue;             
				}
            else
            	{             
	            	Contain= $(this).val(); // get checked value
	            	var selId= $(this).attr("id");
	            	var selId1=selId.replace("ck","tx");  
	            	selId1="#"+selId1;
	            	var selQue='{"opt":"'+$(selId1).val()+'","isans":"N"},';
	                queToSend=queToSend+selQue;
            	}
        });
        
        // Alter the question string to remove extra braces for making as json
        queToSend=queToSend.substring(0, queToSend.length-1);
    	queToSend=queToSend+"]}}";
    	
    	// Convert in json string 
        var dataconfig = JSON.stringify(queToSend);
        alert("dataconfig "+dataconfig);
        
        // Send data using ajax call and get reply of the inserted row
        $.ajax({    	            
	        	url: "test/createtest+?data="+queToSend,    // Append URL instead declaring data=''	            
	            contentType: 'application/json;charset=utf-8',
	            type: 'POST', 
	            success:function(response){
	            // Get data from server 
	            alert("success : "+response.result);           
	            returnedQueId=response.result;
            },
               error:function(jqXhr, textStatus, errorThrown){
                 alert(textStatus);
            }
        });  
        
        //alert(json1.questions.options[0].opt); //111 111-1111
        var queParsed= JSON.parse(queToSend);
        alert("type"+queParsed.questions.type+"  Que :"+queParsed.questions.que+" date "); //88 8nd Street
        var quetype=queParsed.questions.type;
        queParsed.questions.serID=returnedQueId;
        // Before insert check if the question is modified list 
        queArr.push(queParsed);
        
        // Add question to table
        $('#que_tabledata').last().append('<tr><td><input type=checkbox /></td><td>5</td><td><a href="#" onclick="editQuestion()">' +queParsed.questions.que +'</a> '+'</td></tr>');
		 
        // Now remove the extra added fields and make it default 
        var remainItem=0;
        if(item > 4)
       	{
       		remainItem=item-4;
       	}
        var chkitem=remainItem;
        while(remainItem)
       	{
	       	 $('#chkBoxque').remove('#ck'+remainItem);
	       	 $('#chkBoxque').remove('#tx'+remainItem);
	       	 remainItem--;
       	}
        
        // clear field data  and array 
        queToSend="";
        $('#chkBoxque').show();
	    $('#radiobtnque').hide();
	    $('#truefalseque').hide();
	   	$('#fillinbkankque').hide();
	 	$('#thddicopt').show();
 		$('#frthdicopt').show();
 		$('#queInputBox').val("");
        
        // Clear all fields 
        var optNo=0;
        $("#chkBoxque :checkbox").each(function(){  
            	var Contain= $(this).val(); // get checked value
            	var selId= $(this).attr("id");
            	var selId1=selId.replace("ck","tx");            	
            	selId="#"+selId;
            	alert(" chek ID :"+selId);
            	$(selId).prop('checked',false);
            	selId1="#"+selId1;
                $(selId1).val("");
                optNo++;
                if(optNo > 4 )
               	{
                	var rowId=selId.replace("ck","rwk"); 
                	rowId=rowId;
                	//this.remove();
                	alert(" rowID :"+rowId);
               		$(rowId).remove();
               	}
				
        });
    	} 
    // THis function will remove extra fields based on selected options , I may change logic later,
    // this is used s on change event of select box 
    function manageInputFields(type)
    {
 		$('#queInputBox').val("");
    	  var optNo=1;
    	 // alert(" opt "+optNo );
    	  $("#chkBoxque :checkbox").each(function(){  
          	var Contain= $(this).val(); // get checked value
          	var selId= $(this).attr("id");           	
          	selId="#"+selId;
          	
            var rowId=selId.replace("ck","rwk"); 
            var txtBId=selId.replace("ck","tx");
            
            $(selId).prop('checked',false); 
            $(txtBId).val("");
            
            // Here check if true/false is selected dont deleted 3 and 4th field instead hide them and later makes them visible
            if( (optNo > type)) 
           	{
            	if(optNo <= 4)
            		{ 
            		    if(type==2)
            		    	{
            		    	  $(rowId).hide();
            		    	}            			
            		}
            	else
            		{
            			$(rowId).remove();
            		}            	
           	}
           
            optNo++;
				
      });
   }
    // Submit query dono why i have written it, chk later
    function submitque()
    {
    	alert("submit");
        var formData = $("#dataform").serialize(); //get all data from form
        alert("submit"+$("#dataform").val());
        var dataconfig = JSON.stringify(formData);
       // alert("submit"+dataconfig);
        console.log(formData); 

    }
    // Cancel and clear fields
    function cancelOpteraion()
    {
    	manageInputFields(0);
    }
    
    $(function(){
        $.each($('input,select,textarea', '#Aform'),function(k){
           // alert(k+' '+$(this).attr('name'));
        });
    });
    
    // Responsile to perform edit operation query for questions, later I should fint tune and enhance it
    function editQuestion()
    {
		     var inct=0;
    	     jQuery.each( queArr, function( i, val ) 
    	     {
	    		 var queNo=queArr[i];
	    		 $('#queInputBox').val(queNo.questions.que);
	    		 var allOptions=queNo.questions.options;
			     var k=1;
	    		 $.each(allOptions, function(idx, obj) {
	    				 $(servIDTxt).val(obj.serQId); 
	    				if(k > 4)
	    					{
	      		            	var newId='ck'+k;
		    					var newTkId='tx'+k;
		    	                $('#chkBoxque').append('<div  id="rwk' + k + '" class="row" style="margin-top: 14px;"><div class="col-md-1"><input type=checkbox id=' + newId + '></div><div ><input type=text class="col-md-9" id=' + newTkId + '></div> ');             
		    					var newTkIds='#'+newTkId;
		    	                $(newTkIds).val(obj.opt);
		    	                
		    	                if(obj.isans=="Y")
		    	                	{
		    	                	  alert(" obj sel :"+obj.isans);
		    	                		$('#'+newId).prop('checked',true);
		    	                	}
	    					}
	    				else
	    					{
		    					 var newIds='#ck'+k;
		    					 var newTkIds='#tx'+k;
		   		            	 alert("newIds : "+newIds+" newTkIds : "+newTkIds);
		  		            	 $(newTkIds).val(obj.opt); 
			  		             if(obj.isans=="Y")
		    	                	{
			  		            	alert(" obj sel :"+obj.isans);
		    	                		$(newIds).prop('checked',true);
		    	                	}
	    					}
	    				k++;
    			 });
		});
    	 
    	 
    	//var queNo=queArr[count];
    	//var jsonObj=JSON.parse(queNo);    	
    	//alert("type"+jsonObj.type+"  Que :"+jsonObj.ID); //88 8nd Street
    	//var quetyepe=jsonObj.ID;    	
    	$("#chkBoxque :checkbox").each(function(){
    	});
    }
    
    // THis is used to delete the questions from table, also it sends a ajax call to DB for deletion of quesition , will add a confirmation before delete
    
    function delQuestion()
    {
    	
    	$('input[type="checkbox"]:checked').each(function(){           
		});
    	 $("#que_tabledata :checkbox").each(function(){  
             // Get checked/unchecked state and the text box data also
             if($(this).is(':checked')){ 
            	 alert("uiui"+$(this).parent('td').parent('tr').children('td.t_id').text());
            	 alert("uuiuui"+$(this).parent('td').parent('tr').children('td.q1_id').text());
 				}
    	 });
		
    }
    </script>
</head>
<body data-twttr-rendered="true" data-spy="scroll" data-target=".bs-docs-sidebar">
	

	<div id="test_div" class="container">
		<ul class="nav nav-tabs">
			<s:url var="index_url" action="login" />
			<li class="active"><a id="config_url" href="#hello"
				data-toggle="tab">Configure General Settings</a></li>
		</ul>
		<div class="tab-content">
			<div class="tab-pane active" id="hello">
				<!-- Started tab-pane div #hello-->
				<h3></h3>
				<div id="configinbtn" class="container row">
					<div class="col-md-3">
						<!-- second column -->
						<div>
							<!--   <ul class="nav nav-list">
										<li class="nav-header">Please select question type to be created</li>								 
									 		<li><a href="">Multiple select option (Check box)</a></li>
									 		<li><a href="">Single selection option (RadioButton)</a></li>
									 		<li><a href="">true/false type</a></li>
									 		<li><a href="">Yes/No type</a></li>
									 		<li><a href="">Fill in the blanks type</a></li>
									 
									 </ul>-->
							<table id="que_tabledata"
								class="table table-striped table-bordered col-md-3">
								<thead>
									<tr>
										<th></th>
										<th>#</th>
										<th>Question</th>
										<th   class="masked"></th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td><input type="checkbox" /></td>
										<td class="id">1</td>
										<td class="t_id"><a href="#" onclick="editQuestion()">q1</a></td>
										<td class="q1_id">q4</td>
									</tr>
									<tr>
										<td><input type="checkbox" /></td>
										<td class="id">2</td>
										<td class="t_id"><a href="#" onclick="editQuestion()">q2</a></td>
										<td class="q1_id">q46</td>
									</tr>
									<tr>
										<td><input type="checkbox" /></td>
										<td class="id">3</td>
										<td class="t_id"><a href="#" onclick="editQuestion()">q3</a></td>
										<td class="q1_id">q45</td>
									</tr>
									<tr>
										<td><input type="checkbox" /></td>
										<td class="id">3</td>
										<td class="t_id"><a href="#" onclick="editQuestion()">q4</a></td>
										<td class="q1_id">q44</td>
									</tr>
								</tbody>
							</table>
						</div>
					<button id="cnfGrp" type="button" onclick="delQuestion()" class="btn btn-default">Delete</button>
						
					</div>
					<!-- 1st column end -->

					<div class="col-md-6">
						<!-- 2nd column -->
						<div class="panel panel-primary">
							<div class="panel-heading">
								<h3 class="panel-title"></h3>
							</div>
							<div id="questionForm" class="panel-body">
									<div class="form-group">
										<label for="name">Question</label>
										<!--<s:textarea id="queInputBox" class="form-control" rows="3"></s:textarea>-->
										<textarea id="queInputBox" class="form-control" name="input"></textarea>
										<input class="col-md-9" id="servIDTxt" type="text"   />
									</div>


									<div class="form-group">
										<label>Select question type</label>
									<select name="selectqueopt" id="selectqueopt" list=""> 
										  
										    <option value="Multiple Choice">Multiple Choice</option> 
										    <option value="Multiple Response">Multiple Response</option> 
										    <option value="true/false">true/false</option> 
										    <option value="Fill in the blanks">Fill in the blanks</option> 
										</select> 
										
									</div>
									<div class="form-group"></div>
									<!--  <div class="checkbox"></div>
									<s:url id="databaseList" action="test/creategrp" />
									<sx:autocompleter size="1" name="state" 
										showDownArrow="false" label="Choose state"></sx:autocompleter> -->
								<h2></h2>

								<div class="row text-right">
									<button type="button" id="btAdd" class="btn btn-default">
										<span class="glyphicon glyphicon-plus"></span> Add
									</button>
									<button type="button" id="btRemove"  class="btn btn-default">
										<span class="glyphicon glyphicon-minus"></span> Remove
									</button>
								</div>
								<!--  <input type="button" id="btnget" value="Add Element" class="bt" onclick="GetValue()"/>-->


								<s:form id="dataform" role="form">
								<div id="chkBoxque">
									<span class="label label-info">Enter the answer choices
										and mark select correct answers</span>
									<h1></h1>
									<div class="row top-buffer voffset3">
										<div class="col-md-1">
											<input type="checkbox" id="ck1"name="optchk" />
										</div>
										<div>
											<input class="col-md-9" id="tx1" type="text" />
										</div>
									</div>
									<h1></h1>
									<div class="row">
										<div class="col-md-1">
											<input type="checkbox" id="ck2" name="optchk"/>
										</div>
										<div>
											<input class="col-md-9" id="tx2" type="text" />
										</div>
									</div>
									<h1></h1>
									<div class="row" id="rwk3">
										<div class="col-md-1">
											<input type="checkbox" id="ck3" name="optchk" />
										</div>
										<div>
											<input class="col-md-9" id="tx3" type="text" />
										</div>
									</div>
									<h1></h1>
									<div class="row" id="rwk4">
										<div class="col-md-1">
											<input type="checkbox" id="ck4" name="optchk" />
										</div>
										<div>
											<input class="col-md-9" id="tx4" type="text" />
										</div>
									</div>
									
									

								</div>

								<div id="truefalseque">
									<span class="label label-info">Enter the answer choices
										and mark select correct answers</span>
									<h1></h1>
									<div class="row top-buffer voffset3">
										<div class="col-md-1">
											<input type="checkbox" />
										</div>
										<input type="text" class="col-sm-9 control-label" id="tftbox" value="true" />
									</div>

								</div>

								<div id="fillinbkankque">
									<span class="label label-info">Enter the answer choices
										in a comma seperate way</span>
									<h1></h1>
									<div class="row top-buffer voffset3">
										<div class="col-md-1">
											<input type="checkbox" />
										</div>
										<input type="text" class="col-sm-9 control-label" />
									</div>
									<h1></h1>

								</div>

								<div id="radiobtnque">
									<span class="label label-info">Enter the answer choice
										and mark select correct answer</span>
									<h1></h1>
									<div class="row top-buffer voffset3">
										<div class="col-md-1">
											<input name="optionsRadios" type="radio" />
										</div>
										<div>
											<input class="col-md-9" type="text" />
										</div>
									</div>
									<h1></h1>
									<div class="row">
										<div class="col-md-1">
											<input name="optionsRadios" type="radio" />
										</div>
										<div>
											<input class="col-md-9" type="text" />
										</div>
									</div>
									<h1></h1>
									<div class="row">
										<div class="col-md-1">
											<input name="optionsRadios" type="radio" />
										</div>
										<div>
											<input class="col-md-9" type="text" />
										</div>
									</div>
									<h1></h1>
									<div class="row">
										<div class="col-md-1">
											<input name="optionsRadios" type="radio" />
										</div>
										<div>
											<input class="col-md-9" type="text" />
										</div>
									</div>

								</div>
								<div></div>
								<div class="col-sm-5 col-sm-offset-3" style="padding-top: 10px">
									<button id="cnfGrp" type="button" onclick="saveQuestion()" class="btn btn-default">Save</button>
									<button id="cnfGrp" type="button" onclick="cancelOpteraion()" class="btn btn-default">Cancel</button>
								</div>
								</s:form>

							</div>
						</div>
					</div>



				</div>
			</div>
			<!-- 1st column end -->
		</div>
		<!-- End for first row configinbtn  # configinbtn-->
	</div>
	<!-- @end #hello -->
	</div>
	</div>
</body>
</html>