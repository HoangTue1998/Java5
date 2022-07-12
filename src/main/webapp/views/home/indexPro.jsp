<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="true"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>

<c:if test="${!empty sessionScope.message }">
	<div class="alert alert-success mt-3">
		${ sessionScope.message }
		<c:remove var="message" scope="session" />
	</div>
</c:if>
<div class="container-xxl py-5">
	<div class="container">
		<div class="row g-0 gx-5 align-items-end">
			<div class="col-lg-6">
				<div class="section-header text-start mb-5 wow fadeInUp"
					data-wow-delay="0.1s" style="max-width: 500px;">
					<h1 class="display-5 mb-3">Sản phẩm của chúng tôi</h1>
				</div>
			</div>
		</div>
		<c:forEach items="${show.content}" var="pro">

			<div class="tab-content">
				<div class="tab-pane fade show p-0 active">
					<div class="row g-4">
						<div class="col-xl-3 col-lg-4 col-md-6 wow fadeInUp"
							data-wow-delay="0.1s">
							<div class="product-item">
								<div class="position-relative bg-light overflow-hidden">
									<img class="img-fluid w-100" src="${pro.image}" alt="">
									<div
										class="bg-secondary rounded text-white position-absolute start-0 top-0 m-4 py-1 px-3">New</div>
								</div>
								<div class="text-center p-4">
									<a class="d-block h5 mb-2" href="">${pro.name}</a> <span
										class="text-primary me-1">Giá: ${pro.price}</span>
								</div>
								<div class="d-flex border-top">
									<small class="w-50 text-center border-end py-2"> <a
										class="text-body" href="/home/details?id=${pro.id}"><i
											class="fa fa-eye text-primary me-2"></i>Chi tiết</a>
									</small> <small class="w-50 text-center py-2"> <a
										class="text-body" href="/home/storecart?id=${pro.id}"><i
											class="fa fa-shopping-bag text-primary me-2"></i>Thêm giỏ
											hàng</a>
									</small>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
</div>