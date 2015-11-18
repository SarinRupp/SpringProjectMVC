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

 <table class="table table-striped table-bordered table-hover table-condensed" >
							<thead>
							
							<tr>							
							
								<th>ID</th>
								<th>USER NAME</th>
								<th>EMAIL</th>								
								<th>PASSWORD</th>	
								<th>BIRTHDATE</th>
								<th>REGISTERDATE</th>
								<th>IMAGE</th>
								<th>ACTION</th>															
							</tr>
							</thead>
							<tbody >
						 <c:forEach  var="element" items='${data}'>
							<tr>
							<td>${element.id}</td>
							<td>${element.user_name}</td>
							<td>${element.email}</td>							
							<td>${element.password}</td>
							<td>${element.birthdate}</td>
							<td>${element.registerdate}</td>
							<td>${element.image}</td>
								 <td id="option">					
									<a class="btn btn-default" href="${pageContext.request.contextPath}/update/${element.id}">Update</a>
									<!-- <span><button id="btnedit" name="btnedit" class="btn btn-success">View</button></span> -->
									<a class="btn btn-success" href="${pageContext.request.contextPath}/view/${element.id}">View</a>
									<%-- <span><input type="button"  value="Delete" id="btndelete" name="btndelete" class="btn btn-danger" onclick="deletePost(${element.id})"/></span> --%>
									<a class="btn btn-danger" href="${pageContext.request.contextPath}/delete/${element.id}">DELETE</a>
								</td>
							</tr>
					</c:forEach>								  
							</tbody>
					</table> 
	<div id="pagination">
    <c:url value="/list" var="prev">
        <c:param name="page" value="${page-1}"/>
    </c:url>
     <ul class="pagination"> 
    <c:if test="${page > 1}">
        <li ><a href="<c:out value="${prev}" />" class="pn prev">Prev</a></li>
    </c:if>

    <c:forEach begin="1" end="${maxPages}" step="1" varStatus="i">
        <c:choose>
            <c:when test="${page == i.index}">
                <li class="active"><span>${i.index}</span></li>
            </c:when>
            <c:otherwise>
                <c:url value="/list" var="url">
                    <c:param name="page" value="${i.index}"/>
                </c:url>
                <li ><a   href='<c:out value="${url}" />'>${i.index}</a></li>
            </c:otherwise>
        </c:choose>
    </c:forEach>
    <c:url value="/list" var="next">
        <c:param name="page" value="${page + 1}"/>
    </c:url>
    <c:if test="${page + 1 <= maxPages}">
        <li><a href='<c:out value="${next}" />' class="pn next">Next</a></li>
    </c:if>
    </ul> 
</div>
	
</body>
</html>