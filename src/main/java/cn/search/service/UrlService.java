package cn.search.service;

import java.util.List;


import cn.search.pojo.UrlInfo;
import cn.search.pojo.UrlSortInfo;

public interface UrlService {
		//增
		public int insert(UrlInfo urlInfo);
		//删
		public void delete(int uId);
		//改
		public int update(UrlInfo urlInfo);
		//查一个
		public UrlInfo get(int uId);
		//查全部
		public List<UrlInfo> findAll();
		//根据外键
		public List<UrlInfo> findBySortId(int urlSortId);
		//修改单个
		public int updateOne(UrlInfo urlInfo);
		//根据id查询
		public List<UrlSortInfo> findByUserId(int userId);
		
		
}
