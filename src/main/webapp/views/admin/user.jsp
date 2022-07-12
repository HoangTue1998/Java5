<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="true"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>

<div class="container">
	<!-- Phần thêm tài khoản -->
	<c:if test="${account.id==null}">
		<c:set var="uri" scope="session" value="/admin/acc/store"></c:set>
	</c:if>
	<c:if test="${account.id!=null}">
		<c:set var="uri" scope="session"
			value="/admin/acc/update?id=${account.id}"></c:set>
	</c:if>

	<!-- Phần form thêm tài khoản -->

	<form:form action="${uri}" method="POST" modelAttribute="usAD">
		<div class="row g-3">
			<div class="col-md-6">
				<div class="form-floating">
					<form:input path="username" class="form-control"
						value="${account.username}"></form:input>
					<label for="username">Tên tài khoản</label>
					<!-- Phân thông báo lỗi -->
					<form:errors></form:errors>
				</div>
			</div>
			<div class="col-md-6">
				<div class="form-floating">
					<form:input type="password" path="password" class="form-control"
						value="${ account.password }"></form:input>
					<label for="password">Mật khẩu</label>
					<!-- Phân thông báo lỗi -->
					<form:errors></form:errors>
				</div>
			</div>
			<div class="col-12">
				<div class="form-floating">
					<form:input path="email" class="form-control"
						value="${ account.email }"></form:input>
					<label for="email">Email</label>
					<!-- Phân thông báo lỗi -->
					<form:errors></form:errors>
				</div>
			</div>
			<div class="col-12">
				<div class="form-floating">
					<form:input path="fullname" class="form-control"
						value="${ account.fullname }"></form:input>
					<label for="fullname">Họ và Tên</label>
					<!-- Phân thông báo lỗi -->
					<form:errors></form:errors>
				</div>
			</div>

			<div>
				<div class="form-check">
					<input class="form-check-input" name="admin" value="1" type="radio"
						checked="checked"> </input> <label class="form-check-label">
						Admin </label>
				</div>
				<div class="form-check">
					<input class="form-check-input" name="admin" value="0" type="radio">
					</input> <label class="form-check-label"> Người dùng </label>
				</div>
			</div>
			<!-- Phần BTN -->
			<br>

			<div>

				<c:if test="${account.id==null}">
					<form:button class="btn btn-outline-primary">Thêm</form:button>
				</c:if>
				<c:if test="${account.id!=null}">
					<form:button class="btn btn-outline-primary">Cập Nhật</form:button>
				</c:if>
				<form:button type="reset" class="btn btn-outline-warning">Làm Mới</form:button>
				<br>
			</div>
		</div>
		<br>
		<!-- Phần check dữ liệu -->

		<c:if test="${empty list}">
			<p class="alert alert-warning">Không có dữ liệu</p>
		</c:if>
		<c:if test="${!empty sessionScope.message }">
			<div class="alert alert-success mt-3">
				${ sessionScope.message }
				<c:remove var="message" scope="session" />
			</div>
		</c:if>
		<c:if test="${!empty sessionScope.error }">
			<div class="alert alert-danger mt-3">
				${ sessionScope.error }
				<c:remove var="error" scope="session" />
			</div>
		</c:if>
	</form:form>

	<!-- Phần TABLE -->
	<table class="table table-striped table-hover">
		<thead>
			<tr>
				<th class="table-primary">STT</th>
				<th class="table-primary">Tài khoản</th>
				<th class="table-primary">Họ và Tên</th>
				<th class="table-primary">Email</th>
				<th class="table-primary">Trạng thái</th>
				<th class="table-primary">Vai trò</th>
				<th class="table-primary">Ngày thêm</th>
				<th class="table-primary" colspan="2">Thao tác</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list.content}" var="admin" varStatus="status">
				<tr>
					<td>#${status.count}</td>
					<td>${admin.fullname}</td>
					<td>${admin.username}</td>
					<td>${admin.email}</td>
					<td>${admin.activated == 1 ? "Đã kích hoạt" : "Không kích hoạt"}</td>
					<td>${admin.admin == 1 ? "Admin" : "User"}</td>
					<td><a href="/admin/acc/edit?id=${admin.id}"
						class="btn btn-outline-info">Cập Nhật</a></td>
					<td><a data-bs-toggle="modal" data-bs-target="#b${admin.id}"
						class="btn btn-outline-danger">Xóa</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<!-- Phần phân trang -->

	<div class="row">
		<nav aria-label="Page navigation example"
			class="d-flex justify-content-end col-6">
			<ul class="pagination">
				<c:if test="${list.number-1>0}">
					<c:set var="number" scope="session" value="?page=${list.number -1}"></c:set>
				</c:if>
				<c:if test="${list.number-1<1}">
					<c:set var="number" scope="session" value=""></c:set>
				</c:if>
				<c:if test="${list.number+1>list.totalPages}">
					<c:set var="numberup" scope="session"
						value="?page=${list.totalPages}"></c:set>
				</c:if>
				<c:if test="${list.number+1<list.totalPages}">
					<c:set var="numberup" scope="session"
						value="?page=${list.number+1}"></c:set>
				</c:if>
				<li class="page-item"><a class="page-link"
					href="/admin/index${number} ">Previous</a></li>
				<c:forEach var="i" begin="0" end="${ list.totalPages - 1 }">
					<li class="page-item"><a class="page-link"
						href="/admin/index?page=${ i }">${ i + 1 }</a></li>
					</li>
				</c:forEach>
				<li class="page-item"><a class="page-link"
					href="/admin/index${numberup}">Next</a></li>
			</ul>
		</nav>
	</div>

	<!-- Model -->

	<c:forEach items="${list.content}" var="admin" varStatus="status">
		<div id="b${admin.id}" class="modal" tabindex="-1">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h3 class="modal-title">Xác nhận</h3>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<h5>Bạn muốn xóa ${admin.username} ?</h5>
					</div>
					<div class="modal-footer">
						<form action="/admin/acc/delete" method="POST">
							<input type="hidden" value="${admin.id}" name="id">
							<button class="btn btn-danger">Xóa</button>
						</form>
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal" aria-label="Close">Hủy</button>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
		crossorigin="anonymous"></script>
	<script>
		$(document).ready(function() {
			// Activate tooltip
			$('[data-toggle="tooltip"]').tooltip();

			// Select/Deselect checkboxes
			var checkbox = $('table tbody input[type="checkbox"]');
			$("#selectAll").click(function() {
				if (this.checked) {
					checkbox.each(function() {
						this.checked = true;
					});
				} else {
					checkbox.each(function() {
						this.checked = false;
					});
				}
			});
			checkbox.click(function() {
				if (!this.checked) {
					$("#selectAll").prop("checked", false);
				}
			});
		});
	</script>
</div>