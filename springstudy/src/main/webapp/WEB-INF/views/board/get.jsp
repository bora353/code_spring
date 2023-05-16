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
					
					<input type='hidden' name='keyword' value='${cri.keyword}' >
					<input type='hidden' name='type' value='${cri.type}' >
				</form>
		</div>
		</div>
	</div>
</div>


<div class='row'>
	<div class="col-lg-12">
		<div class="card">
			<div class="card-header">
			<i class="fa fa-comments fa-fw"></i>Reply
			</div>
		
		
			<div class="card-body">
				<ul class="chat">
					<li class="left clearfix" data-rno='12'>
						<div>
							<div class="header">
								<strong class="primary-font">user00</strong>
								<small class="float-right text-muted">2023-05-16 17:08</small>
							</div>
							<p>good job!</p>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</div>
</div>



<script type="text/javascript" src="/resources/js/reply.js"></script>

<script>
$(document).ready(function(){
	
	console.log("===========");
	console.log("JS TEST");
	
	var bnoValue = '<c:out value="${board.bno}"/>';
	
	
 	//for replyService add test
 	replyService.add(
		{reply:"JS TEST", replyer:"tester", bno:bnoValue}
		,
		function(result){
			alert("RESULT : " + result);
		}
	);  
 	
 	
	//reply List Test
	replyService.getList({bno:bnoValue, page:1}, function(list){
		
		for(var i = 0, len = list.length||0; i < len; i++){
			console.log(list[i]);
		}
	});
		
		
	//23번 댓글 삭제 테스트
	replyService.remove(23, function(count){
	
		console.log(count);
		
		if(count === "success"){
			alert("REMOVED");
		}
	}, function(err){
		alert('ERROR....');
	});
 	
	
	//22번 댓글 수정
	replyService.update({
		rno : 22,
		bno : bnoValue,
		reply : "Modified Reply..."
	}, function(result){
		
		alert("수정 완료...");
	});
 	
	
	
	// get 
	replyService.get(10, function(data)){
		console.log(data);
	});
 	
});
	
</script>





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