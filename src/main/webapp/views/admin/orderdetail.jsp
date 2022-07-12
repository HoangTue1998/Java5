<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="true"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<div class="container ">
	<table class="table table-success table-striped">
		<thead>
			<tr>
				<th class="table-primary">STT</th>
				<th class="table-primary">Image</th>
				<th class="table-primary">Name Product</th>
				<th class="table-primary">Size</th>
				<th class="table-primary">Color</th>
				<th class="table-primary">Price</th>
				<th class="table-primary">Quantity</th>
				<th class="table-primary">Total</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${orderDetail}" var="orderdetail"
				varStatus="status">
				<tr>
					<td>#${status.count}</td>
					<td><img height="50px" src="${orderdetail.product.image}"
						alt=""></td>
					<td>${orderdetail.product.name}</td>
					<td>${orderdetail.product.size}</td>
					<td>${orderdetail.product.color}</td>
					<td><fmt:formatNumber value="${orderdetail.price}"
							pattern="#,###" /> VND</td>
					<td>${orderdetail.quantity}</td>
					<td><span style="color: red"><fmt:formatNumber
								value="${orderdetail.price*orderdetail.quantity}"
								pattern="#,###" /> VND</span></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>




