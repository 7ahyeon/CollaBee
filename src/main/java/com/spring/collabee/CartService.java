package com.spring.collabee;

public interface CartService {
	void insertCart(CartVO cartVo);
	void updateCart(CartVO cartVo);
	void deleteCart(CartVO cartVo);
	CartVO getCartList(CartVO cartVo);
}
