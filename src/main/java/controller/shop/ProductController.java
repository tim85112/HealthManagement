package controller.shop;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import dao.shop.ProductDao;
import dao.shop.impl.ProductDaoImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.shop.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/api/shop/product/*")
public class ProductController extends ShopBaseController {

    private void sendJsonResponse(HttpServletResponse res, Map<String, Object> responseData) throws IOException {
        res.setContentType("application/json");
        res.setCharacterEncoding("UTF-8");
        PrintWriter out = res.getWriter();
        ObjectMapper objectMapper = new ObjectMapper();
        // 註冊 JavaTimeModule
        objectMapper.registerModule(new JavaTimeModule());
        // 以字串形式輸出日期，不使用數字時間戳
        objectMapper.disable(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS);

        out.write(objectMapper.writeValueAsString(responseData));
        out.flush();
    }

    // 新增產品
    public void add(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        try {
            String name = req.getParameter("name");
            String description = req.getParameter("description");
            BigDecimal price = new BigDecimal(req.getParameter("price"));
            int stockQuantity = Integer.parseInt(req.getParameter("stockQuantity"));
            int categoryId = Integer.parseInt(req.getParameter("categoryId"));
            String imageUrl = req.getParameter("imageUrl");
            Timestamp createdAt = Timestamp.valueOf(req.getParameter("createdAt"));
            Timestamp updatedAt = Timestamp.valueOf(req.getParameter("updatedAt"));

            Product product = new Product();
            product.setName(name);
            product.setDescription(description);
            product.setPrice(price);
            product.setStockQuantity(stockQuantity);
            product.setCategoryId(categoryId);
            product.setImageUrl(imageUrl);
            product.setCreatedAt(createdAt.toLocalDateTime());
            product.setUpdatedAt(updatedAt.toLocalDateTime());

            // 可改為呼叫 Service 層
            ProductDao productDao = new ProductDaoImpl();
            int rows = productDao.addProduct(product);
            Map<String, Object> response = new HashMap<>();
            response.put("message", rows > 0 ? "產品新增成功" : "產品新增失敗");
            sendJsonResponse(res, response);
        } catch(Exception e) {
            e.printStackTrace();
            Map<String, Object> response = new HashMap<>();
            response.put("message", "產品新增發生錯誤");
            sendJsonResponse(res, response);
        }
    }

    // 查詢產品
    public void find(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        ProductDao productDao = new ProductDaoImpl();
        List<Product> products = productDao.findAllProducts();
        Map<String, Object> response = new HashMap<>();
        response.put("products", products);
        sendJsonResponse(res, response);
    }

    // 修改產品
    public void update(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        try {
            int productId = Integer.parseInt(req.getParameter("productId"));
            String name = req.getParameter("name");
            String description = req.getParameter("description");
            BigDecimal price = new BigDecimal(req.getParameter("price"));
            int stockQuantity = Integer.parseInt(req.getParameter("stockQuantity"));
            int categoryId = Integer.parseInt(req.getParameter("categoryId"));
            String imageUrl = req.getParameter("imageUrl");
            Timestamp createdAt = Timestamp.valueOf(req.getParameter("createdAt"));
            Timestamp updatedAt = Timestamp.valueOf(req.getParameter("updatedAt"));

            Product product = new Product();
            product.setProductId(productId);
            product.setName(name);
            product.setDescription(description);
            product.setPrice(price);
            product.setStockQuantity(stockQuantity);
            product.setCategoryId(categoryId);
            product.setImageUrl(imageUrl);
            product.setCreatedAt(createdAt.toLocalDateTime());
            product.setUpdatedAt(updatedAt.toLocalDateTime());

            ProductDao productDao = new ProductDaoImpl();
            int rows = productDao.updateProduct(product);
            Map<String, Object> response = new HashMap<>();
            response.put("message", rows > 0 ? "產品更新成功" : "產品更新失敗");
            sendJsonResponse(res, response);
        } catch(Exception e) {
            e.printStackTrace();
            Map<String, Object> response = new HashMap<>();
            response.put("message", "產品更新發生錯誤");
            sendJsonResponse(res, response);
        }
    }

    // 刪除產品
    public void remove(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        try {
            int productId = Integer.parseInt(req.getParameter("productId"));
            ProductDao productDao = new ProductDaoImpl();
            int rows = productDao.deleteProduct(productId);
            Map<String, Object> response = new HashMap<>();
            response.put("message", rows > 0 ? "產品刪除成功" : "產品刪除失敗");
            sendJsonResponse(res, response);
        } catch(Exception e) {
            e.printStackTrace();
            Map<String, Object> response = new HashMap<>();
            response.put("message", "產品刪除發生錯誤");
            sendJsonResponse(res, response);
        }
    }
}
