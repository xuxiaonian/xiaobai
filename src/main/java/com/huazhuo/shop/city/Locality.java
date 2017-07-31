package com.huazhuo.shop.city;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.OneToMany;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

import com.huazhuo.shop.util.ListWithAddElementModifier;


@RooJavaBean
@RooToString
@RooJpaActiveRecord(identifierType = Integer.class, table = "locality")
public class Locality {

	private String name;

	@OneToMany(targetEntity = Provinces.class, cascade = CascadeType.ALL, orphanRemoval = true, mappedBy = "locality")
	private List<Provinces> provinces = new ListWithAddElementModifier<Provinces, Locality>(this) {

		private static final long serialVersionUID = 1L;

		@Override
		public void addElementModifyHook(Provinces child, Locality parent) {
			child.setLocality(parent);
		}
	};
}
