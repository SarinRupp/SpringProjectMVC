<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Student Information</title>

<script src="${pageContext.request.contextPath}/resources/js/jquery-1.9.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/angular.min.js"></script>

<link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" rel="stylesheet">


<!-- internal style  -->
<style>
 th{text-align: center;}
 @media screen and (max-width: 600px) {
    #tablerepone {
        overflow: scroll;
    }
}
#status,#option{
	text-align: center;
}
#status img{
	width:35px;
	cursor:pointer;	
}
td a{
	margin:10px;
}
</style>


</head>
<body>
	<div class="">
	<center><h1>STUDENT REGISTER</h1></center>
	
		<!-- Form for add new information -->
		
	    
	    <!-- End of Form for add new information -->
	    
		<div class="col-sm-12">
		<div ng-app="myApp" ng-controller="planetController">  
			<div class="panel panel-info">						
				<!-- Div Table for show information -->
				<div class="panel-body"  id="tablerepone" >
				
				<form>
						 <div class="form-group" >
							<label>Student ID: </label>
							<input type="text" class="form-control" name="id" id="id"   readonly="readonly">
						</div>
						<div class="form-group">
							<label>First Name: </label>
							<input type="text" class="form-control" name="first_name" id="first_name" placeholder="first name"  >
						</div>
						
						<div class="form-group">
							<label>Last Name: </label>
							<input type="text" class="form-control" name="last_name" id="last_name" placeholder="last name" >
						</div>
						
						
						<div class="form-group">
							<label>ClassRoom: </label>
							<input type="text" class="form-control" name="classroom" id="classroom" placeholder="classroom" >
						</div>																																							
						
						<div class="form-group" style="margin-left:20%;">
							<input type="button" class="btn btn-success"  value="ADD" id="btnupdate" >
							<input type="reset" class="btn btn-info" id="clear"  value="Cancel">							
						</div>
						
		      </form>
				
			<form class="form-inline pull-right" role="form">  
				 <%-- <div class="form-group"> 
					<a class="btn btn-default btn-sm" href="${pageContext.request.contextPath}/add">
					 <span class="glyphicon glyphicon-plus"></span>
					</a>
				</div>  --%>
				 
				<%-- <span>
						<a href="${pageContext.request.contextPath}/search" class="btn btn-default">
          				<span class="glyphicon glyphicon-search"></span></a>
				</span>--%>
				<div class="form-group">    					
    					<input type="text" class="form-control" id="search">
  				</div>
			</form>
				
				<br/><br/>			                 
					<table id="listcontent" class="table table-striped table-bordered table-hover table-condensed" ></table>
				
				<!-- End of div Table for show information -->
			</div>
			</div>
		    </div>
		</div>
	</div>
	<script type="text/javascript">		
	$(document).ready(function(){
		 var el ="${pageContext.request.contextPath}";	
		/* delete fucntion  */
		$('body').on('click', '.del', function(){			
			var othis=$(this);			   	
				$.ajax({  
			          url:el+"/delete/"+$(this).attr("stuid"),  
			          type:'DELETE',	       
			          success: function(data) {  			    	   			    	 
			    	  othis.parents('tr').remove();
			          console.log("Success..." + data);
			     }}); 
		});
		/* fucntion get data for update  */
		  $('body').on('click', '.update', function(){	
			 // $("#btnupdate").attr("style","display:grid");
			  $("#btnupdate").val("Update");
			var othis=$(this);			   	
				$.ajax({  
			          url:el+"/update/"+othis.attr("stuid"),  
			          type:'get',	       
			          success: function(data) {  
			  			
			        	$("#id").val(data.RESPONSE_DATA[0].id);
			        	$("#first_name").val(data.RESPONSE_DATA[0].first_name);
			        	$("#last_name").val(data.RESPONSE_DATA[0].last_name);
			        	$("#classroom").val(data.RESPONSE_DATA[0].classroom);
			          console.log("Success..." + data);
			     }});  
			     
		}); 
		  /* fucntion get data for update  */
		  $('body').on('click', '.view', function(){	
			 // $("#btnupdate").attr("style","display:none");
			  $("#btnupdate").val("ADD");
			  var othis=$(this);		   	
				$.ajax({  
			          url:el+"/update/"+othis.attr("stuid"),  
			          type:'get',	       
			          success: function(data) {  
			        	 	 $("#id").val(data.RESPONSE_DATA[0].id);
				        	$("#first_name").val(data.RESPONSE_DATA[0].first_name);
				        	$("#last_name").val(data.RESPONSE_DATA[0].last_name);
				        	$("#classroom").val(data.RESPONSE_DATA[0].classroom);
			          console.log("Success..." + data);
			     }}); 
		}); 
		
		  /* fucntion  for update  */
		  $('body').on('click', '#btnupdate', function(){			
			var othis=$(this);
			var id=$("#id").val();
			var f_name=$("#first_name").val();
			var l_name=$("#last_name").val();
			var classroom=$("#classroom").val();
			var JSONObject= {
					"id": id,
		            "first_name":f_name,
		            "last_name":l_name,
		            "classroom":classroom
		    };
			if(othis.val()=="ADD"){
				$.ajax({  
				      url:'http://localhost:8080/WebServiceSpringDemo1/add/',  
				      type:'post',
				      contentType: 'application/json;charset=utf-8', // type of data
//				       dataType: 'JSON',
				      data: JSON.stringify(JSONObject), // make JSON string
//				       crossDomain: true,
				      success: function(data) { 
//				                var jsonData = $.parseJSON(data); //if data is not json
				                list();			
			          	$("#id").val("");
			        	$("#first_name").val("");
			        	$("#last_name").val("");
			        	$("#classroom").val("");
				               console.log("Success..." + data);
				      }}); 
			}
			else{
				$.ajax({  
			          url:el+"/update",  
			          type:'put',	
			          contentType: 'application/json;charset=utf-8', // type of data
			          data: JSON.stringify(JSONObject), // make JSON string
			          success: function(data) {  
			            list();			
			          	$("#id").val("");
			        	$("#first_name").val("");
			        	$("#last_name").val("");
			        	$("#classroom").val("");
			        	othis.val("ADD");
			          console.log("Success..." + data);
			     }});
			}
			
			
				 
		}); 
		
		$('body').on('keyup', '#search', function(){			
			var othis=$(this).val();	
			if(othis==""){
				list();
			}
			else{
				 $.ajax({  
			          url:el+"/search/"+othis,  
			          type:'GET',	  
			         // data: JSON.stringify(JSONObject),
			          //contentType: 'application/json;charset=utf-8',
			          success: function(data) {  
			        $("#listcontent").html(createTable(data));
			          console.log("Success..." + data);
			     }}); 
			}
			    
		});
		
	});
	
	list();	
	function list(){
	 $.ajax({  
        url:'http://localhost:8080/WebServiceSpringDemo1/list.act',  
        type:'get',
        contentType: 'application/json;charset=utf-8', // type of data

       success: function(data) {      
               
               $("#listcontent").html(createTable(data));
               
              console.log("Success..." + data);
     }}); 
     
		}
	
	function createTable(data) {
		var str="";
			str+="<thead><tr>"+
			"<th>ID</th>"+
			"<th>FRIST NAME</th>"+
			"<th>LAST NAME</th>"+
			"<th>CLASSROOM</th>"+
			"<th>ACTION</th>"+
		    "</thead>";
		for (var i = 0; i < data.RESPONSE_DATA.length; i++) {
			str += "<tbody><tr><td>"+ data.RESPONSE_DATA[i].id         + "</td>"+ 
					"<td>"   + data.RESPONSE_DATA[i].first_name + "</td>"+ 
					"<td>"   + data.RESPONSE_DATA[i].last_name  + "</td>"+
					"<td>"   + data.RESPONSE_DATA[i].classroom  + "</td>"+					
					"<td style='width:22%'>"   + actionButton(data.RESPONSE_DATA[i].id)+ 
					"</td></tr></tbody>";										
		}
		return str;
	} 
	function actionButton(id){
		 var str="";
		 
		 str+="<a class='btn btn-default update' stuid="+id+">Update</a>";
		// str+="<a class='btn btn-default update'  href='${pageContext.request.contextPath}/update/"+id+"'>Update</a>";
		 str+="<a class='btn btn-success view' stuid="+id+">View</a>";
		 /* str+="<a class='btn btn-danger' onclick='Del("+id+");'>DELETE</a>"; */
		 str+="<a class='btn btn-danger del'  stuid="+id+">DELETE</a>";
		return str; 
	}
	</script>
</body>
</html>