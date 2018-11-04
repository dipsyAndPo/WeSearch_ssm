package cn.search.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.search.mapper.userInfoMapper;
import cn.search.pojo.UserInfo;
import cn.search.service.UserService;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	private userInfoMapper uim;

	@Override
	public UserInfo Login(UserInfo userInfo) {
		UserInfo userInfo1 = uim.where(userInfo);
		return userInfo1;
	}

	@Override
	public boolean register(UserInfo userInfo) {
		int insert = uim.insert(userInfo);
		return insert==1?true:false;
	}
	

}
