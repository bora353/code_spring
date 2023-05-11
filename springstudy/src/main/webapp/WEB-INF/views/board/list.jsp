<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- 부트스트랩 -->
<%@include file="../includes/header.jsp" %>



                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">게시판</h1>
                    <p class="mb-4">눈누난나 스프링으로 게시판 만들기 </p>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h5 class="m-0 font-weight-bold text-primary">내가 만든 게시판
                            <button id='regBtn' type="button" class="btn btn-xs btn-primary float-right">Register</button>
                            </h5>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>#번호</th>
                                            <th>제목</th>
                                            <th>작성자</th>
                                            <th>작성일</th>
                                            <th>수정일</th>
                                        </tr>
                                    </thead>
                                    <tbody>
	                                    <c:forEach var="board" items="${list}">
                                        <tr>
                                            <td>${board.bno}</td>
                                            <td>
                                            <a href='/board/get?bno=${board.bno}'>
                                            ${board.title}
                                            </a>
                                            </td>
                                            <td>${board.writer}</td>
                                            <td>
                                            	<fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate}" />
                                          	</td>
                                            <td>
                                            	<fmt:formatDate pattern="yyyy-MM-dd" value="${board.updatedate}" />
                                            </td>
                                        </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->
          

<!-- Modal-->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="myModalLabel">Modal title</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-hidden="true">
                    &times;</button>
                </div>
                <div class="modal-body">처리 완료</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Close</button>
                    <button class="btn btn-primary" type="button" >Save changes</button>
                </div>
            </div>
        </div>
    </div>     
          
          
            
<script type="text/javascript">

$(document).ready(function(){

	/* 모달 설정 */
	var result = '${result}';
	
	checkModal(result);
	
	history.replaceState({}, null, null);
	
	function checkModal(result){
		
		if(result === '' || history.state){
			return;
		}
		
		if(parseInt(result) > 0 ) {
			$(".modal-body").html("게시글 " + parseInt(result) + " 번이 등록되었습니다!");
		}
			$("#myModal").modal("show");
	}
	
	/* 등록버튼 */
	$("#regBtn").on("click", function(){
		self.location = "/board/register";
	})
	
});




</script>    


        
            
<%@include file="../includes/footer.jsp" %>
