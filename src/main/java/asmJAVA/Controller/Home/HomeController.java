package asmJAVA.Controller.Home;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import asmJAVA.Entity.Product;
import asmJAVA.Server.ICategoryService;
import asmJAVA.Server.IProductService;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Optional;

@Controller
@RequestMapping("/home")
public class HomeController {
    @Autowired
    ServletContext app;

    @Autowired
    private IProductService productDao;

    @Autowired
    private ICategoryService categoryDao;

    @Autowired
    HttpServletRequest request;

    @Autowired
    HttpSession session;

    @GetMapping("/index")
    public String index(Model model, @RequestParam(name = "page", required = false, defaultValue = "0") Optional<Integer> page) {
        model.addAttribute("listCate",categoryDao.getAll());
        Pageable pageable = PageRequest.of(page.orElse(0), 5);
        model.addAttribute("show",productDao.findPageAll(pageable));
        request.setAttribute("view", "/views/home/indexPro.jsp");
		return "admin/Temp";
    }
    
    
	@GetMapping("/details")
	public String detail(Model model) {
        request.setAttribute("view","/views/home/details.jsp");
		return "admin/Temp";
	}
}
