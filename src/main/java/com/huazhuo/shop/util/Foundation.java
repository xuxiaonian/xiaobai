package com.huazhuo.shop.util;

import java.util.ArrayList;
import java.util.List;

import com.huazhuo.shop.domain.GsBigcategory;
import com.huazhuo.shop.domain.ShoppingProducts;
import com.huazhuo.shop.domain.ShoppingProductsDetail;

public class Foundation {
	 
	public static List<ShoppingProductsDetail> Add (Integer ss,ShoppingProducts shoppingproducts) {
		// TODO Auto-generated method stub
		List<GsBigcategory> gsBigcategory = GsBigcategory.getGsBigcategory(ss);
		
		List<ShoppingProductsDetail> newdetails =  new ArrayList<ShoppingProductsDetail>();
		int i = 0;
		for (GsBigcategory g : gsBigcategory) {
			List<ShoppingProductsDetail> sd = ShoppingProductsDetail.getShopping(shoppingproducts, g.getId());
			int size = sd.size();
			newdetails.addAll(sd);
			if(g.getIsRequired()==1){
				if(size<6 & size>0){
					for(int y=0;y<6-size;y++){
						ShoppingProductsDetail n = new ShoppingProductsDetail();
						n.setType(2);
						n.setContent("../img/default_avatar_male.png");
						n.setGsBigcategoryId(g.getId());
						newdetails.add(n);
					}
				}
				if(size==0){
					for(int y=0;y<6-size;y++){
						if(y==0){
							ShoppingProductsDetail n = new ShoppingProductsDetail();
							n.setType(1);
							n.setGsBigcategoryId(g.getId());
							n.setBigcategoryName(g.getName());
							newdetails.add(n);
						}else{
							ShoppingProductsDetail n = new ShoppingProductsDetail();
							n.setType(2);
							n.setContent("../img/default_avatar_male.png");
							n.setGsBigcategoryId(g.getId());
							n.setBigcategoryName(g.getName());
							newdetails.add(n);
						}
					}
				}
			}else{
				if(size==0){
					for(int y=0;y<6-size;y++){
						if(y==0){
							ShoppingProductsDetail n = new ShoppingProductsDetail();
							n.setType(1);
							n.setGsBigcategoryId(g.getId());
							n.setBigcategoryName(g.getName());
							newdetails.add(n);
						}else{
							ShoppingProductsDetail n = new ShoppingProductsDetail();
							n.setType(2);
							n.setContent("../img/default_avatar_male.png");
							n.setGsBigcategoryId(g.getId());
							n.setBigcategoryName(g.getName());
							newdetails.add(n);
						}
					}
				}else{
					if(sd.get(0).getType()==1){
						if(size<6 & size>0){
							for(int y=0;y<6-size;y++){
								ShoppingProductsDetail n = new ShoppingProductsDetail();
								n.setType(2);
								n.setGsBigcategoryId(g.getId());
								n.setContent("../img/default_avatar_male.png");
								newdetails.add(n);
							}
						}
					}else{
						newdetails.removeAll(sd);
						ShoppingProductsDetail n = new ShoppingProductsDetail();
						n.setType(1);
						n.setGsBigcategoryId(g.getId());
						n.setBigcategoryName(g.getName());
						newdetails.add(n);
						newdetails.addAll(sd);
							for(int y=0;y<6-size-1;y++){
								n = new ShoppingProductsDetail();
								n.setType(2);
								n.setContent("../img/default_avatar_male.png");
								n.setGsBigcategoryId(g.getId());
								newdetails.add(n);
							}
					}
				}
			}
			}
		
		 return newdetails;
	}
	}
