<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="true"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<div class="container">
	<div class="row g-0 gx-5 align-items-end">
		<div class="col-lg-6">
			<div class="section-header text-start mb-5 wow fadeInUp"
				data-wow-delay="0.1s" style="max-width: 500px;">
				<h1 class="display-5 mb-3">Giỏ hàng của bạn</h1>
			</div>
		</div>
		<!-- Phần view -->


		<c:if test="${!empty sessionScope.error}">
			<div class="alert alert-danger">${sessionScope.error}</div>
			<c:remove var="error" scope="session" />
		</c:if>
		&ensp;&ensp; <a class="btn btn-warning" href="/home/index">Tiếp
			Tục Mua Hàng</a>
		<div class="table-responsive cart_info col-sm-12">
			<table class="table table-condensed">
				<thead>
					<tr class="cart_menu">
						<td class="description"><b>STT</b></td>
						<td class="image">Ảnh</td>
						<td class="description">Tên sản phẩm</td>
						<td class="description">Mô tả</td>
						<td class="price">Giá</td>
						<td class="quantity">Số lượng</td>
						<td class="total">Tổng</td>
						<td></td>
					</tr>
				</thead>
				<tbody>
					<c:if test="${empty sessionScope.order.orderdetails}">
						<td><p style="color: red; font-size: 20px">Giỏ hàng chưa
								có sản phẩm</p></td>
					</c:if>
					<c:forEach items="${sessionScope.order.orderdetails}" var="cart"
						varStatus="status">
						<tr>
							<td class="cart_description"><b> ${status.count}</b></td>
							<td class="cart_product"><img height="90px"
								src="${cart.product.image}" alt=""></td>
							<td class="cart_description">${cart.product.name}</td>
							<td class="cart_description">Chất liệu : <span
								class="text-info">${cart.product.material}</span> &ensp;&ensp;
								Color : <span class="text-info">${cart.product.color}</span>
							</td>
							<td class="cart_price"><fmt:formatNumber
									value="${cart.product.price}" pattern="#,###" /></td>
							<td class="cart_quantity">
								<div class="cart_quantity_button">
									<a class="text-danger"
										href="/home/cart/plus?id=${cart.product.id}"><svg
											xmlns="http://www.w3.org/2000/svg" width="16" height="16"
											fill="currentColor" class="bi bi-arrow-up-circle"
											viewBox="0 0 16 16">
  <path fill-rule="evenodd"
												d="M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8zm15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-7.5 3.5a.5.5 0 0 1-1 0V5.707L5.354 7.854a.5.5 0 1 1-.708-.708l3-3a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708L8.5 5.707V11.5z" />
</svg></a> <input class="cart_quantity_input" type="text" name="quantity"
										value="${cart.quantity}" autocomplete="off" size="2">
									<a class="text-danger"
										href="/home/cart/minus?id=${cart.product.id}"><svg
											xmlns="http://www.w3.org/2000/svg" width="16" height="16"
											fill="currentColor" class="bi bi-arrow-down-circle"
											viewBox="0 0 16 16">
  <path fill-rule="evenodd"
												d="M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8zm15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8.5 4.5a.5.5 0 0 0-1 0v5.793L5.354 8.146a.5.5 0 1 0-.708.708l3 3a.5.5 0 0 0 .708 0l3-3a.5.5 0 0 0-.708-.708L8.5 10.293V4.5z" />
</svg></a>
								</div>
							</td>
							<td class="cart_total"><span class="text-info"><fmt:formatNumber
										value="${cart.product.price*cart.quantity}" pattern="#,###" />
									VND</span></td>
							<td><a class="btn btn-outline-danger"
								href="/home/deletecart?id=${cart.product.id}"><i
									class="fa fa-times"></i></a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<!-- Phần TTTT -->
		<div class="col-12">
			<p>
				Bạn có <span style="color: red; font-size: 15px">${quantityVP}</span>
				sản phẩm trong giỏ hàng
			</p>
			<hr>
			<b>Thành Tiền :&ensp; &ensp; &ensp;&ensp;&ensp;<span
				class="text-danger fs-2"><fmt:formatNumber value="${total}"
						pattern="#,###" /> VND</span></b>
			<hr>
			<p>Phương thức thanh toán:Thanh toán khi nhận hàng</p>
			<hr>
			<c:if test="${!empty sessionScope.order}">
				&ensp;&ensp;
				<div class="col-12 mb-5 mb-md-0">
					<form action="/home/addtoorder" method="GET">
						<h2 class="h3 mb-3 text-black">Nhập thông tin cá nhân</h2>
						<div class="p-3 p-lg-12 border">
							<div class="form-group row">
								<div class="col-md-6">
									<label class="form-label fw-bold">* Tên khách hàng</label> <input
										type="text" class="form-control" name="name">
								</div>
								<div class="col-md-6">
									<label class="form-label fw-bold">* Số điện thoại </label> <input
										type="text" class="form-control" name="phone">
								</div>
							</div>
						</div>
						<div class="form-group row mb-5">
							<div class="col-md-12">
								<label class="form-label fw-bold">* Địa chỉ</label> <input
									type="text" class="form-control" name="address">
							</div>
						</div>
						<div class="form-group">
							<button class="btn btn-outline-primary">Đặt Hàng</button>
						</div>
					</form>
				</div>
			</c:if>
			<hr>
		</div>

		<!-- END -->

	</div>
</div>
