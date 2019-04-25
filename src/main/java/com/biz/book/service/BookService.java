package com.biz.book.service;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.InsertProvider;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.UpdateProvider;

import com.biz.book.mapper.BookSQL;
import com.biz.book.model.BookVO;

public interface BookService {

	/*
	 * CRUD 구현 method
	 */
	public List<BookVO> selectAll();
	
	public BookVO findById(long book_seq);
	
	public int insert(BookVO bookVO);
	
	public int update(BookVO bookVO);
	
	public int delete(long book_seq);
	
	/*
	 * 검색 method
	 */
	
	public List<BookVO> getSearchList(String s_string);
	
	
	
}
