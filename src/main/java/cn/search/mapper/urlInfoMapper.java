package cn.search.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import cn.search.pojo.UrlInfo;
@Repository
public interface urlInfoMapper {
	//增
	@Insert("INSERT INTO urlInfo(urlName,urlWeblink,urlSortId,userId) VALUES ( #{urlName}, #{urlWeblink}, #{urlSortId},#{userId})")
	@Options(useGeneratedKeys=true, keyProperty="uId", keyColumn="uId")
	public int insert(UrlInfo urlInfo);
	//删
	@Delete("delete from urlInfo where uId= #{uId}")
	public void delete(int uId);
	//改
	@Update("update urlInfo set urlName=#{urlName},urlWeblink=#{urlWeblink} where uId=#{uId}")
	public int update(UrlInfo urlInfo);
	//查一个
	@Select("select * from urlInfo where uId=#{uId}")
	public UrlInfo get(int uId);
	//查全部根据用户id
	@Select("select * from urlInfo where userId=#{userId}")
	public List<UrlInfo> findAllByUserId(int userId);
	//查询所有
	@Select("select * from urlInfo where urlSortId=#{urlSortId}")
	public List<UrlInfo> findBySortId(int urlSortId);
	
	//查询所有默认网址
	@Select("select * from urlInfo where urlSortId=#{urlSortId} and userId = 0")
	public List<UrlInfo> findBySortIdAndDefault(int urlSortId);
	//修改name
	@Update("update urlInfo set urlName=#{urlName} where uId=#{uId}")
	public int setName(UrlInfo urlInfo);
	//修改链接
	@Update("update urlInfo set urlWeblink=#{urlWeblink} where uId=#{uId}")
	public int setWeblink(UrlInfo urlInfo);
	
	
}