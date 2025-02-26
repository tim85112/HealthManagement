package service.shop;

import model.shop.Product;
import java.util.List;
/**
 * 該介面定義了product表格為核心的業務處理功能
 */
public interface ProductService {
    int addProduct(Product product);
    List<Product> findAllProducts();
    int updateProduct(Product product);
    int deleteProduct(int productId);
}