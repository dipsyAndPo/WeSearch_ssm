package cn.search.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.search.mapper.urlInfoMapper;
import cn.search.mapper.urlSortInfoMapper;
import cn.search.pojo.UrlInfo;
import cn.search.pojo.UrlSortInfo;
import cn.search.service.UrlService;

@Service
public class UrlServiceImpl implements UrlService{

	@Autowired
	private urlInfoMapper ulm;
	
	@Autowired
	urlSortInfoMapper usim;
	
	
	@Override
	public List<UrlSortInfo> findByUserId(int userId) {
		//查询出默认的url
		List<UrlSortInfo> admin_url = usim.findDefault();
		//查询出用户下的url
		List<UrlInfo> user_url = ulm.findAllByUserId(userId);
		if(userId==0) {
			return admin_url;
		}
		for(int i=0;i<=user_url.size()-1;i++) {
			UrlInfo urlInfo = user_url.get(i);
			Integer urlSortId = urlInfo.getUrlSortId();
			for(int j=0;j<=admin_url.size()-1;j++) {
				UrlSortInfo urlSortInfo = admin_url.get(j);
				if(urlSortInfo.getUrlSortId()==urlSortId) {
					urlSortInfo.getUrlInfos().add(urlInfo);
				}
			}
		}
		
		
		
		
		System.out.println(admin_url);
		
		return admin_url;
		
	}
	
	@Override
	public int insert(UrlInfo urlInfo) {
		int i = ulm.insert(urlInfo);
		return i;
	}

	@Override
	public void delete(int uId) {
		ulm.delete(uId);
	}

	@Override
	public int update(UrlInfo urlInfo) {
		int i = ulm.update(urlInfo);
		return i;
	}

	@Override
	public UrlInfo get(int uId) {
		UrlInfo urlInfo = ulm.get(uId);
		return urlInfo;
	}
	
	

	@Override
	public List<UrlInfo> findAll() {
		//List<UrlInfo> findAll = ulm.findAll();
		return null;
	}

	@Override
	public List<UrlInfo> findBySortId(int urlSortId) {
		List<UrlInfo> findBySortId = ulm.findBySortId(urlSortId);
		return findBySortId;
	}

	@Override
	public int updateOne(UrlInfo urlInfo) {
		int i=0;
		if(null==urlInfo.getUrlWeblink()) {
			i=ulm.setName(urlInfo);
		}else if (null==urlInfo.getUrlName()) {
			i=ulm.setWeblink(urlInfo);
		}else if(null!=urlInfo.getUrlName()&null!=urlInfo.getUrlWeblink()){
			i=update(urlInfo);
		}
		return i;
	}

}
