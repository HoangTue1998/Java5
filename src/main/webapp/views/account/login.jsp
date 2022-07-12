<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="true"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>

<div class="container">

	<div class="row">
		<div class="container-fluid h-custom">
			<div
				class="row d-flex justify-content-center align-items-center h-100">
				<div class="col-md-9 col-lg-6 col-xl-5">
					<img
						src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/draw2.webp"
						class="img-fluid" alt="Sample image">
				</div>
				<div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">
					<form action="/loginAccount" method="POST">
						<div
							class="d-flex flex-row align-items-center justify-content-center justify-content-lg-start">
							<p class="lead fw-normal mb-0 me-3">Đăng nhập với</p>
							<button type="button" class="btn btn-primary btn-floating mx-1">
								<i class="fab fa-facebook-f"></i>
							</button>

							<button type="button" class="btn btn-primary btn-floating mx-1">
								<i class="fab fa-twitter"></i>
							</button>

							<button type="button" class="btn btn-primary btn-floating mx-1">
								<i class="fab fa-linkedin-in"></i>
							</button>
						</div>

						<div class="divider d-flex align-items-center my-4">
							<p class="text-center fw-bold mx-3 mb-0">Hoặc</p>
						</div>

						<c:if test="${!empty sessionScope.error}">
							<div class="alert alert-danger">${sessionScope.error}</div>
							<c:remove var="error" scope="session" />
						</c:if>
						<c:if test="${!empty sessionScope.message}">
							<div class="alert alert-success">${sessionScope.message}</div>
							<c:remove var="message" scope="session" />
						</c:if>

						<!-- Email input -->
						<div class="form-outline mb-4">
							<input type="email" name="email"
								class="form-control form-control-lg"
								placeholder="Nhập địa chỉ email hợp lệ" /> <label
								class="form-label">Email</label>
						</div>

						<!-- Password input -->
						<div class="form-outline mb-3">
							<input type="password" name="password"
								class="form-control form-control-lg" placeholder="Nhập mật khẩu" />
							<label class="form-label">Mật khẩu</label>
						</div>

						<div class="d-flex justify-content-between align-items-center">
							<!-- Checkbox -->
							<div class="form-check mb-0">
								<input class="form-check-input me-2" type="checkbox" value=""
									id="form2Example3" /> <label class="form-check-label"
									for="form2Example3"> Nhớ tài khoản </label>
							</div>
							<a href="#!" class="text-body">Quyên mật khẩu?</a>
						</div>



						<div class="text-center text-lg-start mt-4 pt-2">
							<button type="submit" class="btn btn-primary btn-lg"
								style="padding-left: 2.5rem; padding-right: 2.5rem;">Đăng
								nhập</button>
							<p class="small fw-bold mt-2 pt-1 mb-0">
								Bạn chưa có tài khoản? <a href="#!" class="link-danger">Đăng
									ký</a>
							</p>
						</div>

					</form>
				</div>
			</div>
		</div>
	</div>
</div>