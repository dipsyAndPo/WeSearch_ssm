package cn.search.pojo;

import java.util.List;

import org.springframework.stereotype.Component;

@Component
public class UserInfo {
    private Integer userId;

    private String userName;

    private String userAccount;

    private String userPwd;
    

	public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
    }

    public String getUserAccount() {
        return userAccount;
    }

    public void setUserAccount(String userAccount) {
        this.userAccount = userAccount == null ? null : userAccount.trim();
    }

    public String getUserPwd() {
        return userPwd;
    }

    public void setUserPwd(String userPwd) {
        this.userPwd = userPwd == null ? null : userPwd.trim();
    }

	@Override
	public String toString() {
		return "UserInfo [userId=" + userId + ", userName=" + userName + ", userAccount=" + userAccount + ", userPwd="
				+ userPwd + "]";
	}
    
    
}