package cn.search.service;

import java.util.List;
import cn.search.pojo.UrlSortInfo;

public interface UrlSortService {
	
	public int insert(UrlSortInfo urlSortInfo);
	
	public void delete(int urlSortId);
	
	public int update(UrlSortInfo urlSortInfo);
	
	public UrlSortInfo get(int urlSortId);
	
	public List<UrlSortInfo> findAll();
	
	public List<UrlSortInfo> findDefault();

}
