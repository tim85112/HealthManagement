package dao.shop;

import model.shop.Product;
import java.util.List;

public interface ProductDao {
    /**
     * 用於向數據庫中增加一份產品紀錄
     * @param product 產品數據以sysProduct實體類對象
     * @return  增加成功返回影響數據庫紀錄的行數,行數為0,說明增加失敗,行數大於0,說明增加成功
     */
    int addProduct(Product product);

    /**
     * 用於查詢數據庫中所有的產品紀錄
     * @return 返回一個List集合,集合中存儲所有的產品紀錄
     */
    List<Product> findAllProducts();

    /**
     * 用於更新數據庫中的產品紀錄
     * @param product 產品數據以Product實體類對象
     * @return 更新成功返回影響數據庫紀錄的行數,行數為0,說明更新失敗,行數大於0,說明更新成功
     */
    int updateProduct(Product product);

    /**
     * 用於刪除數據庫中的產品紀錄
     * @param productId 產品編號
     * @return 刪除成功返回影響數據庫紀錄的行數,行數為0,說明刪除失敗,行數大於0,說明刪除成功
     */
    int deleteProduct(int productId);
}
