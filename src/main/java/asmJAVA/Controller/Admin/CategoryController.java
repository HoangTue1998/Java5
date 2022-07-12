package asmJAVA.Controller.Admin;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import asmJAVA.Entity.Category;
import asmJAVA.Server.ICategoryService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Optional;

@Controller
@RequestMapping("admin/category")
public class CategoryController {
    @Autowired
    HttpSession session;
    @Autowired
    HttpServletRequest request;
    @Autowired
    private ICategoryService cateDAO;

    @GetMapping("/index")
    public String index(@ModelAttribute("category") Category category, Model model, @RequestParam(name = "page", required = false, defaultValue = "0") Optional<Integer> page) {
        Pageable pageable = PageRequest.of(page.orElse(0), 5);
        model.addAttribute("list", cateDAO.findPageAll(pageable));
        return "admin/category";
    }


    @PostMapping("/add")
    public String add(@ModelAttribute("category") Category category) {
        try {
            category.setStatus(1);
            this.cateDAO.insert(category);
            session.setAttribute("message", "Thêm Mới Thành Công");
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("error", "Thêm Mới Thất Bại");
        }
        return "redirect:/admin/category/index";
    }

    @GetMapping("/edit")
    public String edit(@RequestParam(name = "id") Integer id, Model model, @ModelAttribute("category") Category category, @RequestParam(name = "page", required = false, defaultValue = "0") Optional<Integer> page) {
        model.addAttribute("cate", cateDAO.findById(id));
        Pageable pageable = PageRequest.of(page.orElse(0), 5);
        request.setAttribute("list", cateDAO.findPageAll(pageable));
        return "admin/category";
    }

    @PostMapping("/update")
    public String update(@ModelAttribute("category") Category category, @RequestParam(name = "id") Integer id) {
        try {
            Category cate=this.cateDAO.findById(id);
            category.setStatus(cate.getStatus());
            this.cateDAO.update(category);
            session.setAttribute("message", "Cập Nhật Thành Công");
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("error", "Cập Nhật Thất Bại");
        }
        return "redirect:/admin/category/index";
    }

    @PostMapping("/delete")
    public String delete(@ModelAttribute("category") Category category, @RequestParam(name = "id") Integer id) {
        try {
            this.cateDAO.delete(id);
            session.setAttribute("message", "Xóa Thành Công");
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("error", "Xóa Thất Bại");
        }
        return "redirect:/admin/category/index";
    }
}
