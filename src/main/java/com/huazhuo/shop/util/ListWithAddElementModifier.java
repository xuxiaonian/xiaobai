package com.huazhuo.shop.util;

import java.util.ArrayList;

/**
 * This is to be used in place of the Roo hash-maps when in place creation of
 * child elements is required on forms.
 * 
 * @param <ElementClass>
 *            The class of the elements in the list.
 * @param <ParentClass>
 *            The parent class the elements are to belong to.
 */
@SuppressWarnings("serial")
public abstract class ListWithAddElementModifier<ElementClass, ParentClass> extends ArrayList<ElementClass> {

	// =========================================================================
	// Fields
	// =========================================================================

	/**
	 * The parent class for any newly created elements.
	 */
	protected ParentClass parentInstance;

	// =========================================================================
	// Constructors
	// =========================================================================

	/**
	 * Constructor.
	 * 
	 * @param parentInstance
	 *            The parent instance for any newly created classes; mandatory.
	 * @throws NullParameterException
	 *             If parentInstance is <code>null</code>.
	 */
	public ListWithAddElementModifier(ParentClass parentInstance) {
		this.parentInstance = parentInstance;
	}

	/**
	 * Overridden to allow a hook to modify el before addition to the list.
	 */
	@Override
	public boolean add(ElementClass el) {
		addElementModifyHook(el, parentInstance);
		return super.add(el);
	}

	// =========================================================================
	// Abstract interfaces
	// =========================================================================

	/**
	 * This must be overridden to create new Elements.
	 */
	public abstract void addElementModifyHook(ElementClass el, ParentClass parent);
}