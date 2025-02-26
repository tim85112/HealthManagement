package dao.shop;

import model.shop.Order;

import java.util.List;

/**
 *
 */
public interface OrderDao {

    /**
     * 用於向數據庫中增加一份訂單紀錄
     * @param order 訂單數據以sysOrder實體類對象
     * @return  增加成功返回影響數據庫紀錄的行數,行數為0,說明增加失敗,行數大於0,說明增加成功
     */
    int addOrder(Order order);


    /**
     * 用於查詢數據庫中所有的訂單紀錄
     * @return  返回一個List集合,集合中存儲所有的訂單紀錄
     */
    List<Order> findAllOrders();

    /**
     * 用於更新數據庫中的訂單紀錄
     * @param order 訂單數據以Order實體類對象
     * @return 更新成功返回影響數據庫紀錄的行數,行數為0,說明更新失敗,行數大於0,說明更新成功
     */
    int updateOrder(Order order);

    /**
     * 用於刪除數據庫中的訂單紀錄
     * @param orderId 訂單編號
     * @return 刪除成功返回影響數據庫紀錄的行數,行數為0,說明刪除失敗,行數大於0,說明刪除成功
     */
    int deleteOrder(int orderId);
}
