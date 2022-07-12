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
				<h1 class="display-5 mb-3">Chi tiết sản phẩm</h1>
			</div>
		</div>
	</div>
	<!-- Phần view -->
	<div class="container mt-5 mb-5">
		<div class="row d-flex justify-content-center">
			<div class="col-md-10">
				<div class="card">
					<div class="row">
						<div class="col-md-6">
							<div class="images p-3">
								<div class="text-center p-4">
									<img id="main-image" src="https://i.imgur.com/Dhebu4F.jpg"
										width="250" />
								</div>
								<div class="thumbnail text-center">
									<img onclick="change_image(this)"
										src="https://i.imgur.com/Rx7uKd0.jpg" width="70"> <img
										onclick="change_image(this)"
										src="https://i.imgur.com/Dhebu4F.jpg" width="70">
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="product p-4">
								<div class="d-flex justify-content-between align-items-center">
									<div class="d-flex align-items-center">
										<a href=""> <i class="fa fa-long-arrow-left"></i> <span
											class="ml-1">Quay lại</span>
										</a>
									</div>
									<a href=""> <i class="fa fa-shopping-cart text-muted"></i>
									</a>
								</div>
								<div class="mt-4 mb-3">
									<span class="text-uppercase text-muted brand">Tên sản phẩm:</span>
									<h5 class="text-uppercase">${product.name}</h5>
								</div>
								<p class="about">Shop from a wide range of t-shirt from
									orianz. Pefect for your everyday use, you could pair it with a
									stylish pair of jeans or trousers complete the look.</p>
								<div class="sizes mt-5">
									<h6 class="text-uppercase">Size</h6>
									<label class="radio"> <input type="radio" name="size"
										value="S" checked> <span>S</span>
									</label> <label class="radio"> <input type="radio" name="size"
										value="M"> <span>M</span>
									</label> <label class="radio"> <input type="radio" name="size"
										value="L"> <span>L</span>
									</label> <label class="radio"> <input type="radio" name="size"
										value="XL"> <span>XL</span>
									</label> <label class="radio"> <input type="radio" name="size"
										value="XXL"> <span>XXL</span>
									</label>
								</div>
								<div class="cart mt-4 align-items-center">
									<button class="btn btn-danger text-uppercase mr-2 px-4">Add
										to cart</button>
									<i class="fa fa-heart text-muted"></i> <i
										class="fa fa-share-alt text-muted"></i>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>