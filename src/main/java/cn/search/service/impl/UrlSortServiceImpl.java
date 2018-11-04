package cn.search.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.search.mapper.urlSortInfoMapper;
import cn.search.pojo.UrlSortInfo;
import cn.search.service.UrlSortService;

@Service
public class UrlSortServiceImpl implements UrlSortService{
	
	@Autowired
	urlSortInfoMapper usm;

	@Override
	public int insert(UrlSortInfo urlSortInfo) {
		int i = usm.insert(urlSortInfo.getUrlSortName());
		return i;
	}

	@Override
	public void delete(int urlSortId) {
		usm.delete(urlSortId);
	}

	@Override
	public int update(UrlSortInfo urlSortInfo) {
		int update = usm.update(urlSortInfo);
		return update;
	}

	@Override
	public UrlSortInfo get(int urlSortId) {
		UrlSortInfo urlSortInfo = usm.get(urlSortId);
		return urlSortInfo;
	}

	@Override
	public List<UrlSortInfo> findAll() {
		List<UrlSortInfo> findAll = usm.findAll();
		return findAll;
	}

	@Override
	public List<UrlSortInfo> findDefault() {
		return usm.findDefault();
	}

	
}
