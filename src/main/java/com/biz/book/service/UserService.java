package com.biz.book.service;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Service;

import com.biz.book.model.UserVO;


public interface UserService {
	
	@Select("SELECT * FROM tbl_user "
			 + "WHERE user_name like '%' || #{s_string} || '%' "
			 + " OR user_phone like  '%' || #{s_string} || '%' ")
	public List<UserVO> getSearchList(String s_string);

}
