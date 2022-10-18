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

/**
 * 
 * 
 * @author ANIKET
 *
 */
@Controller
public class MainController {

	@Autowired
	private ProductDao productDao;

//	open JSP page and List of all product

	@RequestMapping("/")
	public ModelAndView home(Model model, HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView("index");
		List<Product> products = productDao.getProducts();
		// System.out.println(request.getSession().getAttribute("pid"));
		
		System.out.println(products);
		
		if (request.getSession().getAttribute("pid") != null) {
			
			Product product = this.productDao.getProduct((int) request.getSession().getAttribute("pid"));
			
			model.addAttribute("product", product);
		}else {
			request.getSession().removeAttribute("pid");
		}

		model.addAttribute("products", products);
		return modelAndView;
	}
	
//    Add 
	@RequestMapping(value = "/handle-product", method = RequestMethod.POST)
	public RedirectView handleProduct(@ModelAttribute Product product, HttpServletRequest request) {

//		Problem.......
		System.out.println(request.getSession().getAttribute("pid"));
		
		System.out.println(product.getId()); //0 this is Problem..
		
//		int i =(int) request.getSession().getAttribute("pid");
//		System.out.println(i);
//		if(i != 113) 
		
		if(request.getSession().getAttribute("pid") != null)
		{
			
			productDao.save(product);
			System.out.println("save.....");
		} else {
			productDao.update(product);
			System.out.println("update....");
		}
		
		RedirectView redirectView = new RedirectView();
		request.getSession().removeAttribute("pid");
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

//  update 
		@RequestMapping("update/{productId}")
		public RedirectView updateForm(@PathVariable("productId") int pid, Model model, HttpServletRequest request)
				throws Exception {
			Product product = this.productDao.getProduct(pid);

			model.addAttribute("product", product);

			System.out.println(pid);

			RedirectView redirectView = new RedirectView();
			request.getSession().setAttribute("pid", pid);
			redirectView.setUrl(request.getContextPath() + "/");
			return redirectView;
		}
	 
}
