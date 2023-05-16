<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- 부트스트랩 -->
<%@include file="../includes/header2.jsp" %>

<link rel="stylesheet" type="text/css" href="resources/mycss.css" />


<div class="row">
	<div class="col-lg-12 d-flex justify-content-center">
		<h1 class="page-header" style="color:#00498c">Board Read</h1>
	</div>
</div>


<div class="row">
	<div class="col-lg-10" style="float:none; margin:0 auto;">
	
		<div class="panel panel-default">
		<!-- <div class="panel-heading">Board Register</div> -->
		<div class="panel-body">
				<div class="form-group">
				<label style="color:tomato">bno</label> 
				<input class="form-control" name="bno" value="${board.bno}" readonly="readonly">
				</div>
				<div class="form-group">
				<label style="color:tomato">Title</label> 
				<input class="form-control" name="title" value="${board.title}" readonly="readonly">
				</div>
				<div class="form-group">
				<label style="color:tomato">Text area</label> 
				<textarea class="form-control" rows="5" name="content" readonly="readonly">${board.content}</textarea>
				</div>
				<div class="form-group">
				<label style="color:tomato">Writer</label> 
				<input class="form-control" name="writer" value="${board.writer}" readonly="readonly">
				</div>
				<div style="text-align:center;">
				<button data-oper='modify' class="btn btn-primary"
<%-- onclick="location.href='/board/modify?bno=${board.bno}'" --%>>Modify</button>
				<button data-oper='list' class="btn btn-info"
<%-- onclick="location.href='/board/list'" --%>>List</button>
				</div>
				
				<form id='operForm' action="/board/modify" method="get">
					<input type='hidden' id='bno' name='bno' value="${board.bno}">
					<input type='hidden' name='pageNum' value="${cri.pageNum}">
					<input type='hidden' name='amount' value="${cri.amount}">
				</form>
		</div>
		</div>
	</div>
</div>

<script>
$(document).ready(function(){
	
	var oper = $("#operForm");
	
	$("button[data-oper='modify']").on("click", function(e){
		oper.attr("action", "/board/modify").submit();
	});
	
	$("button[data-oper='list']").on("click", function(e){
		oper.find("#bno").remove();
		oper.attr("action", "/board/list");
		oper.submit();
	});
	
});

</script>


<%@include file="../includes/footer.jsp" %>