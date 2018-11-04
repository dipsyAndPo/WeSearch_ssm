package cn.search.mapper;

import cn.search.pojo.UrlSortInfo;
import cn.search.pojo.UserInfo;
import cn.search.pojo.UserInfo;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Many;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

@Repository
public interface userInfoMapper {	//增
	@Insert("INSERT INTO userInfo(userName,userAccount,userPwd) VALUES (#{userName},#{userAccount},#{userPwd})")
	public int insert(UserInfo  userInfo);
	//删
	@Delete("delete from userInfo where userId= #{userId}")
	public void delete(int userId);
	//查一个
	@Select("select * from userInfo where userId=#{userId}")
	public UserInfo get(int userId);
	//条件查询
	@Select("select * from userInfo where userAccount = #{userAccount} and userPwd = #{userPwd}")
	public UserInfo where(UserInfo  userInfo);
	
	}