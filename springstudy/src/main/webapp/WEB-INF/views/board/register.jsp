<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- 부트스트랩 -->
<%@include file="../includes/header2.jsp" %>

<link rel="stylesheet" type="text/css" href="resources/mycss.css" />




<div class="row">
	<div class="col-lg-12 d-flex justify-content-center">
		<h1 class="page-header" style="color:#00498c">Board Register</h1>
	</div>
</div>


<div class="row">
	<div class="col-lg-10" style="float:none; margin:0 auto;">
	
		<div class="panel panel-default">
		<!-- <div class="panel-heading">Board Register</div> -->
		<div class="panel-body">
			<form rol="form" action="/board/register" method="post">
				<div class="form-group">
				<label style="color:tomato">Title</label> <input class="form-control" name="title" >
				</div>
				<div class="form-group">
				<label style="color:tomato">Text area</label> <textarea class="form-control" rows="5" name="content"></textarea>
				</div>
				<div class="form-group">
				<label style="color:tomato">Writer</label> <input class="form-control" name="writer">
				</div>
				<div style="text-align:center;">
				<button type="submit" class="btn btn-primary">Submit Button</button>
				<button type="reset" class="btn btn-danger">Reset Button</button>
				</div>
			</form>
		</div>
		</div>
	</div>
</div>


<%@include file="../includes/footer.jsp" %>