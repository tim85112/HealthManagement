package controller.shop;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import dao.shop.OrderDao;
import dao.shop.impl.OrderDaoImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.shop.Order;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/api/shop/order/*")
public class OrderController extends ShopBaseController {

    // 回傳 JSON 資料
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

    // 新增訂單
    public void add(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        try {
            int userId = Integer.parseInt(req.getParameter("userId"));
            BigDecimal totalAmount = new BigDecimal(req.getParameter("totalAmount"));
            int statusId = Integer.parseInt(req.getParameter("statusId"));
            Timestamp createdAt = Timestamp.valueOf(req.getParameter("createdAt"));

            Order order = new Order();
            order.setUserId(userId);
            order.setTotalAmount(totalAmount);
            order.setStatusId(statusId);
            order.setCreatedAt(createdAt);

            OrderDao orderDao = new OrderDaoImpl();
            int rows = orderDao.addOrder(order);

            Map<String, Object> response = new HashMap<>();
            response.put("message", rows > 0 ? "訂單新增成功" : "訂單新增失敗");
            sendJsonResponse(res, response);
        } catch (Exception e) {
            e.printStackTrace();
            Map<String, Object> response = new HashMap<>();
            response.put("message", "訂單新增發生錯誤");
            sendJsonResponse(res, response);
        }
    }

    // 查詢所有訂單
    public void find(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        OrderDao orderDao = new OrderDaoImpl();
        List<Order> orders = orderDao.findAllOrders();
        Map<String, Object> response = new HashMap<>();
        response.put("orders", orders);
        sendJsonResponse(res, response);
    }

    // 修改訂單
    public void update(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        try {
            int orderId = Integer.parseInt(req.getParameter("orderId"));
            int userId = Integer.parseInt(req.getParameter("userId"));
            BigDecimal totalAmount = new BigDecimal(req.getParameter("totalAmount"));
            int statusId = Integer.parseInt(req.getParameter("statusId"));
            Timestamp createdAt = Timestamp.valueOf(req.getParameter("createdAt"));

            Order order = new Order();
            order.setOrderId(orderId);
            order.setUserId(userId);
            order.setTotalAmount(totalAmount);
            order.setStatusId(statusId);
            order.setCreatedAt(createdAt);

            OrderDao orderDao = new OrderDaoImpl();
            int rows = orderDao.updateOrder(order);

            Map<String, Object> response = new HashMap<>();
            response.put("message", rows > 0 ? "訂單更新成功" : "訂單更新失敗");
            sendJsonResponse(res, response);
        } catch (Exception e) {
            e.printStackTrace();
            Map<String, Object> response = new HashMap<>();
            response.put("message", "訂單更新發生錯誤");
            sendJsonResponse(res, response);
        }
    }

    // 刪除訂單
    public void remove(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        try {
            int orderId = Integer.parseInt(req.getParameter("orderId"));
            OrderDao orderDao = new OrderDaoImpl();
            int rows = orderDao.deleteOrder(orderId);

            Map<String, Object> response = new HashMap<>();
            response.put("message", rows > 0 ? "訂單刪除成功" : "訂單刪除失敗");
            sendJsonResponse(res, response);
        } catch (Exception e) {
            e.printStackTrace();
            Map<String, Object> response = new HashMap<>();
            response.put("message", "訂單刪除發生錯誤");
            sendJsonResponse(res, response);
        }
    }
}

