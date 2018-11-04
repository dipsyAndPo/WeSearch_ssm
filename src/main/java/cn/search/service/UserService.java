package cn.search.service;

import cn.search.pojo.UserInfo;

public interface UserService {
	public UserInfo Login(UserInfo userInfo);
	public boolean register(UserInfo userInfo);
}
