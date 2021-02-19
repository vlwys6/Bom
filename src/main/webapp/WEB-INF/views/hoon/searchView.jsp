<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>BOM</title>

<!-- Bootstrap core CSS -->
<link href="/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="/css/simple-sidebar.css" rel="stylesheet">

<!-- Bootstrap core JavaScript -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
<script src="/js/jquery.min.js"></script>
<script src="/js/bootstrap.bundle.min.js"></script>
<script src="/js/bootstrap.bundle.js"></script>
<style>
.dropdown-toggle.caret-off::after {
	display: none;
}

ul li {
	margin-left: 120px;
	margin-right: 80px;
}
</style>
</head>

<body>

	<div class="d-flex" id="wrapper">

		<!-- Sidebar -->
		<div class="border-right sidebar-fixed-top" id="sidebar-wrapper">
			<div class="sidebar-heading" align="center">
				<img src="/img/logo2.jpg" width="150" height="150">
			</div>
			<div class="list-group list-group-flush">
				<a href="#" class="list-group-item list-group-item-action"> <img
					src="/img/home.svg" width="15" height="15"> 타임라인
				</a> <a href="explore" class="list-group-item list-group-item-action">
					<img src="/img/search.svg" width="15" height="15"> 검색하기
				</a> <a href="#" class="list-group-item list-group-item-action"> <img
					src="/img/bell.svg" width="15" height="15"> 알림 <span
					class="badge badge-success">1</span>
				</a> <a href="#" class="list-group-item list-group-item-action"> <img
					src="/img/send.svg" width="15" height="15"> 쪽지
				</a> <a href="#" class="list-group-item list-group-item-action"> <img
					src="/img/bookmark.svg" width="15" height="15"> 북마크
				</a> <a href="#" class="list-group-item list-group-item-action"> <img
					src="/img/user.svg" width="15" height="15"> 프로필
				</a> <a href="#" class="list-group-item list-group-item-action"> <img
					src="/img/more.svg" width="15" height="15"> 더보기
				</a> <a href="#" class="list-group-item list-group-item-action">
					<button type="button" class="btn btn-outline-success">
						<img src="/img/write.svg" width="15" height="15"> 글 쓰기
					</button>
				</a>
				<div class="card">
					<div class="card-body">
						<img src="/img/teemo.jpg" class="rounded-circle" width="50"
							width="50"> <a class="card-title text-dark">닉네임</a> <a
							class="card-subtitle mb-2 text-muted">@atid</a>
					</div>
					<button type="button" class="btn btn-success">로그아웃</button>
				</div>
			</div>
		</div>

		<!-- /#sidebar-wrapper -->

		<!-- Page Content -->
		<div id="page-content-wrapper">
			<nav
				class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
				<button class="btn btn-success" id="menu-toggle">←</button>
			</nav>
			<div class="container-fluid">
				<form class="well form-search" action="hoon/searchView">
					<div class="input-group flex-nowrap">
						<div class="input-group-prepend">
							<span class="input-group-text" id="addon-wrapping"><img
								src="/img/search.svg" width="15" height="15"> </span>
						</div>
						<input type="text" class="form-control" placeholder="Bom search"
							aria-label="Username" aria-describedby="addon-wrapping">
					</div>
				</form>
				<p>
					<!--글 정렬-->
				<ul class="nav nav-tabs" id="myTab" role="tablist">
					<li class="nav-item" role="presentation"><a
						class="nav-link active" id="home-tab" data-toggle="tab"
						href="#fame" role="tab" aria-controls="fame" aria-selected="true">인기</a>
					</li>

					<li class="nav-item" role="presentation"><a class="nav-link"
						id="profile-tab" data-toggle="tab" href="#user" role="tab"
						aria-controls="user" aria-selected="false">사용자</a></li>

					<li class="nav-item" role="presentation"><a class="nav-link"
						id="contact-tab" data-toggle="tab" href="#new" role="tab"
						aria-controls="new" aria-selected="false">최신글</a></li>

					<li class="nav-item" role="presentation"><a class="nav-link"
						id="contact-tab" data-toggle="tab" href="#contact" role="tab"
						aria-controls="photo" aria-selected="false">사진</a></li>

					<li class="nav-item" role="presentation"><a class="nav-link"
						id="contact-tab" data-toggle="tab" href="#contact" role="tab"
						aria-controls="video" aria-selected="false">동영상</a></li>
				</ul>
				<div class="tab-content" id="myTabContent">
					<!-- 인기  -->
					<div class="tab-pane fade show active" id="fame" role="tabpanel"
						aria-labelledby="home-tab">
						<c:forEach var="junghun" items="${listSearch }">
							<div class="card">
								<div class="card-body">
									<button type="button" class="btn btn-light float-right">⋯</button>
									<img src="/img/teemo.jpg" class="rounded-circle" width="50"
										width="50"> <a class="card-title text-dark">${junghun.uNickName}</a>
									<a class="card-subtitle mb-2 text-muted">${junghun.uatId}</a> <a
										class="card-subtitle mb-2 text-muted">${junghun.btmpsavtime }</a>
									<a href="#" class="card-text" style="margin-top: 10px;">${junghun.bcontent }</a>
									<div align="center">
										<div class="btn-group col-md-12" role="group"
											aria-label="Button group with nested dropdown">
											<button type="button"
												class="btn btn-secondary mr-3 btn-light"
												data-toggle="tooltip" data-placement="top" title="답글">
												<img src="/img/speech-bubble.svg" width="20" height="20">
											</button>
											<button type="button"
												class="btn btn-secondary btn-light mr-3"
												data-toggle="tooltip" data-placement="top" title="스크랩 or 인용">
												<img src="/img/bring.svg" width="20" height="20">
											</button>
											<button type="button"
												class="btn btn-secondary btn-light mr-3"
												data-toggle="tooltip" data-placement="top" title="좋아요">
												<img src="/img/heart.svg" width="20" height="20">
											</button>
											<button type="button"
												class="btn btn-secondary btn-light mr-3 dropdown-toggle caret-off"
												data-toggle="dropdown" aria-haspopup="true"
												aria-expanded="false">
												<img src="/img/share.svg" width="20" height="20">
											</button>
											<div class="dropdown-menu">
												<a class="dropdown-item" href="#">북마크 추가/삭제</a> <a
													class="dropdown-item" href="#">URL담아가기</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
					<!-- 사용자 -->
					<div class="tab-pane fade" id="user" role="tabpanel"
						aria-labelledby="profile-tab">
						<c:forEach var="junghun" items="${listUser }">
							<div class="card">
								<div class="card-body">
									<button type="button" class="btn btn-light float-right">⋯</button>
									<div class="card-body"
										style="font-size: 1.2rem; padding: 10px;">
										<img src="/img/teemo.jpg" class="rounded-circle" width="40"
											height="40"> <a class="card-title text-dark">${junghun.uNickName}</a>
										<a class="card-subtitle mb-2 text-muted">@${junghun.uatId}</a>
										<button type="button"
											class="btn btn-outline-success btn-sm float-right"
											style="font-size: 0.8rem;">팔로우</button>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
					<!-- 최신 -->
					<div class="tab-pane fade" id="new" role="tabpanel"
						aria-labelledby="contact-tab">
						<c:forEach var="junghun" items="${listNew }">
							<div class="card">
								<div class="card-body">
									<button type="button" class="btn btn-light float-right">⋯</button>
									<img src="/img/teemo.jpg" class="rounded-circle" width="50"
										width="50"> <a class="card-title text-dark">${junghun.uNickName}</a>
									<a class="card-subtitle mb-2 text-muted">${junghun.uatId}</a> <a
										class="card-subtitle mb-2 text-muted">${junghun.btmpsavtime }</a>
									<a href="#" class="card-text" style="margin-top: 10px;">${junghun.bcontent }</a>
									<div align="center">
										<div class="btn-group col-md-12" role="group"
											aria-label="Button group with nested dropdown">
											<button type="button"
												class="btn btn-secondary mr-3 btn-light"
												data-toggle="tooltip" data-placement="top" title="답글">
												<img src="/img/speech-bubble.svg" width="20" height="20">
											</button>
											<button type="button"
												class="btn btn-secondary btn-light mr-3"
												data-toggle="tooltip" data-placement="top" title="스크랩 or 인용">
												<img src="/img/bring.svg" width="20" height="20">
											</button>
											<button type="button"
												class="btn btn-secondary btn-light mr-3"
												data-toggle="tooltip" data-placement="top" title="좋아요">
												<img src="/img/heart.svg" width="20" height="20">
											</button>
											<button type="button"
												class="btn btn-secondary btn-light mr-3 dropdown-toggle caret-off"
												data-toggle="dropdown" aria-haspopup="true"
												aria-expanded="false">
												<img src="/img/share.svg" width="20" height="20">
											</button>
											<div class="dropdown-menu">
												<a class="dropdown-item" href="#">북마크 추가/삭제</a> <a
													class="dropdown-item" href="#">URL담아가기</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
					<!-- 사진 -->
					<div class="tab-pane fade" id="photo" role="tabpanel"
						aria-labelledby="contact-tab">
						
					</div>
					<!-- 동영상 -->
					<div class="tab-pane fade" id="video" role="tabpanel"
						aria-labelledby="contact-tab">...</div>
				</div>
			</div>
		</div>
	</div>
	<!-- /#page-content-wrapper -->

	<!-- 오른쪽 사이드바 -->
	<div class="bg-light border-left" id="sidebar-wrapper2">
		<div class="list-group list-group-flush">
			<div class="list-group-item list-group-item-action bg-light">
				<div id="drop_the_text">
					<!-- 엔터치면 searchData() 실행 -->
					<input class="form-control" id="search" placeholder="봄 검색"
						onkeypress="if( event.keyCode == 13 ){searchData();}">
				</div>
			</div>
			<div class="list-group-item list-group-item-action bg-light"
				style="padding: 5px;">
				<div class="card bg-light mb-3">
					<div class="card-header">팔로우 추천</div>
					<div class="card-body" style="padding: 5px;">
						<div class="card">
							<div class="card-body" style="font-size: 0.8rem; padding: 10px;">
								<img src="/img/teemo.jpg" class="rounded-circle" width="20"
									height="20"> <a class="card-title text-dark">닉네임</a> <a
									class="card-subtitle mb-2 text-muted">@atid</a>
								<button type="button"
									class="btn btn-outline-success btn-sm float-right"
									style="font-size: 0.8rem;">팔로우</button>
							</div>
						</div>
						<div class="card">
							<div class="card-body" style="font-size: 0.8rem; padding: 10px;">
								<img src="/img/teemo.jpg" class="rounded-circle" width="20"
									height="20"> <a class="card-title text-dark">닉네임</a> <a
									class="card-subtitle mb-2 text-muted">@atid</a>
								<button type="button"
									class="btn btn-outline-success btn-sm float-right"
									style="font-size: 0.8rem;">팔로우</button>
							</div>
						</div>
						<div class="card">
							<div class="card-body" style="font-size: 0.8rem; padding: 10px;">
								<img src="/img/teemo.jpg" class="rounded-circle" width="20"
									height="20"> <a class="card-title text-dark">닉네임</a> <a
									class="card-subtitle mb-2 text-muted">@atid</a>
								<button type="button"
									class="btn btn-outline-success btn-sm float-right"
									style="font-size: 0.8rem;">팔로우</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="list-group-item list-group-item-action bg-light"
				style="padding: 5px;">
				<div class="card bg-light mb-3">
					<div class="card-header">실시간 트랜드</div>
					<div class="card-body" style="padding: 5px;">
						<div class="card">
							<div class="card-body" style="font-size: 0.8rem; padding: 10px;">
								1위
								<div>
									<a href="#">#사랑해티모</a> <span class="float-right">11,333
										봄</span>
								</div>
							</div>
						</div>
						<div class="card">
							<div class="card-body" style="font-size: 0.8rem; padding: 10px;">
								2위
								<div>
									<a href="#">#티세구</a> <span class="float-right">2,301 봄</span>
								</div>
							</div>
						</div>
						<div class="card">
							<div class="card-body" style="font-size: 0.8rem; padding: 10px;">
								3위
								<div>
									<a href="#">#롤하고싶다</a> <span class="float-right">1,300 봄</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="list-group-item list-group-item-action bg-light"
				style="padding: 5px; font-size: 0.8rem;">
				<div class="card">
					<div class="card-body">
						<a href="#">이용약관</a> <a href="#">개인정보처리방침</a> <a href="#">운영정책</a>
						Copyright © Bom Corp. All rights reserved.
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	<!-- 오른쪽 사이드바 끝 -->
	<!-- /#wrapper -->
</body>

</html>