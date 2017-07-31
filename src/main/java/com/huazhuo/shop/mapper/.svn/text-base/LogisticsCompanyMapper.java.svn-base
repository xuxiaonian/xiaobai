package com.huazhuo.shop.mapper;

import com.huazhuo.shop.model.LogisticsCompany;
import com.huazhuo.shop.model.LogisticsCompanyExample;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface LogisticsCompanyMapper {
    int countByExample(LogisticsCompanyExample example);

    int deleteByExample(LogisticsCompanyExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(LogisticsCompany record);

    int insertSelective(LogisticsCompany record);

    List<LogisticsCompany> selectByExample(LogisticsCompanyExample example);

    LogisticsCompany selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") LogisticsCompany record, @Param("example") LogisticsCompanyExample example);

    int updateByExample(@Param("record") LogisticsCompany record, @Param("example") LogisticsCompanyExample example);

    int updateByPrimaryKeySelective(LogisticsCompany record);

    int updateByPrimaryKey(LogisticsCompany record);
    
    List<LogisticsCompany> findLogisticsCompanyByName(String logisticsName);
    List<Map<String,Object>> findOrderById(String orderNum);
}