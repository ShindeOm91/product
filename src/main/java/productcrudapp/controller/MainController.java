package productcrudapp.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import productcrudapp.dao.ProductDao;
import productcrudapp.model.Product;

@Controller
public class MainController {

	@Autowired
	private ProductDao productDao;

//	open JSP page and List of all product
	
	@RequestMapping("/")
	public ModelAndView home(Model model) {

		ModelAndView modelAndView = new ModelAndView("index");
		List<Product> products = productDao.getProducts();
		model.addAttribute("products", products);

		return modelAndView;
	}

//	handle add product form

	@RequestMapping(value = "/handle-product", method = RequestMethod.POST)
	public RedirectView handleProduct(@ModelAttribute Product product, HttpServletRequest request) {
//		System.out.println(product);
		productDao.createProduct(product);
		RedirectView redirectView = new RedirectView();
		redirectView.setUrl(request.getContextPath() + "/");
		return redirectView;
	}

//	Delete handler product form
	@RequestMapping("/delete/{productId}")
	public RedirectView deleteProduct(@PathVariable("productId") int productId, HttpServletRequest request) {
		this.productDao.deleteProduct(productId);
		RedirectView redirectView = new RedirectView();
		redirectView.setUrl(request.getContextPath() + "/");
		return redirectView;
	}

//	update handler
//	@RequestMapping("/update/{productId}")
//	public RedirectView updateForm(@PathVariable("productId") int productId, Model model, HttpServletRequest request) {
//		this.productDao.getProduct(productId);
//		RedirectView redirectView = new RedirectView();
//		redirectView.setUrl(request.getContextPath() + "/");
//		model.addAttribute("products", productId); // change
//		return redirectView;
//	}

	// update handler
	@RequestMapping("/update/{productId}")
	public String updateForm(@PathVariable("productId") int pid, Model model) {
		Product product = this.productDao.getProduct(pid);
		model.addAttribute("product", product);
		return "update_form";
		
		
		
	}

}
