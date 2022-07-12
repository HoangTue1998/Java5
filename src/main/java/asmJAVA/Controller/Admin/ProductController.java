package asmJAVA.Controller.Admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import asmJAVA.Entity.Product;
import asmJAVA.Server.ICategoryService;
import asmJAVA.Server.IProductService;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.*;

@Controller
@RequestMapping("admin/pro")
public class ProductController {
	@Autowired
	ServletContext app;

	@Autowired
	private IProductService proDAO;

	@Autowired
	private ICategoryService cateDAO;

	@Autowired
	HttpServletRequest request;

	@Autowired
	HttpSession session;

	@GetMapping("/index")
	public String index(@ModelAttribute("product") Product product, Model model,
			@RequestParam(name = "page", required = false, defaultValue = "0") Optional<Integer> page) {
		Pageable pageable = PageRequest.of(page.orElse(0), 5);
		model.addAttribute("list", proDAO.findPageAll(pageable));
		model.addAttribute("listCate", cateDAO.getAll());
		model.addAttribute("view", "/views/admin/pro.jsp");
		return "admin/Temp";
	}

	@PostMapping("/store")
	public String add(@ModelAttribute("product") Product product, @RequestParam("attach") MultipartFile attach) {
		try {
			product.setCreatedDate(new Date());
			product.setAvailable(1);
			if (!attach.isEmpty()) {
				String filename = attach.getOriginalFilename();
				File file = new File(app.getRealPath("/images/products/" + filename));
				product.setImage("/images/products/" + filename);
				try {
					attach.transferTo(file);
				} catch (IOException e) {
					throw new RuntimeException(e);
				}
			}
			this.proDAO.insert(product);
			session.setAttribute("message", "Thêm thành công!");
		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("error", "Thêm thất bại?");
		}
		return "redirect:/admin/pro/index";
	}

	@GetMapping("/edit")
	public String edit(@RequestParam(name = "id") Integer id, Model model, @ModelAttribute("product") Product product,
			@RequestParam(name = "page", required = false, defaultValue = "0") Optional<Integer> page) {
		model.addAttribute("pro", proDAO.findById(id));
		model.addAttribute("listCate", cateDAO.getAll());
		Pageable pageable = PageRequest.of(page.orElse(0), 5);
		request.setAttribute("list", proDAO.findPageAll(pageable));
		model.addAttribute("view", "/views/admin/pro.jsp");
		return "admin/Temp";
	}

	@PostMapping("/update")
	public String update(@ModelAttribute("product") Product product, @RequestParam(name = "id") Integer id,
			@RequestParam("attach") MultipartFile attach) {
		try {
			Product p = proDAO.findById(id);
			product.setCreatedDate(p.getCreatedDate());
			if (!attach.isEmpty()) {
				String filename = attach.getOriginalFilename();
				File file = new File(app.getRealPath("/images/products/" + filename));
				product.setImage("/images/products/" + filename);
				try {
					attach.transferTo(file);
				} catch (IOException e) {
					throw new RuntimeException(e);
				}
			} else {
				product.setImage(p.getImage());
			}
			this.proDAO.update(product);
			session.setAttribute("message", "Cập nhật thành công!");
		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("error", "Cập nhật thất bại?");
		}
		return "redirect:/admin/pro/index";
	}

	@PostMapping("/delete")
	public String delete(@ModelAttribute("product") Product product, @RequestParam(name = "id") Integer id) {
		try {
			this.proDAO.delete(id);
			session.setAttribute("message", "Xoá thành công!");
		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("error", "Xoá thất bại?");
		}
		return "redirect:/admin/pro/index";
	}

	@GetMapping("/search")
	public String search(@ModelAttribute("product") Product product, @RequestParam(name = "search") String name,
			@RequestParam(name = "page") Optional<Integer> page, Model model) {
		try {
			List<Product> list = proDAO.findAllByName(name);
			Pageable pageable = PageRequest.of(page.orElse(0), 5);
			int start = (int) pageable.getOffset();
			int end = Math.min((start + pageable.getPageSize()), list.size());
			request.setAttribute("list", new PageImpl<>(list.subList(start, end), pageable, list.size()));
			if (new PageImpl<>(list.subList(start, end), pageable, list.size()).getTotalPages() - 1 < 0) {
				session.setAttribute("error", "Tìm thất bại");
				return "redirect:/admin/pro/index";
			}
			session.setAttribute("message", "Tìm thành công");
		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("error", "Tìm thất bại");
			return "redirect:/admin/pro/index";
		}
		model.addAttribute("view", "/views/admin/pro.jsp");
		return "admin/Temp";
	}
}
