package com.huazhuo.shop.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ShoppingOrdersExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public ShoppingOrdersExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andIdIsNull() {
            addCriterion("id is null");
            return (Criteria) this;
        }

        public Criteria andIdIsNotNull() {
            addCriterion("id is not null");
            return (Criteria) this;
        }

        public Criteria andIdEqualTo(Integer value) {
            addCriterion("id =", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotEqualTo(Integer value) {
            addCriterion("id <>", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThan(Integer value) {
            addCriterion("id >", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("id >=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThan(Integer value) {
            addCriterion("id <", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThanOrEqualTo(Integer value) {
            addCriterion("id <=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdIn(List<Integer> values) {
            addCriterion("id in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotIn(List<Integer> values) {
            addCriterion("id not in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdBetween(Integer value1, Integer value2) {
            addCriterion("id between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotBetween(Integer value1, Integer value2) {
            addCriterion("id not between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andOrderNumberIsNull() {
            addCriterion("order_number is null");
            return (Criteria) this;
        }

        public Criteria andOrderNumberIsNotNull() {
            addCriterion("order_number is not null");
            return (Criteria) this;
        }

        public Criteria andOrderNumberEqualTo(String value) {
            addCriterion("order_number =", value, "orderNumber");
            return (Criteria) this;
        }

        public Criteria andOrderNumberNotEqualTo(String value) {
            addCriterion("order_number <>", value, "orderNumber");
            return (Criteria) this;
        }

        public Criteria andOrderNumberGreaterThan(String value) {
            addCriterion("order_number >", value, "orderNumber");
            return (Criteria) this;
        }

        public Criteria andOrderNumberGreaterThanOrEqualTo(String value) {
            addCriterion("order_number >=", value, "orderNumber");
            return (Criteria) this;
        }

        public Criteria andOrderNumberLessThan(String value) {
            addCriterion("order_number <", value, "orderNumber");
            return (Criteria) this;
        }

        public Criteria andOrderNumberLessThanOrEqualTo(String value) {
            addCriterion("order_number <=", value, "orderNumber");
            return (Criteria) this;
        }

        public Criteria andOrderNumberLike(String value) {
            addCriterion("order_number like", value, "orderNumber");
            return (Criteria) this;
        }

        public Criteria andOrderNumberNotLike(String value) {
            addCriterion("order_number not like", value, "orderNumber");
            return (Criteria) this;
        }

        public Criteria andOrderNumberIn(List<String> values) {
            addCriterion("order_number in", values, "orderNumber");
            return (Criteria) this;
        }

        public Criteria andOrderNumberNotIn(List<String> values) {
            addCriterion("order_number not in", values, "orderNumber");
            return (Criteria) this;
        }

        public Criteria andOrderNumberBetween(String value1, String value2) {
            addCriterion("order_number between", value1, value2, "orderNumber");
            return (Criteria) this;
        }

        public Criteria andOrderNumberNotBetween(String value1, String value2) {
            addCriterion("order_number not between", value1, value2, "orderNumber");
            return (Criteria) this;
        }

        public Criteria andLogisticsNumberIsNull() {
            addCriterion("logistics_number is null");
            return (Criteria) this;
        }

        public Criteria andLogisticsNumberIsNotNull() {
            addCriterion("logistics_number is not null");
            return (Criteria) this;
        }

        public Criteria andLogisticsNumberEqualTo(String value) {
            addCriterion("logistics_number =", value, "logisticsNumber");
            return (Criteria) this;
        }

        public Criteria andLogisticsNumberNotEqualTo(String value) {
            addCriterion("logistics_number <>", value, "logisticsNumber");
            return (Criteria) this;
        }

        public Criteria andLogisticsNumberGreaterThan(String value) {
            addCriterion("logistics_number >", value, "logisticsNumber");
            return (Criteria) this;
        }

        public Criteria andLogisticsNumberGreaterThanOrEqualTo(String value) {
            addCriterion("logistics_number >=", value, "logisticsNumber");
            return (Criteria) this;
        }

        public Criteria andLogisticsNumberLessThan(String value) {
            addCriterion("logistics_number <", value, "logisticsNumber");
            return (Criteria) this;
        }

        public Criteria andLogisticsNumberLessThanOrEqualTo(String value) {
            addCriterion("logistics_number <=", value, "logisticsNumber");
            return (Criteria) this;
        }

        public Criteria andLogisticsNumberLike(String value) {
            addCriterion("logistics_number like", value, "logisticsNumber");
            return (Criteria) this;
        }

        public Criteria andLogisticsNumberNotLike(String value) {
            addCriterion("logistics_number not like", value, "logisticsNumber");
            return (Criteria) this;
        }

        public Criteria andLogisticsNumberIn(List<String> values) {
            addCriterion("logistics_number in", values, "logisticsNumber");
            return (Criteria) this;
        }

        public Criteria andLogisticsNumberNotIn(List<String> values) {
            addCriterion("logistics_number not in", values, "logisticsNumber");
            return (Criteria) this;
        }

        public Criteria andLogisticsNumberBetween(String value1, String value2) {
            addCriterion("logistics_number between", value1, value2, "logisticsNumber");
            return (Criteria) this;
        }

        public Criteria andLogisticsNumberNotBetween(String value1, String value2) {
            addCriterion("logistics_number not between", value1, value2, "logisticsNumber");
            return (Criteria) this;
        }

        public Criteria andTripleOrderNumberIsNull() {
            addCriterion("triple_order_number is null");
            return (Criteria) this;
        }

        public Criteria andTripleOrderNumberIsNotNull() {
            addCriterion("triple_order_number is not null");
            return (Criteria) this;
        }

        public Criteria andTripleOrderNumberEqualTo(String value) {
            addCriterion("triple_order_number =", value, "tripleOrderNumber");
            return (Criteria) this;
        }

        public Criteria andTripleOrderNumberNotEqualTo(String value) {
            addCriterion("triple_order_number <>", value, "tripleOrderNumber");
            return (Criteria) this;
        }

        public Criteria andTripleOrderNumberGreaterThan(String value) {
            addCriterion("triple_order_number >", value, "tripleOrderNumber");
            return (Criteria) this;
        }

        public Criteria andTripleOrderNumberGreaterThanOrEqualTo(String value) {
            addCriterion("triple_order_number >=", value, "tripleOrderNumber");
            return (Criteria) this;
        }

        public Criteria andTripleOrderNumberLessThan(String value) {
            addCriterion("triple_order_number <", value, "tripleOrderNumber");
            return (Criteria) this;
        }

        public Criteria andTripleOrderNumberLessThanOrEqualTo(String value) {
            addCriterion("triple_order_number <=", value, "tripleOrderNumber");
            return (Criteria) this;
        }

        public Criteria andTripleOrderNumberLike(String value) {
            addCriterion("triple_order_number like", value, "tripleOrderNumber");
            return (Criteria) this;
        }

        public Criteria andTripleOrderNumberNotLike(String value) {
            addCriterion("triple_order_number not like", value, "tripleOrderNumber");
            return (Criteria) this;
        }

        public Criteria andTripleOrderNumberIn(List<String> values) {
            addCriterion("triple_order_number in", values, "tripleOrderNumber");
            return (Criteria) this;
        }

        public Criteria andTripleOrderNumberNotIn(List<String> values) {
            addCriterion("triple_order_number not in", values, "tripleOrderNumber");
            return (Criteria) this;
        }

        public Criteria andTripleOrderNumberBetween(String value1, String value2) {
            addCriterion("triple_order_number between", value1, value2, "tripleOrderNumber");
            return (Criteria) this;
        }

        public Criteria andTripleOrderNumberNotBetween(String value1, String value2) {
            addCriterion("triple_order_number not between", value1, value2, "tripleOrderNumber");
            return (Criteria) this;
        }

        public Criteria andOrderStatusIsNull() {
            addCriterion("order_status is null");
            return (Criteria) this;
        }

        public Criteria andOrderStatusIsNotNull() {
            addCriterion("order_status is not null");
            return (Criteria) this;
        }

        public Criteria andOrderStatusEqualTo(Integer value) {
            addCriterion("order_status =", value, "orderStatus");
            return (Criteria) this;
        }

        public Criteria andOrderStatusNotEqualTo(Integer value) {
            addCriterion("order_status <>", value, "orderStatus");
            return (Criteria) this;
        }

        public Criteria andOrderStatusGreaterThan(Integer value) {
            addCriterion("order_status >", value, "orderStatus");
            return (Criteria) this;
        }

        public Criteria andOrderStatusGreaterThanOrEqualTo(Integer value) {
            addCriterion("order_status >=", value, "orderStatus");
            return (Criteria) this;
        }

        public Criteria andOrderStatusLessThan(Integer value) {
            addCriterion("order_status <", value, "orderStatus");
            return (Criteria) this;
        }

        public Criteria andOrderStatusLessThanOrEqualTo(Integer value) {
            addCriterion("order_status <=", value, "orderStatus");
            return (Criteria) this;
        }

        public Criteria andOrderStatusIn(List<Integer> values) {
            addCriterion("order_status in", values, "orderStatus");
            return (Criteria) this;
        }

        public Criteria andOrderStatusNotIn(List<Integer> values) {
            addCriterion("order_status not in", values, "orderStatus");
            return (Criteria) this;
        }

        public Criteria andOrderStatusBetween(Integer value1, Integer value2) {
            addCriterion("order_status between", value1, value2, "orderStatus");
            return (Criteria) this;
        }

        public Criteria andOrderStatusNotBetween(Integer value1, Integer value2) {
            addCriterion("order_status not between", value1, value2, "orderStatus");
            return (Criteria) this;
        }

        public Criteria andPaymentStatusIsNull() {
            addCriterion("payment_status is null");
            return (Criteria) this;
        }

        public Criteria andPaymentStatusIsNotNull() {
            addCriterion("payment_status is not null");
            return (Criteria) this;
        }

        public Criteria andPaymentStatusEqualTo(Integer value) {
            addCriterion("payment_status =", value, "paymentStatus");
            return (Criteria) this;
        }

        public Criteria andPaymentStatusNotEqualTo(Integer value) {
            addCriterion("payment_status <>", value, "paymentStatus");
            return (Criteria) this;
        }

        public Criteria andPaymentStatusGreaterThan(Integer value) {
            addCriterion("payment_status >", value, "paymentStatus");
            return (Criteria) this;
        }

        public Criteria andPaymentStatusGreaterThanOrEqualTo(Integer value) {
            addCriterion("payment_status >=", value, "paymentStatus");
            return (Criteria) this;
        }

        public Criteria andPaymentStatusLessThan(Integer value) {
            addCriterion("payment_status <", value, "paymentStatus");
            return (Criteria) this;
        }

        public Criteria andPaymentStatusLessThanOrEqualTo(Integer value) {
            addCriterion("payment_status <=", value, "paymentStatus");
            return (Criteria) this;
        }

        public Criteria andPaymentStatusIn(List<Integer> values) {
            addCriterion("payment_status in", values, "paymentStatus");
            return (Criteria) this;
        }

        public Criteria andPaymentStatusNotIn(List<Integer> values) {
            addCriterion("payment_status not in", values, "paymentStatus");
            return (Criteria) this;
        }

        public Criteria andPaymentStatusBetween(Integer value1, Integer value2) {
            addCriterion("payment_status between", value1, value2, "paymentStatus");
            return (Criteria) this;
        }

        public Criteria andPaymentStatusNotBetween(Integer value1, Integer value2) {
            addCriterion("payment_status not between", value1, value2, "paymentStatus");
            return (Criteria) this;
        }

        public Criteria andBuyCoutsIsNull() {
            addCriterion("buy_couts is null");
            return (Criteria) this;
        }

        public Criteria andBuyCoutsIsNotNull() {
            addCriterion("buy_couts is not null");
            return (Criteria) this;
        }

        public Criteria andBuyCoutsEqualTo(Integer value) {
            addCriterion("buy_couts =", value, "buyCouts");
            return (Criteria) this;
        }

        public Criteria andBuyCoutsNotEqualTo(Integer value) {
            addCriterion("buy_couts <>", value, "buyCouts");
            return (Criteria) this;
        }

        public Criteria andBuyCoutsGreaterThan(Integer value) {
            addCriterion("buy_couts >", value, "buyCouts");
            return (Criteria) this;
        }

        public Criteria andBuyCoutsGreaterThanOrEqualTo(Integer value) {
            addCriterion("buy_couts >=", value, "buyCouts");
            return (Criteria) this;
        }

        public Criteria andBuyCoutsLessThan(Integer value) {
            addCriterion("buy_couts <", value, "buyCouts");
            return (Criteria) this;
        }

        public Criteria andBuyCoutsLessThanOrEqualTo(Integer value) {
            addCriterion("buy_couts <=", value, "buyCouts");
            return (Criteria) this;
        }

        public Criteria andBuyCoutsIn(List<Integer> values) {
            addCriterion("buy_couts in", values, "buyCouts");
            return (Criteria) this;
        }

        public Criteria andBuyCoutsNotIn(List<Integer> values) {
            addCriterion("buy_couts not in", values, "buyCouts");
            return (Criteria) this;
        }

        public Criteria andBuyCoutsBetween(Integer value1, Integer value2) {
            addCriterion("buy_couts between", value1, value2, "buyCouts");
            return (Criteria) this;
        }

        public Criteria andBuyCoutsNotBetween(Integer value1, Integer value2) {
            addCriterion("buy_couts not between", value1, value2, "buyCouts");
            return (Criteria) this;
        }

        public Criteria andMobileUserIdIsNull() {
            addCriterion("mobile_user_id is null");
            return (Criteria) this;
        }

        public Criteria andMobileUserIdIsNotNull() {
            addCriterion("mobile_user_id is not null");
            return (Criteria) this;
        }

        public Criteria andMobileUserIdEqualTo(Integer value) {
            addCriterion("mobile_user_id =", value, "mobileUserId");
            return (Criteria) this;
        }

        public Criteria andMobileUserIdNotEqualTo(Integer value) {
            addCriterion("mobile_user_id <>", value, "mobileUserId");
            return (Criteria) this;
        }

        public Criteria andMobileUserIdGreaterThan(Integer value) {
            addCriterion("mobile_user_id >", value, "mobileUserId");
            return (Criteria) this;
        }

        public Criteria andMobileUserIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("mobile_user_id >=", value, "mobileUserId");
            return (Criteria) this;
        }

        public Criteria andMobileUserIdLessThan(Integer value) {
            addCriterion("mobile_user_id <", value, "mobileUserId");
            return (Criteria) this;
        }

        public Criteria andMobileUserIdLessThanOrEqualTo(Integer value) {
            addCriterion("mobile_user_id <=", value, "mobileUserId");
            return (Criteria) this;
        }

        public Criteria andMobileUserIdIn(List<Integer> values) {
            addCriterion("mobile_user_id in", values, "mobileUserId");
            return (Criteria) this;
        }

        public Criteria andMobileUserIdNotIn(List<Integer> values) {
            addCriterion("mobile_user_id not in", values, "mobileUserId");
            return (Criteria) this;
        }

        public Criteria andMobileUserIdBetween(Integer value1, Integer value2) {
            addCriterion("mobile_user_id between", value1, value2, "mobileUserId");
            return (Criteria) this;
        }

        public Criteria andMobileUserIdNotBetween(Integer value1, Integer value2) {
            addCriterion("mobile_user_id not between", value1, value2, "mobileUserId");
            return (Criteria) this;
        }

        public Criteria andShoppingProductIdIsNull() {
            addCriterion("shopping_product_id is null");
            return (Criteria) this;
        }

        public Criteria andShoppingProductIdIsNotNull() {
            addCriterion("shopping_product_id is not null");
            return (Criteria) this;
        }

        public Criteria andShoppingProductIdEqualTo(Integer value) {
            addCriterion("shopping_product_id =", value, "shoppingProductId");
            return (Criteria) this;
        }

        public Criteria andShoppingProductIdNotEqualTo(Integer value) {
            addCriterion("shopping_product_id <>", value, "shoppingProductId");
            return (Criteria) this;
        }

        public Criteria andShoppingProductIdGreaterThan(Integer value) {
            addCriterion("shopping_product_id >", value, "shoppingProductId");
            return (Criteria) this;
        }

        public Criteria andShoppingProductIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("shopping_product_id >=", value, "shoppingProductId");
            return (Criteria) this;
        }

        public Criteria andShoppingProductIdLessThan(Integer value) {
            addCriterion("shopping_product_id <", value, "shoppingProductId");
            return (Criteria) this;
        }

        public Criteria andShoppingProductIdLessThanOrEqualTo(Integer value) {
            addCriterion("shopping_product_id <=", value, "shoppingProductId");
            return (Criteria) this;
        }

        public Criteria andShoppingProductIdIn(List<Integer> values) {
            addCriterion("shopping_product_id in", values, "shoppingProductId");
            return (Criteria) this;
        }

        public Criteria andShoppingProductIdNotIn(List<Integer> values) {
            addCriterion("shopping_product_id not in", values, "shoppingProductId");
            return (Criteria) this;
        }

        public Criteria andShoppingProductIdBetween(Integer value1, Integer value2) {
            addCriterion("shopping_product_id between", value1, value2, "shoppingProductId");
            return (Criteria) this;
        }

        public Criteria andShoppingProductIdNotBetween(Integer value1, Integer value2) {
            addCriterion("shopping_product_id not between", value1, value2, "shoppingProductId");
            return (Criteria) this;
        }

        public Criteria andShoppingAddressIdIsNull() {
            addCriterion("shopping_address_id is null");
            return (Criteria) this;
        }

        public Criteria andShoppingAddressIdIsNotNull() {
            addCriterion("shopping_address_id is not null");
            return (Criteria) this;
        }

        public Criteria andShoppingAddressIdEqualTo(Integer value) {
            addCriterion("shopping_address_id =", value, "shoppingAddressId");
            return (Criteria) this;
        }

        public Criteria andShoppingAddressIdNotEqualTo(Integer value) {
            addCriterion("shopping_address_id <>", value, "shoppingAddressId");
            return (Criteria) this;
        }

        public Criteria andShoppingAddressIdGreaterThan(Integer value) {
            addCriterion("shopping_address_id >", value, "shoppingAddressId");
            return (Criteria) this;
        }

        public Criteria andShoppingAddressIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("shopping_address_id >=", value, "shoppingAddressId");
            return (Criteria) this;
        }

        public Criteria andShoppingAddressIdLessThan(Integer value) {
            addCriterion("shopping_address_id <", value, "shoppingAddressId");
            return (Criteria) this;
        }

        public Criteria andShoppingAddressIdLessThanOrEqualTo(Integer value) {
            addCriterion("shopping_address_id <=", value, "shoppingAddressId");
            return (Criteria) this;
        }

        public Criteria andShoppingAddressIdIn(List<Integer> values) {
            addCriterion("shopping_address_id in", values, "shoppingAddressId");
            return (Criteria) this;
        }

        public Criteria andShoppingAddressIdNotIn(List<Integer> values) {
            addCriterion("shopping_address_id not in", values, "shoppingAddressId");
            return (Criteria) this;
        }

        public Criteria andShoppingAddressIdBetween(Integer value1, Integer value2) {
            addCriterion("shopping_address_id between", value1, value2, "shoppingAddressId");
            return (Criteria) this;
        }

        public Criteria andShoppingAddressIdNotBetween(Integer value1, Integer value2) {
            addCriterion("shopping_address_id not between", value1, value2, "shoppingAddressId");
            return (Criteria) this;
        }

        public Criteria andCreatedAtIsNull() {
            addCriterion("created_at is null");
            return (Criteria) this;
        }

        public Criteria andCreatedAtIsNotNull() {
            addCriterion("created_at is not null");
            return (Criteria) this;
        }

        public Criteria andCreatedAtEqualTo(Date value) {
            addCriterion("created_at =", value, "createdAt");
            return (Criteria) this;
        }

        public Criteria andCreatedAtNotEqualTo(Date value) {
            addCriterion("created_at <>", value, "createdAt");
            return (Criteria) this;
        }

        public Criteria andCreatedAtGreaterThan(Date value) {
            addCriterion("created_at >", value, "createdAt");
            return (Criteria) this;
        }

        public Criteria andCreatedAtGreaterThanOrEqualTo(Date value) {
            addCriterion("created_at >=", value, "createdAt");
            return (Criteria) this;
        }

        public Criteria andCreatedAtLessThan(Date value) {
            addCriterion("created_at <", value, "createdAt");
            return (Criteria) this;
        }

        public Criteria andCreatedAtLessThanOrEqualTo(Date value) {
            addCriterion("created_at <=", value, "createdAt");
            return (Criteria) this;
        }

        public Criteria andCreatedAtIn(List<Date> values) {
            addCriterion("created_at in", values, "createdAt");
            return (Criteria) this;
        }

        public Criteria andCreatedAtNotIn(List<Date> values) {
            addCriterion("created_at not in", values, "createdAt");
            return (Criteria) this;
        }

        public Criteria andCreatedAtBetween(Date value1, Date value2) {
            addCriterion("created_at between", value1, value2, "createdAt");
            return (Criteria) this;
        }

        public Criteria andCreatedAtNotBetween(Date value1, Date value2) {
            addCriterion("created_at not between", value1, value2, "createdAt");
            return (Criteria) this;
        }

        public Criteria andUpdatedAtIsNull() {
            addCriterion("updated_at is null");
            return (Criteria) this;
        }

        public Criteria andUpdatedAtIsNotNull() {
            addCriterion("updated_at is not null");
            return (Criteria) this;
        }

        public Criteria andUpdatedAtEqualTo(Date value) {
            addCriterion("updated_at =", value, "updatedAt");
            return (Criteria) this;
        }

        public Criteria andUpdatedAtNotEqualTo(Date value) {
            addCriterion("updated_at <>", value, "updatedAt");
            return (Criteria) this;
        }

        public Criteria andUpdatedAtGreaterThan(Date value) {
            addCriterion("updated_at >", value, "updatedAt");
            return (Criteria) this;
        }

        public Criteria andUpdatedAtGreaterThanOrEqualTo(Date value) {
            addCriterion("updated_at >=", value, "updatedAt");
            return (Criteria) this;
        }

        public Criteria andUpdatedAtLessThan(Date value) {
            addCriterion("updated_at <", value, "updatedAt");
            return (Criteria) this;
        }

        public Criteria andUpdatedAtLessThanOrEqualTo(Date value) {
            addCriterion("updated_at <=", value, "updatedAt");
            return (Criteria) this;
        }

        public Criteria andUpdatedAtIn(List<Date> values) {
            addCriterion("updated_at in", values, "updatedAt");
            return (Criteria) this;
        }

        public Criteria andUpdatedAtNotIn(List<Date> values) {
            addCriterion("updated_at not in", values, "updatedAt");
            return (Criteria) this;
        }

        public Criteria andUpdatedAtBetween(Date value1, Date value2) {
            addCriterion("updated_at between", value1, value2, "updatedAt");
            return (Criteria) this;
        }

        public Criteria andUpdatedAtNotBetween(Date value1, Date value2) {
            addCriterion("updated_at not between", value1, value2, "updatedAt");
            return (Criteria) this;
        }

        public Criteria andLogisticsCompanyIsNull() {
            addCriterion("logistics_company is null");
            return (Criteria) this;
        }

        public Criteria andLogisticsCompanyIsNotNull() {
            addCriterion("logistics_company is not null");
            return (Criteria) this;
        }

        public Criteria andLogisticsCompanyEqualTo(String value) {
            addCriterion("logistics_company =", value, "logisticsCompany");
            return (Criteria) this;
        }

        public Criteria andLogisticsCompanyNotEqualTo(String value) {
            addCriterion("logistics_company <>", value, "logisticsCompany");
            return (Criteria) this;
        }

        public Criteria andLogisticsCompanyGreaterThan(String value) {
            addCriterion("logistics_company >", value, "logisticsCompany");
            return (Criteria) this;
        }

        public Criteria andLogisticsCompanyGreaterThanOrEqualTo(String value) {
            addCriterion("logistics_company >=", value, "logisticsCompany");
            return (Criteria) this;
        }

        public Criteria andLogisticsCompanyLessThan(String value) {
            addCriterion("logistics_company <", value, "logisticsCompany");
            return (Criteria) this;
        }

        public Criteria andLogisticsCompanyLessThanOrEqualTo(String value) {
            addCriterion("logistics_company <=", value, "logisticsCompany");
            return (Criteria) this;
        }

        public Criteria andLogisticsCompanyLike(String value) {
            addCriterion("logistics_company like", value, "logisticsCompany");
            return (Criteria) this;
        }

        public Criteria andLogisticsCompanyNotLike(String value) {
            addCriterion("logistics_company not like", value, "logisticsCompany");
            return (Criteria) this;
        }

        public Criteria andLogisticsCompanyIn(List<String> values) {
            addCriterion("logistics_company in", values, "logisticsCompany");
            return (Criteria) this;
        }

        public Criteria andLogisticsCompanyNotIn(List<String> values) {
            addCriterion("logistics_company not in", values, "logisticsCompany");
            return (Criteria) this;
        }

        public Criteria andLogisticsCompanyBetween(String value1, String value2) {
            addCriterion("logistics_company between", value1, value2, "logisticsCompany");
            return (Criteria) this;
        }

        public Criteria andLogisticsCompanyNotBetween(String value1, String value2) {
            addCriterion("logistics_company not between", value1, value2, "logisticsCompany");
            return (Criteria) this;
        }

        public Criteria andOrderTimeIsNull() {
            addCriterion("order_time is null");
            return (Criteria) this;
        }

        public Criteria andOrderTimeIsNotNull() {
            addCriterion("order_time is not null");
            return (Criteria) this;
        }

        public Criteria andOrderTimeEqualTo(Date value) {
            addCriterion("order_time =", value, "orderTime");
            return (Criteria) this;
        }

        public Criteria andOrderTimeNotEqualTo(Date value) {
            addCriterion("order_time <>", value, "orderTime");
            return (Criteria) this;
        }

        public Criteria andOrderTimeGreaterThan(Date value) {
            addCriterion("order_time >", value, "orderTime");
            return (Criteria) this;
        }

        public Criteria andOrderTimeGreaterThanOrEqualTo(Date value) {
            addCriterion("order_time >=", value, "orderTime");
            return (Criteria) this;
        }

        public Criteria andOrderTimeLessThan(Date value) {
            addCriterion("order_time <", value, "orderTime");
            return (Criteria) this;
        }

        public Criteria andOrderTimeLessThanOrEqualTo(Date value) {
            addCriterion("order_time <=", value, "orderTime");
            return (Criteria) this;
        }

        public Criteria andOrderTimeIn(List<Date> values) {
            addCriterion("order_time in", values, "orderTime");
            return (Criteria) this;
        }

        public Criteria andOrderTimeNotIn(List<Date> values) {
            addCriterion("order_time not in", values, "orderTime");
            return (Criteria) this;
        }

        public Criteria andOrderTimeBetween(Date value1, Date value2) {
            addCriterion("order_time between", value1, value2, "orderTime");
            return (Criteria) this;
        }

        public Criteria andOrderTimeNotBetween(Date value1, Date value2) {
            addCriterion("order_time not between", value1, value2, "orderTime");
            return (Criteria) this;
        }

        public Criteria andDeleteStatusIsNull() {
            addCriterion("delete_status is null");
            return (Criteria) this;
        }

        public Criteria andDeleteStatusIsNotNull() {
            addCriterion("delete_status is not null");
            return (Criteria) this;
        }

        public Criteria andDeleteStatusEqualTo(Integer value) {
            addCriterion("delete_status =", value, "deleteStatus");
            return (Criteria) this;
        }

        public Criteria andDeleteStatusNotEqualTo(Integer value) {
            addCriterion("delete_status <>", value, "deleteStatus");
            return (Criteria) this;
        }

        public Criteria andDeleteStatusGreaterThan(Integer value) {
            addCriterion("delete_status >", value, "deleteStatus");
            return (Criteria) this;
        }

        public Criteria andDeleteStatusGreaterThanOrEqualTo(Integer value) {
            addCriterion("delete_status >=", value, "deleteStatus");
            return (Criteria) this;
        }

        public Criteria andDeleteStatusLessThan(Integer value) {
            addCriterion("delete_status <", value, "deleteStatus");
            return (Criteria) this;
        }

        public Criteria andDeleteStatusLessThanOrEqualTo(Integer value) {
            addCriterion("delete_status <=", value, "deleteStatus");
            return (Criteria) this;
        }

        public Criteria andDeleteStatusIn(List<Integer> values) {
            addCriterion("delete_status in", values, "deleteStatus");
            return (Criteria) this;
        }

        public Criteria andDeleteStatusNotIn(List<Integer> values) {
            addCriterion("delete_status not in", values, "deleteStatus");
            return (Criteria) this;
        }

        public Criteria andDeleteStatusBetween(Integer value1, Integer value2) {
            addCriterion("delete_status between", value1, value2, "deleteStatus");
            return (Criteria) this;
        }

        public Criteria andDeleteStatusNotBetween(Integer value1, Integer value2) {
            addCriterion("delete_status not between", value1, value2, "deleteStatus");
            return (Criteria) this;
        }

        public Criteria andPlatformSerialNumberIsNull() {
            addCriterion("platform_serial_number is null");
            return (Criteria) this;
        }

        public Criteria andPlatformSerialNumberIsNotNull() {
            addCriterion("platform_serial_number is not null");
            return (Criteria) this;
        }

        public Criteria andPlatformSerialNumberEqualTo(String value) {
            addCriterion("platform_serial_number =", value, "platformSerialNumber");
            return (Criteria) this;
        }

        public Criteria andPlatformSerialNumberNotEqualTo(String value) {
            addCriterion("platform_serial_number <>", value, "platformSerialNumber");
            return (Criteria) this;
        }

        public Criteria andPlatformSerialNumberGreaterThan(String value) {
            addCriterion("platform_serial_number >", value, "platformSerialNumber");
            return (Criteria) this;
        }

        public Criteria andPlatformSerialNumberGreaterThanOrEqualTo(String value) {
            addCriterion("platform_serial_number >=", value, "platformSerialNumber");
            return (Criteria) this;
        }

        public Criteria andPlatformSerialNumberLessThan(String value) {
            addCriterion("platform_serial_number <", value, "platformSerialNumber");
            return (Criteria) this;
        }

        public Criteria andPlatformSerialNumberLessThanOrEqualTo(String value) {
            addCriterion("platform_serial_number <=", value, "platformSerialNumber");
            return (Criteria) this;
        }

        public Criteria andPlatformSerialNumberLike(String value) {
            addCriterion("platform_serial_number like", value, "platformSerialNumber");
            return (Criteria) this;
        }

        public Criteria andPlatformSerialNumberNotLike(String value) {
            addCriterion("platform_serial_number not like", value, "platformSerialNumber");
            return (Criteria) this;
        }

        public Criteria andPlatformSerialNumberIn(List<String> values) {
            addCriterion("platform_serial_number in", values, "platformSerialNumber");
            return (Criteria) this;
        }

        public Criteria andPlatformSerialNumberNotIn(List<String> values) {
            addCriterion("platform_serial_number not in", values, "platformSerialNumber");
            return (Criteria) this;
        }

        public Criteria andPlatformSerialNumberBetween(String value1, String value2) {
            addCriterion("platform_serial_number between", value1, value2, "platformSerialNumber");
            return (Criteria) this;
        }

        public Criteria andPlatformSerialNumberNotBetween(String value1, String value2) {
            addCriterion("platform_serial_number not between", value1, value2, "platformSerialNumber");
            return (Criteria) this;
        }

        public Criteria andCollectIsNull() {
            addCriterion("collect is null");
            return (Criteria) this;
        }

        public Criteria andCollectIsNotNull() {
            addCriterion("collect is not null");
            return (Criteria) this;
        }

        public Criteria andCollectEqualTo(String value) {
            addCriterion("collect =", value, "collect");
            return (Criteria) this;
        }

        public Criteria andCollectNotEqualTo(String value) {
            addCriterion("collect <>", value, "collect");
            return (Criteria) this;
        }

        public Criteria andCollectGreaterThan(String value) {
            addCriterion("collect >", value, "collect");
            return (Criteria) this;
        }

        public Criteria andCollectGreaterThanOrEqualTo(String value) {
            addCriterion("collect >=", value, "collect");
            return (Criteria) this;
        }

        public Criteria andCollectLessThan(String value) {
            addCriterion("collect <", value, "collect");
            return (Criteria) this;
        }

        public Criteria andCollectLessThanOrEqualTo(String value) {
            addCriterion("collect <=", value, "collect");
            return (Criteria) this;
        }

        public Criteria andCollectLike(String value) {
            addCriterion("collect like", value, "collect");
            return (Criteria) this;
        }

        public Criteria andCollectNotLike(String value) {
            addCriterion("collect not like", value, "collect");
            return (Criteria) this;
        }

        public Criteria andCollectIn(List<String> values) {
            addCriterion("collect in", values, "collect");
            return (Criteria) this;
        }

        public Criteria andCollectNotIn(List<String> values) {
            addCriterion("collect not in", values, "collect");
            return (Criteria) this;
        }

        public Criteria andCollectBetween(String value1, String value2) {
            addCriterion("collect between", value1, value2, "collect");
            return (Criteria) this;
        }

        public Criteria andCollectNotBetween(String value1, String value2) {
            addCriterion("collect not between", value1, value2, "collect");
            return (Criteria) this;
        }

        public Criteria andPayedAtIsNull() {
            addCriterion("payed_at is null");
            return (Criteria) this;
        }

        public Criteria andPayedAtIsNotNull() {
            addCriterion("payed_at is not null");
            return (Criteria) this;
        }

        public Criteria andPayedAtEqualTo(Date value) {
            addCriterion("payed_at =", value, "payedAt");
            return (Criteria) this;
        }

        public Criteria andPayedAtNotEqualTo(Date value) {
            addCriterion("payed_at <>", value, "payedAt");
            return (Criteria) this;
        }

        public Criteria andPayedAtGreaterThan(Date value) {
            addCriterion("payed_at >", value, "payedAt");
            return (Criteria) this;
        }

        public Criteria andPayedAtGreaterThanOrEqualTo(Date value) {
            addCriterion("payed_at >=", value, "payedAt");
            return (Criteria) this;
        }

        public Criteria andPayedAtLessThan(Date value) {
            addCriterion("payed_at <", value, "payedAt");
            return (Criteria) this;
        }

        public Criteria andPayedAtLessThanOrEqualTo(Date value) {
            addCriterion("payed_at <=", value, "payedAt");
            return (Criteria) this;
        }

        public Criteria andPayedAtIn(List<Date> values) {
            addCriterion("payed_at in", values, "payedAt");
            return (Criteria) this;
        }

        public Criteria andPayedAtNotIn(List<Date> values) {
            addCriterion("payed_at not in", values, "payedAt");
            return (Criteria) this;
        }

        public Criteria andPayedAtBetween(Date value1, Date value2) {
            addCriterion("payed_at between", value1, value2, "payedAt");
            return (Criteria) this;
        }

        public Criteria andPayedAtNotBetween(Date value1, Date value2) {
            addCriterion("payed_at not between", value1, value2, "payedAt");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}