package asmJAVA.Controller.Account;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import asmJAVA.Entity.Account;
import asmJAVA.Server.IAccountService;
import asmJAVA.Utils.EncryptUtil;

import javax.servlet.http.HttpSession;

@Controller
public class LoginController {
	@Autowired
	private HttpSession session;

	@Autowired
	private IAccountService usDAO;

	@GetMapping("/login")
	public String loginUI(Model model) {
		model.addAttribute("view", "/views/account/login.jsp");
		return "admin/Temp";
	}

	@PostMapping("/loginAccount")
	public String login(@RequestParam(name = "email", required = false) String email,
			@RequestParam(name = "password", required = false) String password) {
		Account user = this.usDAO.findByEmail(email);
		if (user == null) {
			session.setAttribute("error", "Tên đăng nhập không tồn tại, xin mời đăng ký");
			return "redirect:/login";
		} else {
			boolean check = EncryptUtil.check(password, user.getPassword());
			if (check == true) {
				// Đăng nhập thành công
				if (user.getAdmin() == 1) {
					session.setAttribute("user", user);
					System.out.println("aaaaa"+user);
				//	admmin
				      return "redirect:/home/index";
				} else {
					session.setAttribute("user", user);
					System.out.println("aaaaa"+user);
					return "redirect:/home/index";
				}
			} else {
				// Đăng nhập thất bại
				session.setAttribute("error", "Mật Khẩu không chính xác ");
				return "redirect:/account/login";
			}
		}
	}

	@GetMapping("logout")
	public String logout( Model model) {
		session.removeAttribute("user");
        return "redirect:/login";
	}
}
