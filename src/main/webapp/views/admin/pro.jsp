<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="true"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<div class="container ">
	<c:if test="${pro.id==null}">
		<c:set var="uri" scope="session" value="/admin/pro/store"></c:set>
	</c:if>
	<c:if test="${pro.id!=null}">
		<c:set var="uri" scope="session"
			value="/admin/pro/update?id=${pro.id}"></c:set>
	</c:if>
	<form:form action="${uri}" method="post" modelAttribute="product"
		enctype="multipart/form-data">
		<div class="row">
			<div class="form-group mt-4 col-6">
				<label class="form-label">Category</label>
				<form:select class="form-select" path="category">
					<form:options itemValue="id" itemLabel="name" items="${listCate}"></form:options>
				</form:select>
			</div>
			<div class="form-group mt-4 col-6">
				<form:label path="name">Tên sản phẩm</form:label>
				<form:input name="name" path="name" class="form-control"
					value="${pro.name}" />
			</div>
			<div class="form-group mt-4 col-6">
				<form:label path="" class="form-lable">Image</form:label>
				<input type="file" class="form-control" name="attach"
					value="${pro.image}">
			</div>
			<div class="form-group mt-4 col-6">
				<form:label path="price">Giá</form:label>
				<form:input name="price" path="price" class="form-control"
					value="${pro.price}" />
			</div>
			<div class="form-group mt-4 col-6">
				<form:label path="material">Chất liệu</form:label>
				<form:input name="material" path="material" class="form-control"
					value="${pro.material}"></form:input>
			</div>
			<div class="form-group mt-4 col-6">
				<form:label path="color">Màu mắt kính</form:label>
				<form:input name="color" path="color" class="form-control"
					value="${pro.color}"></form:input>
			</div>
			<div class="form-group mt-4 col-6">
				<form:label path="describe1">Mô tả</form:label>
				<form:textarea name="describe1" path="describe1"
					class="form-control" value="${pro.describe1}"></form:textarea>
			</div>

			<c:if test="${pro.id!=null}">
				<div>
					<div class="form-check">
						<input class="form-check-input" name="available" value="1"
							type="radio"> </input> <label
							class="form-check-label"> Còn hàng </label>
					</div>
					<div class="form-check">
						<input class="form-check-input" name="available" value="0"
							type="radio"> </input> <label class="form-check-label">
							Hết hàng </label>
					</div>
				</div>
			</c:if>

		</div>
		<c:if test="${pro.id==null}">
			<button class="btn btn-outline-dark mt-2">Thêm</button>
		</c:if>
		<c:if test="${pro.id!=null}">
			<button class="btn btn-outline-secondary mt-2">Cập Nhật</button>
		</c:if>
		<button type="reset" class="btn btn-outline-warning mt-2">Làm
			Mới</button>
		<br>

		<c:if test="${empty list}">
			<p class="alert alert-warning">Vui Lòng Thêm Mới Dữ Liệu</p>
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
	<form action="/admin/pro/search" method="GET" class="row g-3 mb-3 mt-2">
		<div class="col-10">
			<input type="text" name="search" class="form-control"
				placeholder="Tìm theo tên">
		</div>
		<div class="col-2">
			<button type="submit" class="btn btn-outline-info">Tìm Kiếm</button>
		</div>
	</form>
<hr>
	<table class="table table-success table-striped">
		<thead>
			<tr>
				<th class="table-primary">STT</th>
				<th class="table-primary">Tên thể lại</th>
				<th class="table-primary">Image</th>
				<th class="table-primary">Tên sản phẩm</th>
				<th class="table-primary">Chất liệu</th>
				<th class="table-primary">Màu kính</th>
				<th class="table-primary">Giá bán</th>
				<th class="table-primary">Ngày thêm</th>
				<th class="table-primary">Trạng thái</th>
				<th class="table-primary" colspan="2">Thao tác</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list.content}" var="product" varStatus="status">
				<tr>
					<td>${status.count}</td>
					<td>${product.category.name}</td>
					<td><img src="${product.image}" height="100px"></td>
					<td>${product.name}</td>
					<td>${product.material}</td>
					<td>${product.color}</td>
					<td><fmt:formatNumber value="${product.price}" pattern="#,###" />
						VND</td>
					<td><fmt:formatDate value="${product.createdDate}"
							pattern="dd/MM/yyyy" /></td>
					<td>${product.available == 1 ? "Còn hàng" : "Hết hàng"}</td>
					<td><a href="/admin/pro/edit?id=${product.id}"
						class="btn btn-outline-primary">Cập Nhật</a></td>
					<td><a data-bs-toggle="modal" data-bs-target="#b${product.id}"
						class="btn btn-outline-danger">Xóa</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
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
					href="/admin/pro/index${number} ">Previous</a></li>
				<c:forEach var="i" begin="0" end="${ list.totalPages - 1 }">
					<li class="page-item"><a class="page-link"
						href="/admin/pro/index?page=${ i }">${ i + 1 }</a></li>
					</li>
				</c:forEach>
				<li class="page-item"><a class="page-link"
					href="/admin/pro/index${numberup}">Next</a></li>
			</ul>
		</nav>
	</div>
</div>
<c:forEach items="${list.content}" var="product" varStatus="status">
	<div id="b${product.id}" class="modal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="modal-title">Xác nhận</h3>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<h5>Bạn muốn xóa: Sản phẩm * ${product.name} ?</h5>
				</div>
				<div class="modal-footer">
					<form action="/admin/pro/delete" method="post">
						<input type="hidden" value="${product.id}" name="id">
						<button class="btn btn-danger">Xóa</button>
					</form>
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal" aria-label="Close">Hủy</button>
				</div>
			</div>
		</div>
	</div>
</c:forEach>


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
</html>