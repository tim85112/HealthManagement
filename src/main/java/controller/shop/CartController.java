package controller.shop;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.shop.Cart;
import service.shop.CartService;
import service.shop.impl.CartServiceImpl;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/api/shop/cart/*")
public class CartController extends ShopBaseController {

    private CartService cartService = new CartServiceImpl();

    private void sendJsonResponse(HttpServletResponse res, Map<String, Object> responseData) throws IOException {
        res.setContentType("application/json");
        res.setCharacterEncoding("UTF-8");
        PrintWriter out = res.getWriter();
        ObjectMapper objectMapper = new ObjectMapper();
        // 註冊 Java 8 日期時間模組
        objectMapper.registerModule(new JavaTimeModule());
        // 禁用寫入日期作為時間戳的特性
        objectMapper.disable(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS);

        out.write(objectMapper.writeValueAsString(responseData));
        out.flush();
    }

    // 新增購物車項目
    public void add(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        try {
            int userId = Integer.parseInt(req.getParameter("userId"));
            int productId = Integer.parseInt(req.getParameter("productId"));
            int quantity = Integer.parseInt(req.getParameter("quantity"));
            Timestamp createdAt = Timestamp.valueOf(req.getParameter("createdAt"));

            Cart cart = new Cart();
            cart.setUserId(userId);
            cart.setProductId(productId);
            cart.setQuantity(quantity);
            cart.setCreatedAt(createdAt);

            int rows = cartService.addCart(cart);
            Map<String, Object> response = new HashMap<>();
            response.put("message", rows > 0 ? "購物車新增成功" : "購物車新增失敗");
            sendJsonResponse(res, response);
        } catch (Exception e) {
            e.printStackTrace();
            Map<String, Object> response = new HashMap<>();
            response.put("message", "購物車新增發生錯誤");
            sendJsonResponse(res, response);
        }
    }

    // 查詢所有購物車項目
    public void find(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        List<Cart> carts = cartService.findAllCarts();
        Map<String, Object> response = new HashMap<>();
        response.put("carts", carts);
        sendJsonResponse(res, response);
    }

    // 修改購物車項目
    public void update(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        try {
            int cartId = Integer.parseInt(req.getParameter("cartId"));
            int userId = Integer.parseInt(req.getParameter("userId"));
            int productId = Integer.parseInt(req.getParameter("productId"));
            int quantity = Integer.parseInt(req.getParameter("quantity"));
            Timestamp createdAt = Timestamp.valueOf(req.getParameter("createdAt"));

            Cart cart = new Cart();
            cart.setCartId(cartId);
            cart.setUserId(userId);
            cart.setProductId(productId);
            cart.setQuantity(quantity);
            cart.setCreatedAt(createdAt);

            int rows = cartService.updateCart(cart);
            Map<String, Object> response = new HashMap<>();
            response.put("message", rows > 0 ? "購物車更新成功" : "購物車更新失敗");
            sendJsonResponse(res, response);
        } catch (Exception e) {
            e.printStackTrace();
            Map<String, Object> response = new HashMap<>();
            response.put("message", "購物車更新發生錯誤");
            sendJsonResponse(res, response);
        }
    }

    // 刪除購物車項目
    public void remove(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        try {
            int cartId = Integer.parseInt(req.getParameter("cartId"));
            int rows = cartService.deleteCart(cartId);
            Map<String, Object> response = new HashMap<>();
            response.put("message", rows > 0 ? "購物車刪除成功" : "購物車刪除失敗");
            sendJsonResponse(res, response);
        } catch (Exception e) {
            e.printStackTrace();
            Map<String, Object> response = new HashMap<>();
            response.put("message", "購物車刪除發生錯誤");
            sendJsonResponse(res, response);
        }
    }
}
