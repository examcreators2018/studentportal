<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/bootstrap.min.css">
<link rel="stylesheet" href="../css/Menu2.CSS">
<link rel="stylesheet" href="../css/jquery.cleditor.css">	
<link rel="stylesheet" href="../css/flipclock.css">

<script type="text/javascript" charset="utf-8"
	src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" charset="utf-8"
	src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script type="text/javascript" charset="utf-8"
	src="${pageContext.request.contextPath}/js/jquery.cleditor.min.js"></script>
	
<script type="text/javascript" charset="utf-8"
	src="${pageContext.request.contextPath}/js/jquery.cookie.js"></script>

<script type="text/javascript" charset="utf-8"
	src="${pageContext.request.contextPath}/js/flipclock.js"></script>
<script type="text/javascript">

var queArr;
var questionArray=[];

$(document).ready(function() {	
	clock = $('.clock').FlipClock(1 * 10  ,{
        clockFace: 'HourlyCounter',
        countdown: true,
        callbacks: {
            stop: function() {
            }
        }
    });
	$(document).ready(function () { $("#input").cleditor(); });
});  

    $(document).ready(function(){
    	 var iCnt = 0;
    	 var iCnt1 = 100;
    	defaultDivVisiblity();
    	
		   alert(" D1 ");
		   //makeAjaxCall();
       $.getJSON('test/gettestconfig', function(jsonResponse) {
     	   alert(" resp :"+jsonResponse);

        });
		
      var result = "";
      $.ajax({    	  
          	url:'test/gettestconfig',
          	method:'GET',
          	async:false,
          	success:function(jsonResponse)
          	{
          		 alert(" resp 00:"+jsonResponse.jsoStrResp); 
          		 var result = JSON.parse(jsonResponse.jsoStrResp);
            	 console.log(result);            	 
            	 jQuery.each( result, function( i, val ) 
    		    	     {
    			 			 
    			    		 var queNo=result[i];
    			    		 alert(" read :"+result[i]+" val "+val); 
    			    		 var jsoarrty=[];
    		          		 var resultse = JSON.parse(result[i]);
    		          		jQuery.each( resultse, function( k, vall ) 
    		    		    	     {
    		          			 var queNo1=resultse[k];
        			    		 alert(" read >>:"+resulset[k]);
    		    		    	     });
    			    		 alert(" resultse :"+resultse.length);

    			    		var jsononj=jQuery.parseJSON( queNo );
    			    		alert(" D---"+jsononj); 
    			    		 questionArray.push(queNo);
    			    		 alert(" just a test :"+queNo);
    		    	     });
          	}
      });
      
    /*  var resukt = "";
	  $.getJSON('test/gettestconfig', function(jsonResponse) {
     	   alert(" resp :"+jsonResponse.jsoStrResp);
     	   queArr=jsonResponse.jsoStrResp;
     	  var resukt = JSON.parse(queArr);
     	  console.log(resukt);
     	 
        },getCall(resukt));
	  
	  function getCall(me)
	  {
		  jQuery.each( me, function( i, val ) 
		    	     {
			 			 alert(" just a test :");
			    		 var queNo=me[i];
			    		 questionArray.push(queNo);
			    		 alert(" just a test :"+queNo);
		    	     });
	  }*/
 alert(" hi m array :"+questionArray.length);

 var que_ans2='{"questions": {"que":"what is capital of karnataka","type":"radio","options": [{"opt":"KC ","ans":"choice", "seq":"A"},{"opt":" KA","ans":"cjoice2","seq":"B"}]}}';
 var que_ans3='{"questions": {"que":"what is capital of India","type":"checkbox","options": [{"opt":"DL ","ans":"choice", "seq":"A"},{"opt":" KA","ans":"cjoice2","seq":"B"}]}}';
 var que_ans4='{"questions": {"que":"what is capital of UP","type":"checkbox","options": [{"opt":"LKo ","ans":"choice", "seq":"A"},{"opt":" KA","ans":"cjoice2","seq":"B"}]}}';

 //var  queArr=[que_ans2,que_ans3,que_ans4];
 var queArr=[];
 
 queArr.push(que_ans2);
 queArr.push(que_ans3);
 queArr.push(que_ans4);
 var obj = jQuery.parseJSON( que_ans2 ); 
 var data = '{"name": "mkyong","age": 30,"address": {"streetAddress": "88 8nd Street","city": "New York"},"phoneNumber": [{"type": "home","number": "111 111-1111"},{"type": "fax","number": "222 222-2222"}]}';
 
//var json = JSON.parse(data);
//var json1 = JSON.parse(que_ans2);

//var queno=queArr[0];
//var jsononj=JSON.parse(queno);
//alert(jsononj.questions.type); 

alert(" que arra :"+queArr);
var count =0;
$('#btnNext').click(function() {   
	

/* $("question_ask").html('<div id=1Que><label for=name>Question1</label><label id="queblock"> he was ver rich but in fights his ll money got expanded and he became poor, so why he became poorr?</label></div>');
document.getElementById("question_ask").innerHTML = '<div id=1Que><label for=name>Question1</label><label id="queblock"> he was ver rich but in fights his ll money got expanded and he became poor, so why he became poorr?</label></div>';

document.getElementById("queoptions").innerHTML ='<span class="label label-info">Enter the answer choices and mark select correct answers</span>'+
'<h1></h1><div class="row" ></div><h1></h1><div class="row" >'+
   '<div class="col-md-1"><input type="radio"/></div>'+
   '<div ><input class="col-md-9" type="text"/></div></div><h1></h1><div class="row" >'+
    '<div class="col-md-1"><input type="radio"/></div>'+
    '<div ><input class="col-md-9" type="text"/></div></div><h1></h1>'+
    '<div class="row" ><div clas s="col-md-1"><input type="radio"/></div><div ><input class="col-md-9" type="text"/></div></div>';	*/
       
var queNo=questionArray[count];    
alert(" D00 :"+queNo);
var jsonObj=JSON.parse(queNo);

alert(jsonObj.questions.que); //88 8nd Street
//alert(json1.questions.options[0].opt); //111 111-1111

alert("type"+jsonObj.questions.type+"  Que :"+jsonObj.questions.que); //88 8nd Street
var quetyepe=jsonObj.questions.type;

$("question_ask").html('<div id=1Que><label for=name>Question1</label><label id="queblock">'+jsonObj.questions.que+'</label></div>');
document.getElementById("question_ask").innerHTML = '<div id=1Que><label for=name>Question1</label><label id="queblock">'+jsonObj.questions.que+'</label></div>';

document.getElementById("queoptions").innerHTML ='<span class="label label-info">Enter the answer choices and mark select correct answers</span>'+
'<h1></h1><div class="row" ></div><h1></h1><div class="row" >'+
   '<div class="col-md-1"><input type="'+quetyepe+'"/></div>'+
   '<div ><input class="col-md-9" type="text"/></div></div><h1></h1><div class="row" >'+
    '<div class="col-md-1"><input type="'+quetyepe+'"/></div>'+
    '<div ><input class="col-md-9" type="text"/></div></div><h1></h1>'+
    '<div class="row" ><div class="col-md-1"><input type="'+quetyepe+'"/></div><div ><input class="col-md-9" type="text"/></div></div>';	
 count++;
 var que1="que1";
 
 $('.item1').css("color", "green");
$('#que_tile_content').append('<a href=#'+count+'>'+que1+'</a>');

 alert("Count :"+count);   		
});
   
    	
    	$('#selectqueopt').on('change', function(){
    		
					 var selected_value = $(this).val();
		             switch (selected_value) { 
		             case 'Multiple choice': 
		            	 $('#chkBoxque').show();
		            	 $('#radiobtnque').hide();
		            	 $('#truefalseque').hide();
		            	 $('#fillinbkankque').hide();
		                 break;
		             case 'Multiple response': 
		            	 $('#chkBoxque').hide();
		            	 $('#radiobtnque').show();
		            	 $('#truefalseque').hide();
		            	 $('#fillinbkankque').hide();
		                 break;
		             case 'yes/no': 
		            	 
		                 break;      
		             case 'true/false':
		            	 $('#chkBoxque').hide();
		         		$('#radiobtnque').hide();
		         		$('#truefalseque').show();
		         		$('#fillinbkankque').hide();
		                 break;
		             case 'fill in the blanks': 
		            	$('#chkBoxque').hide();
		         		$('#radiobtnque').hide();
		         		$('#truefalseque').hide();
		         		$('#fillinbkankque').show();
		                 break;
		             default:
		                 alert('Nobody Wins!');
		         }
			});
    	
    	function defaultDivVisiblity()
    	{
    		$('#queoptions').show();
    		$('#radiobtnque').hide();
    		$('#truefalseque').hide();
    		$('#fillinbkankque').hide();
    		
    	}
    	
    });
    function makeAjaxCall(){
 	   alert("cliecked 01");
      $.ajax({
          url: "test/gettestconfig",
          success:function(response){
          	alert("Success"+response)           
          },
          error:function(jqXhr, textStatus, errorThrown){
              alert(textStatus);
          }
      });    
  } 

    function GetValue(){
        var Contain = "";
        alert("clicked");
        $("#chkBoxque :text").each(function(){
            Contain += $(this).val() + "$";
            alert("value "+Contain);
        });
        alert("vv"+$(queblock).val());
        $('#que_tabledata').last().append('<tr><td><input type=checkbox /></td><td>5</td><td><a href="#" >' +$(queblock).val() +'</a> '+'</td></tr>');
    }
   
   
    </script>
