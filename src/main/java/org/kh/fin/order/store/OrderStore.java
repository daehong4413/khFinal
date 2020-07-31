package org.kh.fin.order.store;

import org.kh.fin.order.domain.Order;
import org.springframework.ui.Model;

public interface OrderStore {
	public Model orderPurchaseProduct(Order order,Model model);
}
