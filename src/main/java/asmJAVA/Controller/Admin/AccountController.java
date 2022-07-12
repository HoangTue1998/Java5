package asmJAVA.Controller.Admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import asmJAVA.Entity.Account;
import asmJAVA.Server.IAccountService;
import asmJAVA.Utils.EncryptUtil;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.io.File;
import java.io.IOException;
import java.util.*;

@Controller
@RequestMapping("admin/acc")
public class AccountController {
	@Autowired
	ServletContext app;
	@Autowired
	HttpServletRequest request;

	@Autowired
	private IAccountService adDAO;

	@Autowired
	HttpSession session;

	@GetMapping("/index")
	public String index(@ModelAttribute("usAD") Account account, Model model,
			@RequestParam(name = "page", required = false, defaultValue = "0") Optional<Integer> page) {
		Pageable pageable = PageRequest.of(page.orElse(0), 5);
		model.addAttribute("list", adDAO.findPageAll(pageable));
		model.addAttribute("view", "/views/admin/user.jsp");
		return "admin/Temp";
	}

	@PostMapping("/store")
	public String add(@ModelAttribute("usAD") Account account, @RequestParam(name = "password") String password) {

		try {
			String encrypted = EncryptUtil.encrypt(password);
			account.setActivated(1);
			account.setPassword(encrypted);
			this.adDAO.insert(account);
			session.setAttribute("message", "Thêm mới tài khoản thành công!");
		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("error", "Thêm mới thất bại?");
		}
		return "redirect:/admin/acc/index";
	}

	@GetMapping("/edit")
	public String edit(@RequestParam(name = "id") Integer id, Model model, @ModelAttribute("usAD") Account account,
			@RequestParam(name = "page", required = false, defaultValue = "0") Optional<Integer> page) {
		model.addAttribute("account", adDAO.findById(id));
		Pageable pageable = PageRequest.of(page.orElse(0), 5);
		request.setAttribute("list", adDAO.findPageAll(pageable));
		model.addAttribute("view", "/views/admin/user.jsp");
		return "admin/Temp";
	}

	@PostMapping("/update")
	public String update(@ModelAttribute("usAD") Account account, @RequestParam(name = "id") Integer id) {
		try {
			Account acc = this.adDAO.findById(id);
			account.setPassword(acc.getPassword());
			account.setActivated(acc.getActivated());
			this.adDAO.update(account);
			session.setAttribute("message", "Cập Nhật Thành Công");
		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("error", "Cập Nhật Thất Bại");
		}
		return "redirect:/admin/acc/index";
	}

	@PostMapping("/delete")
	public String delete(@ModelAttribute("admin") Account account, @RequestParam(name = "id") Integer id) {
		try {
			this.adDAO.delete(id);
			session.setAttribute("message", "Xóa Thành Công");
		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("error", "Xóa Thất Bại");
		}
		return "redirect:/admin/acc/index";
	}
}
