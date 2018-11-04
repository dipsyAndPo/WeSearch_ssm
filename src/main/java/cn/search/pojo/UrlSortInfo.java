package cn.search.pojo;

import java.util.List;

import org.springframework.stereotype.Component;
@Component
public class UrlSortInfo {
    private Integer urlSortId;

    private String urlSortName;
    
    private List<UrlInfo> urlInfos;
    
    private Integer userId;
    
    
    

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Integer getUrlSortId() {
		return urlSortId;
	}

	public void setUrlSortId(Integer urlSortId) {
		this.urlSortId = urlSortId;
	}

	public String getUrlSortName() {
		return urlSortName;
	}

	public void setUrlSortName(String urlSortName) {
		this.urlSortName = urlSortName;
	}

	public List<UrlInfo> getUrlInfos() {
		return urlInfos;
	}

	public void setUrlInfos(List<UrlInfo> urlInfos) {
		this.urlInfos = urlInfos;
	}

	@Override
	public String toString() {
		return "UrlSortInfo [urlSortId=" + urlSortId + ", urlSortName=" + urlSortName + ", urlInfos=" + urlInfos + "]";
	}

	
   
}