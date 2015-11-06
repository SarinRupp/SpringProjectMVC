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
				<span>
				<a class="btn btn-success" href="${pageContext.request.contextPath}/add">ADD</a>
				</span>
				<span>
					<a href="${pageContext.request.contextPath}/search" class="btn btn-default">
          				<span class="glyphicon glyphicon-search"></span></a>
				</span>
				<h1>${msg}</h1>
				<br/><br/>			                 
					<table class="table table-striped table-bordered table-hover table-condensed" >
							<thead>
							
							<tr>							
							
								<th>ID</th>
								<th>FRIST NAME</th>
								<th>LASTNAME</th>								
								<th>CLASSROOM</th>	
								<th>ACTIOIN</th>															
							</tr>
							</thead>
							<tbody id="listcontent" >
							
						 <%-- <c:forEach  var="element" items='${list}'>
							<tr>
							<td>${element.id}</td>
							<td>${element.first_name}</td>
							<td>${element.last_name}</td>							
							<td>${element.classroom}</td>
								 <td id="option">					
									<a class="btn btn-default" href="${pageContext.request.contextPath}/update/${element.id}">Update</a>
									<!-- <span><button id="btnedit" name="btnedit" class="btn btn-success">View</button></span> -->
									<a class="btn btn-success" href="${pageContext.request.contextPath}/view/${element.id}">View</a>
									<span><input type="button"  value="Delete" id="btndelete" name="btndelete" class="btn btn-danger" onclick="deletePost(${element.id})"/></span>
									<a class="btn btn-danger" href="${pageContext.request.contextPath}/delete/${element.id}">DELETE</a>
								</td>
							</tr>
					</c:forEach>		 --%>						  
							</tbody>
					</table>
				
				<!-- End of div Table for show information -->
			</div>
			</div>
		    </div>
		</div>
	</div>
	<script type="text/javascript">		
	$(document).ready(function(){
		
	});
	list();
	function list(){
	 $.ajax({  
     url:'http://localhost:8080/WebServiceSpringDemo1/list.act',  
     type:'get',
     contentType: 'application/json;charset=utf-8', // type of data
//      dataType: 'JSON',
     //data: JSON.stringify(JSONObject), // make JSON string
//      crossDomain: true,
     success: function(data) { 
//               var jsonData = $.parseJSON(data); //if data is not json
               //alert(data.RESPONSE_DATA[0].first_name);
               $("#listcontent").html(createTable(data));
              console.log("Success..." + data);
     }}); 
     
		}
	
	function createTable(data) {
		var str="";
		for (var i = 0; i < data.RESPONSE_DATA.length; i++) {
			str += "<tr>" + "<td id=studid" + i + ">" + data.RESPONSE_DATA[i].id + "</td>"
					+ "<td>" + data.RESPONSE_DATA[i].first_name + "</td>" + "<td>"
					+data.RESPONSE_DATA[i].last_name + "</td>" + "<td>" + data.RESPONSE_DATA[i].classroom
					+"</td></tr>";
					/* + "</td>" + "<td>" + data[i].stuclass + "</td>" + "<td style='text-align:center;'>"
					+ changestatus(data[i].stustatus,data[i].stuid) + "</td><td style='text-align:center;'>"+ actionbutton(data[i].stuid, data[i].stuname,data[i].stugender,data[i].stuuniversity,data[i].stuclass,data[i].stustatus) +"</td></tr>"; */
		}
		return str;
	} 
	</script>
</body>
</html>