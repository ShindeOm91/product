package productcrudapp.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import productcrudapp.model.Product;

@Component
public class ProductDao {
	
	@Autowired
	private HibernateTemplate hibernateTemplate;

	//create  
	@Transactional
	public void save(Product product) {		
		this.hibernateTemplate.save(product);		
	}
	
//	update
	@Transactional
	public void update(Product product) {		
		this.hibernateTemplate.update(product);		
	}
	
//	@Transactional
//	public void update(int pid) {
//		Product p = this.hibernateTemplate.load(Product.class, pid);
//		this.hibernateTemplate.saveOrUpdate(p);
//	}
	
	
	
	//get all products
	@Transactional
	public List<Product> getProducts(){
		List<Product> products = this.hibernateTemplate.loadAll(Product.class);
		return products;
	}
	
	//delete the single product
	@Transactional
	public void deleteProduct(int pid) {
		Product p = this.hibernateTemplate.load(Product.class, pid);
		this.hibernateTemplate.delete(p);
	}
	
	//get the single product
	@Transactional
	public Product getProduct(int pid) {
		return this.hibernateTemplate.get(Product.class, pid);
	}
	
}
