package service.shop.impl;

import dao.shop.ProductDao;
import dao.shop.impl.ProductDaoImpl;
import model.shop.Product;
import service.shop.ProductService;
import java.util.List;

public class ProductServiceImpl implements ProductService {

    private ProductDao productDao = new ProductDaoImpl();

    @Override
    public int addProduct(Product product) {
        return productDao.addProduct(product);
    }

    @Override
    public List<Product> findAllProducts() {
        return productDao.findAllProducts();
    }

    @Override
    public int updateProduct(Product product) {
        return productDao.updateProduct(product);
    }

    @Override
    public int deleteProduct(int productId) {
        return productDao.deleteProduct(productId);
    }
}
