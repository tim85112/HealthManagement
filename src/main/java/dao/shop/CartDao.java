package dao.shop;

import model.shop.Cart;
import java.util.List;

public interface CartDao {
    /**
     * 用於向數據庫中增加一份購物車紀錄
     * @param cart 購物車數據以Cart實體類對象
     * @return 增加成功返回影響數據庫紀錄的行數,行數為0,說明增加失敗,行數大於0,說明增加成功
     */
    int addCart(Cart cart);

    /**
     * 用於查詢數據庫中所有的購物車紀錄
     * @return 返回一個List集合,集合中存儲所有的購物車紀錄
     */
    List<Cart> findAllCarts();

    /**
     * 用於更新數據庫中的購物車紀錄
     * @param cart 購物車數據以Cart實體類對象
     * @return 更新成功返回影響數據庫紀錄的行數,行數為0,說明更新失敗,行數大於0,說明更新成功
     */
    int updateCart(Cart cart);

    /**
     * 用於刪除數據庫中的購物車紀錄
     * @param cartId 購物車編號
     * @return 刪除成功返回影響數據庫紀錄的行數,行數為0,說明刪除失敗,行數大於0,說明刪除成功
     */
    int deleteCart(int cartId);
}
