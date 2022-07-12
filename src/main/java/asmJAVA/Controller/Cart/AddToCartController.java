package asmJAVA.Controller.Cart;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import asmJAVA.Entity.Order;
import asmJAVA.Entity.OrderDetail;
import asmJAVA.Entity.Product;
import asmJAVA.Server.IProductService;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/home")
public class AddToCartController {

	@Autowired
	private IProductService proDAO;

	@Autowired
	private HttpSession session;

	@GetMapping("/storecart")
	public String addToCart(@RequestParam(name = "id") Integer id,
			@RequestParam(name = "quantity", required = false, defaultValue = "1") Integer quantity) {
		Product itemCar = this.proDAO.findById(id);
		if (session.getAttribute("order") == null) {
			Order order = new Order();
			OrderDetail orderdetail = new OrderDetail();
			orderdetail.setProduct(itemCar);
			orderdetail.setQuantity(quantity);
			orderdetail.setPrice(itemCar.getPrice());
			List<OrderDetail> list = new ArrayList<>();
			list.add(orderdetail);
			order.setOrderdetails(list);
			session.setAttribute("order", order);
		} else {
			Order order = (Order) session.getAttribute("order");
			List<OrderDetail> listOrder = order.getOrderdetails();
			boolean check = false;
			for (OrderDetail item : listOrder) {
				if (item.getProduct().getId() == itemCar.getId()) {
					item.setQuantity(item.getQuantity() + quantity);
					check = true;
				}
			}
			if (check == false) {
				OrderDetail orderdetail = new OrderDetail();
				orderdetail.setProduct(itemCar);
				orderdetail.setQuantity(quantity);
				orderdetail.setPrice(itemCar.getPrice());
				listOrder.add(orderdetail);
			}
			session.setAttribute("order", order);
		}
		return "redirect:/od/store";

	}

	@GetMapping("/cart/plus") // ++
	public String cartPlus(@RequestParam(name = "id") Integer id) {
		Order order = (Order) session.getAttribute("order");
		List<OrderDetail> listOrder = order.getOrderdetails();
		for (OrderDetail item : listOrder) {
			if (item.getProduct().getId() == id) {
				item.setQuantity(item.getQuantity() + 1);
			}
		}
		return "redirect:/od/store";
	}

	@GetMapping("/cart/minus") // --
	public String cartMinus(@RequestParam(name = "id") Integer id) {
		Order order = (Order) session.getAttribute("order");
		List<OrderDetail> listOrder = order.getOrderdetails();
		int check = 0;
		OrderDetail orderdetail = new OrderDetail();
		if (listOrder.size() > 0) {
			for (OrderDetail item : listOrder) {
				if (item.getProduct().getId() == id) {
					item.setQuantity(item.getQuantity() - 1);
					if (item.getQuantity() == 0) {
						orderdetail = item;
						check++;
					}
				}
			}
			if (check != 0) {
				listOrder.remove(orderdetail);
				if (listOrder.isEmpty()) {
					session.removeAttribute("order");
				}
			}
		}
		return "redirect:/od/store";
	}

	@GetMapping("/deletecart")
	public String deletecart(@RequestParam(name = "id") Integer id) {
		Order order = (Order) session.getAttribute("order");
		if (order != null) {
			List<OrderDetail> listOrder = order.getOrderdetails();
			for (OrderDetail item : listOrder) {
				if (item.getProduct().getId() == id) {
					listOrder.remove(item);
					break;
				}
			}
			if (listOrder.isEmpty()) {
				session.removeAttribute("order");
			}
			session.setAttribute("order", order);
		}
		return "redirect:/od/store";
	}
}
