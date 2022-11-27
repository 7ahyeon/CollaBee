package com.spring.collabee.cart;

public interface CartService {
	void insertCart(CartVO cartVo);
	void updateCart(CartVO cartVo);
	void deleteCart(CartVO cartVo);
	CartVO getCartList(CartVO cartVo);
}
