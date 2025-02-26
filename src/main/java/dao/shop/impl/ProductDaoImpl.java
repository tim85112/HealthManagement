package dao.shop.impl;

import dao.shop.BaseDao;
import dao.shop.ProductDao;
import model.shop.Product;
import java.util.List;

public class ProductDaoImpl extends BaseDao implements ProductDao {

    @Override
    public int addProduct(Product product) {
        String sql = "INSERT INTO products (name, description, price, stock_quantity, category_id, image_url, created_at, updated_at) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        return baseUpdate(sql, product.getName(), product.getDescription(), product.getPrice(), product.getStockQuantity(), product.getCategoryId(), product.getImageUrl(), product.getCreatedAt(), product.getUpdatedAt());
    }

    @Override
    public List<Product> findAllProducts() {
        String sql = "SELECT product_id as productId, name, description, price, stock_quantity as stockQuantity, category_id as categoryId, image_url as imageUrl, created_at as createdAt, updated_at as updatedAt FROM products";
        return baseQuery(Product.class, sql);
    }

    @Override
    public int updateProduct(Product product) {
        String sql = "UPDATE products SET name=?, description=?, price=?, stock_quantity=?, category_id=?, image_url=?, created_at=?, updated_at=? WHERE product_id=?";
        return baseUpdate(sql, product.getName(), product.getDescription(), product.getPrice(), product.getStockQuantity(), product.getCategoryId(), product.getImageUrl(), product.getCreatedAt(), product.getUpdatedAt(), product.getProductId());
    }

    @Override
    public int deleteProduct(int productId) {
        String sql = "DELETE FROM products WHERE product_id=?";
        return baseUpdate(sql, productId);
    }
}
