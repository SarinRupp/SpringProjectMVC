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
		
		<div class="col-sm-8 center-block " style="float:none">
		  <div class="panel panel-info">
		    <div class="panel-body">
		       <form action="add" method="post">
						<!-- <div class="form-group" >
							<label>Student ID: </label>
							<input type="text" class="form-control" name="id" id="id"  >
						</div> -->
						<div class="form-group">
							<label>First Name: </label>
							<input type="text" class="form-control" name="first_name" id="first_name" placeholder="first name" >
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
							<input type="submit" class="btn btn-success" id="add"  name="add"  value="Add">
							<input type="reset" class="btn btn-info" id="clear" name="clear"  value="Cancel"/>
							<a class="btn btn-success" href="${pageContext.request.contextPath}">HOME</a>
						</div>
						
		      </form>
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