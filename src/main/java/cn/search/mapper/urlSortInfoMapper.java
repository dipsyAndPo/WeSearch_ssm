package cn.search.mapper;

import cn.search.pojo.UrlSortInfo;
import java.util.List;
import org.apache.ibatis.annotations.Many;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;
@Repository
public interface urlSortInfoMapper {
		//增
		@Insert("INSERT INTO UrlSortInfo(urlSortName) VALUES (#{urlSortName})")
		public int insert(String  urlSortName);
		//删
		@Delete("delete from UrlSortInfo where urlSortId= #{urlSortId}")
		public void delete(int urlSortId);
		//改
		@Update("update UrlSortInfo set urlSortName=#{urlSortName} where urlSortId=#{urlSortId}")
		public int update(UrlSortInfo UrlSortInfo);
		//查一个
		@Select("select * from UrlSortInfo where urlSortId=#{urlSortId}")
		public UrlSortInfo get(int urlSortId);
		//查询全部网址
		@Select("select * from UrlSortInfo")
		@Results({
			@Result(property = "urlSortId", column = "urlSortId"),
			@Result(property = "urlInfos", javaType = List.class, column = "urlSortId",  
					many = @Many(select = "cn.search.mapper.urlInfoMapper.findBySortId"))
			})
		public List<UrlSortInfo> findAll();
		
		//查询全部默认的网址
				@Select("select * from UrlSortInfo")
				@Results({
					@Result(property = "urlSortId", column = "urlSortId"),
					@Result(property = "urlInfos", javaType = List.class, column = "urlSortId",  
							many = @Many(select = "cn.search.mapper.urlInfoMapper.findBySortIdAndDefault"))
					})
				public List<UrlSortInfo> findDefault();
		
		
		
}