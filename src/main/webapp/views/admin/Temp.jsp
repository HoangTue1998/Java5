<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tuệ Yên Bái</title>
<link href="img/favicon.ico" rel="icon">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;500&family=Lora:wght@600;700&display=swap"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet">
<link href="/lib/animate/animate.min.css" rel="stylesheet">
<link href="/lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link href="/css/bootstrap.min.css" rel="stylesheet">
<link href="/css/style.css" rel="stylesheet">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>

</head>
<body>
	<div id="spinner"
		class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
		<div class="spinner-border text-primary" role="status"></div>
	</div>
	<div class="container-fluid fixed-top px-0 wow fadeIn"
		data-wow-delay="0.1s">
		<div class="top-bar row gx-0 align-items-center d-none d-lg-flex">
			<div class="col-lg-6 px-5 text-start">
				<small><i class="fa fa-map-marker-alt me-2"></i>Hoàng Văn
					Tuệ</small> <small class="ms-4"><i class="fa fa-envelope me-2"></i>kd.kendy9x@gmail.com</small>
			</div>
			<div class="col-lg-6 px-5 text-end">
				<small>Follow us:</small> <a class="text-body ms-3" href=""><i
					class="fab fa-facebook-f"></i></a> <a class="text-body ms-3" href=""><i
					class="fab fa-twitter"></i></a> <a class="text-body ms-3" href=""><i
					class="fab fa-linkedin-in"></i></a> <a class="text-body ms-3" href=""><i
					class="fab fa-instagram"></i></a>
			</div>
		</div>
		<nav
			class="navbar navbar-expand-lg navbar-light py-lg-0 px-lg-5 wow fadeIn"
			data-wow-delay="0.1s">
			<a href="/home/index" class="navbar-brand ms-4 ms-lg-0">
				<h1 class="fw-bold text-primary m-0">
					Tuệ<span class="text-secondary">Yên</span>Bái
				</h1>
			</a>
			<button type="button" class="navbar-toggler me-4"
				data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarCollapse">
				<div class="navbar-nav ms-auto p-4 p-lg-0">
					<a href="/home/index" class="nav-item nav-link active">Trang
						Chủ</a>
					<c:if test="${ user.admin == 1 }">
						<div class="nav-item dropdown">
							<a href="#" class="nav-link dropdown-toggle"
								data-bs-toggle="dropdown">admin</a>
							<div class="dropdown-menu m-0">
								<a href="/admin/acc/index" class="dropdown-item">Quản lý tài khoản</a> <a
									href="/admin/order/index" class="dropdown-item">Quản lý đơn hàng</a> <a
									href="/admin/pro/index" class="dropdown-item">Quản lý loại sản phẩm</a>
							</div>
						</div>
					</c:if>
				</div>
				<div class="d-none d-lg-flex ms-2 p-4">
					<c:if test="${!empty sessionScope.user}">
						<div class="dropdown">
							<a class="btn-sm-square bg-white rounded-circle ms-3"
								id="dropdownMenu2" data-bs-toggle="dropdown"
								aria-expanded="false" href="">Chào:${sessionScope.user.username}
							</a>
							<ul class="dropdown-menu" aria-labelledby="dropdownMenu2">
								<li><a class="dropdown-item" href="/info">Cập nhật tài
										khoản</a></li>
								<li><a class="dropdown-item" href="/changepassword">Đổi
										mật khẩu</a></li>
								<li><a class="dropdown-item" href="/logout">Đăng xuất</a></li>
							</ul>
						</div>

					</c:if>
					<!-- Chưa đăng nhập -->
					<c:if test="${empty sessionScope.user}">
						<div class="dropdown">
							<a class="btn-sm-square bg-white rounded-circle ms-3"
								id="dropdownMenu2" data-bs-toggle="dropdown"
								aria-expanded="false" href=""> <small
								class="fa fa-user text-body"></small>
							</a>
							<ul class="dropdown-menu" aria-labelledby="dropdownMenu2">
								<li><a class="dropdown-item" href="/login">Đăng nhập</a></li>
								<li><a class="dropdown-item" href="/register">Đăng ký</a></li>
							</ul>
						</div>

					</c:if>
				</div>

				<div class="d-none d-lg-flex ms-2">
					<!-- Phần giỏ hàng -->
					<a class="btn-sm-square bg-white rounded-circle ms-3"
						href="/od/store"> <small class="fa fa-shopping-bag text-body"></small>
					</a>
				</div>

			</div>
		</nav>
	</div>
	</nav>
	</div>

	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<div class="col-12">
		<jsp:include page="${ view }"></jsp:include>
	</div>

	<div class="container-fluid bg-dark footer mt-5 pt-5 wow fadeIn"
		data-wow-delay="0.1s">
		<div class="container py-5">
			<div class="row g-5">
				<div class="col-lg-3 col-md-6">
					<h1 class="fw-bold text-primary mb-4">
						F<span class="text-secondary">oo</span>dy
					</h1>
					<p>Asm - java5</p>
					<div class="d-flex pt-2">
						<a class="btn btn-square btn-outline-light rounded-circle me-1"
							href=""><i class="fab fa-twitter"></i></a> <a
							class="btn btn-square btn-outline-light rounded-circle me-1"
							href=""><i class="fab fa-facebook-f"></i></a> <a
							class="btn btn-square btn-outline-light rounded-circle me-1"
							href=""><i class="fab fa-youtube"></i></a> <a
							class="btn btn-square btn-outline-light rounded-circle me-0"
							href=""><i class="fab fa-linkedin-in"></i></a>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<h4 class="text-light mb-4">Địa chỉ liên hệ</h4>
					<p>
						<i class="fa fa-map-marker-alt me-3"></i>Yên bái
					</p>
					<p>
						<i class="fa fa-phone-alt me-3"></i>0368689239
					</p>
					<p>
						<i class="fa fa-envelope me-3"></i>kd.kendy9x@gmail.com
					</p>
				</div>

			</div>
		</div>
		<div class="container-fluid copyright">
			<div class="container">
				<div class="row">
					<div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
						&copy; <a href="#">Hoàng Văn Tuệ</a>
					</div>
					<div class="col-md-6 text-center text-md-end">
						Designed By <a href="https://htmlcodex.com">HTML Codex</a> <br>Distributed
						By: <a href="https://themewagon.com" target="_blank">ThemeWagon</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<a href="#"
		class="btn btn-lg btn-primary btn-lg-square rounded-circle back-to-top"><i
		class="bi bi-arrow-up"></i></a>

	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="/lib/wow/wow.min.js"></script>
	<script src="/lib/easing/easing.min.js"></script>
	<script src="/lib/waypoints/waypoints.min.js"></script>
	<script src="/lib/owlcarousel/owl.carousel.min.js"></script>

	<script src="/js/main.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	<script src="/js/bootstrap.min1.js"></script>
	<script src="/js/jquery.scrollUp.min.js"></script>
	<script src="/js/price-range.js"></script>
	<%--<script src="js/jquery.prettyPhoto.js"></script>--%>



</body>
</html>