<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- 부트스트랩 -->
<%@include file="../includes/header2.jsp" %>

<link rel="stylesheet" type="text/css" href="resources/mycss.css" />




<div class="row">
	<div class="col-lg-12 d-flex justify-content-center">
		<h1 class="page-header" style="color:#00498c">Board Modify Page</h1>
	</div>
</div>


<div class="row">
	<div class="col-lg-10" style="float:none; margin:0 auto;">
	
		<div class="panel panel-default">
		<!-- <div class="panel-heading">Board Register</div> -->
		<div class="panel-body">
		
			<form action="/board/modify" method="post" id="myform">
				<div class="form-group">
				<label style="color:tomato">bno</label> 
				<input class="form-control" name="bno" value="${board.bno}" readonly="readonly">
				</div>
				<div class="form-group">
				<label style="color:tomato">Title</label> 
				<input class="form-control" name="title" value="${board.title}" >
				</div>
				<div class="form-group">
				<label style="color:tomato">Text area</label> 
				<textarea class="form-control" rows="5" name="content" >${board.content}</textarea>
				</div>
				<div class="form-group">
				<label style="color:tomato">Writer</label> 
				<input class="form-control" name="writer" value="${board.writer}" readonly="readonly">
				</div>
				<div class="form-group">
				<input type="hidden" class="form-control" name="regdate" 
				value='<fmt:formatDate pattern = "yyyy/MM/dd" value = "${board.regdate}" />' 
				readonly="readonly">
				</div>
				<div class="form-group">
				<input type="hidden" class="form-control" name="updatedate" 
				value='<fmt:formatDate pattern = "yyyy/MM/dd" value = "${board.updatedate}" />'
				readonly="readonly">
				</div>
				
				
				
			<!-- 페이징처리, 검색처리  -->
					<input type='hidden' name='pageNum' value='${cri.pageNum}'>
					<input type='hidden' name='amount' value='${cri.amount}'>
					
					<input type='hidden' name='type' value='${cri.type}'>
					<input type='hidden' name='keyword' value='${cri.keyword}'>
			<!--  -->					
				
				
				
				<div style="text-align:center;">
				<button type="submit" data-oper='modify' class="btn btn-primary">Modify</button>
				<button type="submit" data-oper='remove' class="btn btn-danger">Remove</button>
				<button type="submit" data-oper='list' class="btn btn-info">List</button>
				</div>
			</form>
			
			
			
				
				
		</div>
		</div>
	</div>
</div>



<script type="text/javascript">
$(document).ready(function(){
	
	var form = $("#myform");
	
	$('button').on("click", function(e){
		
		e.preventDefault();  //submit 처리되는것 막아
		
		var operation = $(this).data("oper");
		
		console.log(operation);
		
		if(operation === 'remove'){
			form.attr("action", "/board/remove");
		} else if(operation === 'list'){
			form.attr("action", "/board/list").attr("method","get");
			var pageNumTag = $("input[name='pageNum']").clone();
			var amountTag = $("input[name='amount']").clone();
			var keywordTag = $("input[name='keyword']").clone();
			var typeTag = $("input[name='type']").clone();
			
			form.empty();
			form.append(pageNumTag);
			form.append(amountTag);
			form.append(keywordTag);
			form.append(typeTag);
			//self.location = "/board/list";
			//return;
		}
		form.submit();
		
	});
	
	
	
	
});

</script>


<%@include file="../includes/footer.jsp" %>