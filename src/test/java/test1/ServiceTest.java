package test1;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cn.search.mapper.urlInfoMapper;
import cn.search.mapper.urlSortInfoMapper;
import cn.search.pojo.UrlInfo;
import cn.search.pojo.UrlSortInfo;
import cn.search.service.UrlService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"classpath:applicationContext.xml"})
public class ServiceTest {
	@Autowired
	private UrlService us;
	
	@Test
	public void admin_user() {
		//查询出默认的url
		List<UrlSortInfo> admin_url = us.findByUserId(1);
		for (UrlSortInfo urlSortInfo : admin_url) {
			System.out.println(urlSortInfo);
		}
	}
	
	
}
