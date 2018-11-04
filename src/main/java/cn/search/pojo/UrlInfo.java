package cn.search.pojo;

import org.springframework.stereotype.Component;

@Component
public class UrlInfo {
    private Integer uId;

    private String urlName;

    private String urlWeblink;

    private Integer urlSortId;
    
    private Integer userId;

    public Integer getuId() {
        return uId;
    }

    public void setuId(Integer uId) {
        this.uId = uId;
    }

    public String getUrlName() {
        return urlName;
    }

    public void setUrlName(String urlName) {
        this.urlName = urlName == null ? null : urlName.trim();
    }

    public String getUrlWeblink() {
        return urlWeblink;
    }

    public void setUrlWeblink(String urlWeblink) {
        this.urlWeblink = urlWeblink == null ? null : urlWeblink.trim();
    }

    public Integer getUrlSortId() {
        return urlSortId;
    }

    public void setUrlSortId(Integer urlSortId) {
        this.urlSortId = urlSortId;
    }

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "           uId是" + uId + "  urlName是" + urlName+ "  urlSortId是"
				+ urlSortId + "  userId是" + userId + "]";
	}

	
    
}