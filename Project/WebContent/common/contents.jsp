<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 컨텐츠 -->
<div class="wrapper">
	<!-- 오늘의 회화 -->
	<div class="row">
		<div class="col-13 col-m-12 col-sm-12">
			<div class="card">
				<div class="card-header">
					<h1>오늘의 회화</h1>
					<!-- 오늘의 회화 드롭다운 메뉴 -->
						<c:if test="${sessionScope.userid == 'admin' }">
						<div id="today-dropdown">
							<div class="today-menu">
								<i class="fas fa-ellipsis-h" id="todayicon"></i>
							</div>
							<div class="dropdown" style="display: none">
								<ul>
									<li class="today-link"><a href="#" class="fas fa-pencil-alt" id="contentWrite">&nbsp&nbsp글쓰기</i></a></li>
									<li class="today-link"><a href="#" class="fas fa-clipboard-list" id="contentList">&nbsp&nbsp목록보기</a></li>
									<li class="today-link"><a href="#" class="fas fa-clipboard-list" id="contentMain">&nbsp&nbsp돌아가기</a></li>
								</ul>
							</div>							
						</div>
						</c:if>
						<!-- //오늘의 회화 드롭다운 메뉴 -->
					
				</div>
				<div class="card-content" id="TimeLine">
					<div class="card-content" id="TimeLineContent">
						<!-- <h3>Nothing can be so amusingly arrogant as a young man who has just discovered an old idea and thinks it is his own.</h3>
						<p class="todayenglishko">"오래된 생각을 이제 막 발견하고 그것이 자기 것이라고 생각하는 젊은 사내만큼 유쾌하게 거만한 존재는 없다."</p> -->
					</div>
					</div>
			</div>
		</div>
	</div>
	<!-- //오늘의 회화 -->

	<!-- 카테고리 바로가기 -->
	<div class="row">
		<div class="col-4 col-m-6 col-sm-6">
			<div class="card">
				<a href="./BoardList_Grammar.cate">
					<div class="counter diary">
						<h1>Grammar</h1>
						<i class="fas fa-ellipsis-h"></i>
					</div>
				</a>
			</div>
		</div>

		<div class="col-4 col-m-6 col-sm-6">
			<div class="card">
				<a href="./BoardList_Reading.cate">
					<div class="counter certification">
						<h1>Reading</h1>
						<i class="fas fa-ellipsis-h"></i>
					</div>
				</a>
			</div>
		</div>

		<div class="col-4 col-m-6 col-sm-6">
			<div class="card">
				<a href="./BoardList_Listening.cate">
					<div class="counter qna">
						<h1>Listening</h1>
						<i class="fas fa-ellipsis-h"></i>
					</div>
				</a>
			</div>
		</div>

	</div>
	<!-- //카테고리 바로가기 -->

	<!-- 전체 게시판 -->
	<div class="row">
		<div class="col-8 col-m-12 col-sm-12">
			<div class="card">
				<div class="card-header">
					<h1>전체게시판</h1>
					<a href="./BoardList.bo">
						<i class="fas fa-ellipsis-h"></i>
					</a>

				</div>
				<div class="card-content">
					<table>
						<thead>
							<tr>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="board" items="${requestScope.boardlist}"
								varStatus="status">
								<tr>
									<td class="leftAlign">
										<c:choose>
											<c:when test="${board.depth != 0}">
												<c:forEach var="depth" begin="0" end="${(board.depth)*2}">
													&nbsp;
												</c:forEach>
													▶
											</c:when>
											<c:otherwise>
													
											</c:otherwise>
										</c:choose>
										<a href="./BoardDetailService.bo?num=${board.contentNumber}">
											${board.contentTitle}
										</a>
									</td>
									<td>${board.id}</td>
									<td>${board.reportingDate}</td>
								</tr>
							</c:forEach>


						</tbody>
					</table>
				</div>
			</div>
		</div>
		<!-- //전체 게시판 -->

		<!-- 통계 -->
		<div class="col-4 col-m-12 col-sm-12">
			<div class="card">
				<div class="card-header">
					<h1>통계</h1>
					<i class="fas fa-ellipsis-h"></i>
				</div>

				<div class="card-content">
					<div class="progress-wrapper">
						<p>
							독해 <span class="float-right">20%</span>
						</p>
						<div class="progress">
							<div class="reading" style="width: 20%"></div>
						</div>
					</div>

					<div class="progress-wrapper">
						<p>
							문법 <span class="float-right">60%</span>
						</p>
						<div class="progress">
							<div class="grammar" style="width: 60%"></div>
						</div>
					</div>

					<div class="progress-wrapper">
						<p>
							회화 <span class="float-right">40%</span>
						</p>
						<div class="progress">
							<div class="conversation" style="width: 40%"></div>
						</div>
					</div>

					<div class="progress-wrapper">
						<p>
							단어 <span class="float-right">50%</span>
						</p>
						<div class="progress">
							<div class="word" style="width: 50%"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- //통계 -->
	</div>


	<!-- 달력 -->
	<div class="row">
	<div class="col-13 col-m-12 col-sm-12">
		<div class="card">
			<div class="card-header" >
				<h1>
					오늘의 단어퀴즈
				</h1>
				<i class="fas fa-ellipsis-h" ></i>
				
			</div>
			<div class="card-content">
			<div id="game"></div>
		</div>
	</div>
</div>
	<!-- 달력 -->
</div>
<!-- //컨텐츠 -->