</head>
<body>
	<div class="row">
		<div class="col-md-11">
			<div class="clock" style="margin: 2em;"></div>

			<div class="well">
				<!-- 2nd column -->
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h3 class="panel-title"></h3>
					</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-md-6">

								<div id="timer"></div>
							</div>
							<div class="col-md-6 text-right">
								<button type="button" id="btnPrev" class="btn btn-default">
									<span class="glyphicon glyphicon-plus"></span> Previous
								</button>
								<button type="button" id="btnNext" class="btn btn-default">
									<span class="glyphicon glyphicon-minus"></span> Next
								</button>
							</div>
						</div>
						<ul class="breadcrumb" style="margin-top: 10px;">
							<form role="form">
								<div id="question_ask">
									<div id="1Que">
										<label for="name">Question</label> <label id="queblock">There
											was a kig ,poorr?</label>
									</div>
								</div>
							</form>
						</ul>
						<div id="queoptions">
							<span class="label label-info">Enter the answer choices
								and mark select correct answers</span>
							<h1></h1>
							<div class="row"></div>
							<h1></h1>
							<div class="row">
								<div class="col-md-1">
									<input type="checkbox" />
								</div>
								<div>
									<label class="col-md-6">Not good</label>
								</div>
							</div>
							<h1></h1>
							<div class="row">
								<div class="col-md-1">
									<input type="checkbox" />
								</div>
								<div>
									<label class="col-md-9"> good</label>
								</div>
							</div>
							<h1></h1>
							<div class="row">
								<div class="col-md-1">
									<input type="checkbox" />
								</div>
								<div>
									<label class="col-md-9">very good</label>
								</div>
							</div>
						</div>
						<div></div>
					</div>
				</div>
			</div>
		</div>

		<div id="que_attempt_tbl" class="col-md-1">

			<div class="tile live">
				<div id="que_tile_content" class="tile-content">
					<a class="item1" id="q1" href="#">Q1</a> <a href="#">Q4</a> <a
						href="#">Q1</a> <a href="#">Q2</a> <a href="#">Q3</a> <a href="#">Q4</a>
					<a href="#">Q2</a> <a href="#">Q3</a> <a href="#">Q4</a> <a
						href="#">Q1</a> <a href="#">Q2</a> <a href="#">Q3</a> <a href="#">Q4</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>