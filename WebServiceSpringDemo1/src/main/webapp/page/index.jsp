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
			<form class="form-inline pull-right" role="form">  
				 <div class="form-group"> 
					<a class="btn btn-default btn-sm" href="${pageContext.request.contextPath}/add">
					 <span class="glyphicon glyphicon-plus"></span>
					</a>
				</div> 
				 
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
		$('body').on('change', '#search', function(){			
			var othis=$(this).val();	
			var JSONObject= {
		            "first_name":othis	            
		    };
				 $.ajax({  
			          url:el+"/search/",  
			          type:'POST',	  
			          data: JSON.stringify(JSONObject),
			          contentType: 'application/json;charset=utf-8',
			          success: function(data) {  
			        	
			          console.log("Success..." + data);
			     }});  
			    
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
		 
		 str+="<a class='btn btn-default' href='${pageContext.request.contextPath}/update/"+id+"'>Update</a>";		
		 str+="<a class='btn btn-success' href='${pageContext.request.contextPath}/view/"+id+"'>View</a>";
		 /* str+="<a class='btn btn-danger' onclick='Del("+id+");'>DELETE</a>"; */
		 str+="<a class='btn btn-danger del'  stuid="+id+">DELETE</a>";
		return str; 
	}
	</script>
</body>
</html>