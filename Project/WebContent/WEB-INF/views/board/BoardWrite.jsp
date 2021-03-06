<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="/common/summernote.jsp"></jsp:include>

<script>

	function addboard() {
		boardform.submit();
	}
	

	
    $(document).ready(function() {
	    $('#summernote').summernote({
	        placeholder: '내용을 입력하세요',
	        tabsize: 2,
	        height: 120,
	        toolbar: [
					['style', ['style']
				],
				['font', 
					['bold', 'underline', 'clear']
				],
		        ['color', 
		        	['color']
		        ],
		        ['para', 
		        	['ul', 'ol', 'paragraph']
		        ],
		        ['table', 
		        	['table']
		        ],
		        ['insert', 
		        	['link', 'picture', 'video']
		        ],
		        ['view', 
		        	['fullscreen', 'codeview', 'help']
		        ]
	        ]
	      });

    });


</script>



</head>

<body class="wrap">
	<jsp:include page="/common/top.jsp"></jsp:include>
	<jsp:include page="/common/left.jsp"></jsp:include>
	<jsp:include page="/common/login.jsp"></jsp:include>
	<c:set var="userid" value="${sessionScope.userid}" />
	<!-- 컨텐츠 -->
	<div class="wrapper">
		<!-- 전체 게시판 -->
		<div class="row">
			<div class="col-13 col-m-12 col-sm-12">
				<div class="card">
					<div class="card-header">
						<h1>글쓰기</h1>
						<i class="fas fa-ellipsis-h"></i>
					</div>
					<div class="card-content">

						<form action="./BoardAddService.bo" method="post"
							enctype="multipart/form-data" id="boardform" name="boardform">
							<input type="hidden" name="id" value="${userid}">
							<table style="word-break: break-all; table-layout: fixed;">

								<tr>
									<td>
										<div align="center">글쓴이</div>
									</td>
									<td colspan="4" class="leftAlign">${userid}</td>
								</tr>
								<tr>
									<td>
										<div align="center">카테고리</div>
									</td>
									<td colspan="4" class="leftAlign"><select id="english"
										name="boardName">
											<option value="Grammar">Grammar</option>
											<option value="Reading">Reading</option>
											<option value="Listening">Listening</option>
									</select></td>
								</tr>
								<tr>
									<td>
										<div align="center">제 목</div>
									</td>
									<td colspan="4">
									<input id="contentTitle" name="contentTitle" type="text" 
									size="50" maxlength="100" value="" style="width: 100%;" /></td>

								</tr>
								<tr>
									<td>
										<div align="center">내 용</div>
									</td>
									<td colspan="4" class="leftAlign">
									<textarea id="summernote" name="content"
											style="resize: vertical;"></textarea>
								</tr>
								<tr>
									<td>
										<div align="center">파일 첨부</div>
									</td>
									<td colspan="4" class="leftAlign">
									<input name="filename" type="file" /></td>
								</tr>

								<tr bgcolor="cccccc">
									<td colspan="5" style="height: 1px;"></td>
								</tr>
								<tr>
									<td colspan="5">&nbsp;</td>
								</tr>
								<tr align="center" valign="middle">
									<td colspan="5"><input type="submit" value="등록"> 
									<!-- <a href="javascript:addboard()">[등록]</a>&nbsp;&nbsp; -->
									<a href="javascript:history.go(-1)"><button>뒤로</button></a></td>
								</tr>
							</table>
						</form>
					</div>
				</div>
			</div>
			<!-- //전체 게시판 -->
		</div>
		<!-- //컨텐츠 -->
	</div>


	<jsp:include page="/common/footer.jsp"></jsp:include>
	<jsp:include page="/common/script.jsp"></jsp:include>
</body>
</html>