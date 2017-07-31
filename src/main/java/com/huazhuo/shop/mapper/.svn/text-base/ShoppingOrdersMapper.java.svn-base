package com.huazhuo.shop.mapper;

import com.huazhuo.shop.model.ShoppingOrders;
import com.huazhuo.shop.model.ShoppingOrdersExample;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface ShoppingOrdersMapper {
    int countByExample(ShoppingOrdersExample example);

    int deleteByExample(ShoppingOrdersExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(ShoppingOrders record);

    int insertSelective(ShoppingOrders record);

    List<ShoppingOrders> selectByExampleWithBLOBs(ShoppingOrdersExample example);

    List<ShoppingOrders> selectByExample(ShoppingOrdersExample example);

    ShoppingOrders selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") ShoppingOrders record, @Param("example") ShoppingOrdersExample example);

    int updateByExampleWithBLOBs(@Param("record") ShoppingOrders record, @Param("example") ShoppingOrdersExample example);

    int updateByExample(@Param("record") ShoppingOrders record, @Param("example") ShoppingOrdersExample example);

    int updateByPrimaryKeySelective(ShoppingOrders record);

    int updateByPrimaryKeyWithBLOBs(ShoppingOrders record);

    int updateByPrimaryKey(ShoppingOrders record);
    
    List<Map<String,Object>> findShopOrdersList(Map<String,Object> map);

	List<Map<String, Object>> findShopOrdersListDetial(String orderId);

	List<Map<String, Object>> findCgReturnGoods(Integer productsId);

	boolean findCategoryId(Integer categoryId);
    
}