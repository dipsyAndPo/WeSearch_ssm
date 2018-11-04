package cn.search.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import cn.search.pojo.UrlInfo;
import cn.search.pojo.UrlSortInfo;
import cn.search.service.UrlService;
import cn.search.util.ImageUtil;
import cn.search.util.Ping;

@Controller
@RequestMapping("")
public class UrlController {
	@Autowired
	private UrlService us;
	@RequestMapping("metaSearch")
	public ModelAndView metaSearch(String Searchtext,String sou_flag) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("Searchtext",Searchtext);
		mav.addObject("sou_flag",sou_flag);
		mav.setViewName("index/Search");
		return mav;
	}
	
	
	@RequestMapping("findByUserId")
	public ModelAndView findByUserId(int userId) {
		ModelAndView mav = new ModelAndView();
		List<UrlSortInfo> urlSortInfos = us.findByUserId(userId);
		mav.addObject("urlSortInfos",urlSortInfos);
		mav.setViewName("index/index");
		return mav;
	}
	

	
	
	
	@RequestMapping("url_Insert")
		public ModelAndView insert(UrlInfo urlInfo,String flag, HttpSession session, MultipartFile img) throws IllegalStateException, IOException {
		
		ModelAndView mav = new ModelAndView();
		String suburl=urlInfo.getUrlWeblink();
		String url = urlInfo.getUrlWeblink();
		boolean b1=url.contains("http://");
		boolean b2=url.contains("https://");
		if(b1) {
			suburl = url.substring(7); 
		}else if(b2) {
			suburl=url.substring(8);
		}
		
		boolean status1=true;
		int  timeOut =  1000 ;  //超时应该在3钞以上        
		boolean status = Ping.ping(suburl,2, timeOut);
		if(status) {
			urlInfo.setUrlWeblink("http://"+suburl);
			int insert = us.insert(urlInfo);
			 File  imageFolder= new File(session.getServletContext().getRealPath("img/ico"));
		        File file = new File(imageFolder,urlInfo.getuId()+".jpg");
		        if(!file.getParentFile().exists())
		            file.getParentFile().mkdirs();
		        img.transferTo(file);
		        BufferedImage img1 = ImageUtil.change2jpg(file);
		        ImageIO.write(img1, "jpg", file);
		}else {
			status1=false;
		}
	        if(flag.equals("index")) {
	        	mav.setViewName("redirect:/index");
	        }else if(flag.equals("admin")) {
	        	mav.setViewName("redirect:/url_findBySortId?urlSortId="+urlInfo.getUrlSortId());
			}else {
				mav.setViewName("error");
			}
	       
		return mav;
	}
	
	
	@RequestMapping("url_delete")
	public ModelAndView url_delete (UrlInfo urlInfo) {
		ModelAndView mav = new ModelAndView();
		us.delete(urlInfo.getuId());
		mav.setViewName("redirect:/url_findBySortId?urlSortId="+urlInfo.getUrlSortId());
		return mav;
	}

	@RequestMapping("url_update")
	public ModelAndView url_update (UrlInfo urlInfo) {
		ModelAndView mav = new ModelAndView();
		us.updateOne(urlInfo);
		mav.setViewName("redirect:/url_findBySortId?urlSortId="+urlInfo.getUrlSortId());
		return mav;
	}
	

	@RequestMapping("url_ping")
	public ModelAndView url_ping (String urlWeblink) throws UnknownHostException, IOException {
		ModelAndView mav = new ModelAndView();
		
		int  timeOut =  3000 ;  //超时应该在3钞以上        
		boolean status = Ping.ping(urlWeblink, 5, timeOut);
		System.out.println(status);
		if(status) {
			mav.setViewName("success");
		}else {
			mav.setViewName("error");
		}
		
		return mav;
	}
	
	@RequestMapping("url_findBySortId")
	public ModelAndView url_findBySortId (int urlSortId) {
		ModelAndView mav = new ModelAndView();
		List<UrlInfo> urlinfos = us.findBySortId(urlSortId);
		mav.addObject("urlinfos", urlinfos);
		mav.setViewName("admin/urls");
		return mav;
	}
	
	
}
