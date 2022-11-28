package com.spring.collabee.biz.cart;

public class CartVO {
	
	private int product_num, storage_num;
	private String thum_sys_filename, product_name;
	private int count, price, saleprice, stock;
	
	public CartVO() {
	}

	public int getProduct_num() {
		return product_num;
	}

	public void setProduct_num(int product_num) {
		this.product_num = product_num;
	}

	public int getStorage_num() {
		return storage_num;
	}

	public void setStorage_num(int storage_num) {
		this.storage_num = storage_num;
	}

	public String getThum_sys_filename() {
		return thum_sys_filename;
	}

	public void setThum_sys_filename(String thum_sys_filename) {
		this.thum_sys_filename = thum_sys_filename;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getSaleprice() {
		return saleprice;
	}

	public void setSaleprice(int saleprice) {
		this.saleprice = saleprice;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	@Override
	public String toString() {
		return "CartVO [product_num=" + product_num + ", storage_num=" + storage_num + ", thum_sys_filename="
				+ thum_sys_filename + ", product_name=" + product_name + ", count=" + count + ", price=" + price
				+ ", saleprice=" + saleprice + ", stock=" + stock + "]";
	}

	
	
}
