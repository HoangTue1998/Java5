package asmJAVA.Controller.Admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import asmJAVA.Entity.Order;
import asmJAVA.Server.IAccountService;
import asmJAVA.Server.IOrderService;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.util.Date;
import java.util.Optional;

@Controller
@RequestMapping("/admin/order")
public class OrderController {
	@Autowired
	ServletContext app;
	@Autowired
	private IOrderService orderDAO;
	@Autowired
	private IAccountService usDAO;
	@Autowired
	HttpServletRequest request;
	@Autowired
	HttpSession session;

	@GetMapping("/index")
	public String index(Model model,
			@RequestParam(name = "page", required = false, defaultValue = "0") Optional<Integer> page) {
		Pageable pageable = PageRequest.of(page.orElse(0), 5);
		model.addAttribute("list", orderDAO.findPageAll(pageable));
		model.addAttribute("view", "/views/admin/order.jsp");
		return "admin/Temp";
	}

	@GetMapping("/showdetail")
	public String showDetail(Model model, @RequestParam(name = "id") Integer id) {
		Order order = orderDAO.findById(id);
		model.addAttribute("orderDetail", order.getOrderdetails());
		model.addAttribute("view", "/views/admin/orderdetail.jsp");
		return "admin/Temp";
	}

	@PostMapping("/delete")
	public String delete(@RequestParam(name = "id") Integer id) {
		try {
			Order order = orderDAO.findById(id);
			order.setStatus(0);
			this.orderDAO.update(order);
			session.setAttribute("message", "Xóa Thành Công");
		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("error", "Xóa Thất Bại");
		}
		return "redirect:/admin/order/index";
	}

	@PostMapping("/confirm")
	public String confirm(@RequestParam(name = "id") Integer id) {
		Date now = new Date();
		try {
			Order order = orderDAO.findById(id);
			order.setStatus(1);
			order.setCreateDate(now);
			this.orderDAO.update(order);
			session.setAttribute("message", "Xác nhận Thành Công");
		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("error", "Xác nhận Thất Bại");
		}
		return "redirect:/admin/order/index";
	}

	@PostMapping("/cancel")
	public String cancel(@RequestParam(name = "id") Integer id) {
		try {
			Order order = orderDAO.findById(id);
			order.setStatus(2);
			this.orderDAO.update(order);
			session.setAttribute("message", "Hủy Thành Công");
		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("error", "Hủy Thất Bại");
		}
		return "redirect:/admin/order/index";
	}

}
