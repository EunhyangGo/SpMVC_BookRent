package com.biz.book.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.biz.book.mapper.BookDao;
import com.biz.book.mapper.UserDao;
import com.biz.book.model.BookVO;
import com.biz.book.model.CartVO;
import com.biz.book.model.RentVO;
import com.biz.book.model.UserVO;

@Service
public class CartService {

	@Autowired
	BookDao bDao;
	
	@Autowired
	UserDao uDao;
	
	public List<CartVO> addCart(List<CartVO> cartList, RentVO rentVO){
		
		if(cartList == null) {
			
			cartList = new ArrayList<CartVO>();
		}
		
		long book_seq = rentVO.getRent_book_seq();
		long user_seq = rentVO.getRent_user_seq();
		
		BookVO bookVO = bDao.findById(book_seq); // 도서 정보 가져오기
		UserVO userVO = uDao.findById(user_seq); // 사용자 정보 가져오기
		
		//bookvo가 null이 아니고 uservo가 null이 아니면
		if(bookVO != null && userVO !=null) {
			// 임시의 카트 하나 생성
			CartVO cartVO = new CartVO();
			
			// RentVO에서 CartVO로 복사
			cartVO.setCart_book_seq(rentVO.getRent_book_seq());
			cartVO.setCart_book_price(rentVO.getRent_book_price());
			
			// bookVO에서 도서 제목을 cartVO에 복사
			cartVO.setCart_book_title(bookVO.getBook_title());
			
			cartVO.setCart_user_seq(rentVO.getRent_user_seq());
			
			// userVO에서 회원이름을 cartVO에 복사
			cartVO.setCart_user_name(userVO.getUser_name());
			
			cartVO.setCart_date(rentVO.getRent_date());
			cartVO.setCart_return_date(rentVO.getRent_return_date());
			cartVO.setCart_return_yn(rentVO.getRent_return_yn());
			
			// cartList에 저장
			cartList.add(cartVO);
			
			return cartList;
			
			
		}
		
		return null;
		
	}
	
	
	
	
	
}
