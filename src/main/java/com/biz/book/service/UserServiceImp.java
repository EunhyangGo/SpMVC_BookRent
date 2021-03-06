package com.biz.book.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.biz.book.mapper.UserDao;
import com.biz.book.model.UserVO;


@Service
public class UserServiceImp implements UserService {

	@Autowired
	UserDao uDao;
	
	
	@Override
	public List<UserVO> getSearchList(String s_string) {
		// TODO Auto-generated method stub
		return uDao.getSearchList(s_string);
	}

}
