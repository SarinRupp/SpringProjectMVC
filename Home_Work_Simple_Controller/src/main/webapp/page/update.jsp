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
	<center><h1>USER  REGISTER</h1></center>
	
		<!-- Form for add new information -->
		
		<div class="col-sm-8 center-block " style="float:none">
		  <div class="panel panel-info">
		    <div class="panel-body">
		    	
		       <form action="${pageContext.request.contextPath}/update1" method="post">
						
						 
						  <div class="form-group" >
							<label>User ID: </label>
							<input type="text" class="form-control" name="id" id="id"   value="${updateId[0].id}"  readonly="readonly">
						</div>  
						<div class="form-group">
							<label>Username: </label>
							<input type="text" class="form-control" name="user_name" id="user_name"  value="${updateId[0].user_name}" placeholder="Username"  >
						</div>
						
						<div class="form-group">
							<label>Email: </label>
							<input type="email" class="form-control" name="email" id="email" value="${updateId[0].email}" placeholder="email" >
						</div>
						
						<div class="form-group">
							<label>Password: </label>
							<input type="password" class="form-control" name="password" id="password" value="${updateId[0].password}" placeholder="password" >
						</div>
						<div class="form-group">
							<label>BirthDate: </label>
							<input type="date" class="form-control" name="birthdate" id="birthdate"  value="${updateId[0].birthdate}" placeholder="birthdate" >
						</div>
						
						<div class="form-group">
							<label>RegisterDate: </label>
							<input type="date" class="form-control" name="registerdate" id="registerdate" value="${updateId[0].registerdate}" placeholder="registerdate" >
						</div>
						<div class="form-group">
							<label>Image: </label>
							<input type="text" class="form-control" name="image" id="image" value="${updateId[0].image}" placeholder="image" >
						</div>						
						<div class="form-group" style="margin-left:20%;">
							<input type="submit" class="btn btn-success" id="update" value="Update">
							<input type="reset" class="btn btn-info" id="clear"  value="Cancel">
							<a class="btn btn-success" href="${pageContext.request.contextPath}">HOME</a>
						</div>
						
		      </form>
		      <%--  <c:forEach  var="element" items='${updateId}'>
		       				<tr>
							<td>${element.id}</td>
							<td>${element.first_name}</td>
							<td>${element.last_name}</td>							
							<td>${element.classroom}</td>
		       </c:forEach> --%>
		    </div>
		   </div>
	    </div>
	    
	    <!-- End of Form for add new information -->
	    
	
	</div>
	<script type="text/javascript">		
	 function deletePost(id) {		 		 
			 $.post("delete", {
	 			id : id	 			 	
	 		}, function(data, status) {
	 			
	 		});
			 window.location.reload(); 
	 	}	
	</script>
</body>
</html>