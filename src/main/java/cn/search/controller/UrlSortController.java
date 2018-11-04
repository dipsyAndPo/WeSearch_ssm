package cn.search.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import cn.search.pojo.UrlSortInfo;
import cn.search.service.UrlSortService;

@Controller
@RequestMapping("")
public class UrlSortController {
	@Autowired
	private UrlSortService uss;
	
	@Autowired
	private HttpServletRequest request;
	
	@RequestMapping("index")
	public ModelAndView index() {
		ModelAndView mav = new ModelAndView();
		List<UrlSortInfo> urlSortInfos = uss.findDefault();
		request.getSession().setAttribute("userId","-1");
		mav.addObject("urlSortInfos",urlSortInfos);
		mav.setViewName("index/index");
		return mav;
	}

	
	@RequestMapping("urlSort_insert")
	public ModelAndView urlSort_insert(UrlSortInfo urlSortInfo) {
		ModelAndView mav = new ModelAndView();
		int i = uss.insert(urlSortInfo);
		mav.setViewName("redirect:/urlSort_list");
		return mav;
	}
	
	@RequestMapping("urlSort_delete")
	public ModelAndView urlSort_delete(int urlSortId) {
		ModelAndView mav = new ModelAndView();
		uss.delete(urlSortId);
		mav.setViewName("redirect:/urlSort_list");
		return mav;
	}
	
	@RequestMapping("urlSort_update")
	public ModelAndView urlSort_update(UrlSortInfo urlSortInfo) {
		ModelAndView mav = new ModelAndView();
		int i = uss.update(urlSortInfo);
		mav.setViewName("success");
		return mav;
	}
	
	
	@RequestMapping("urlSort_list")
	public ModelAndView urlSort_list() {
		ModelAndView mav = new ModelAndView();
		List<UrlSortInfo> urlSortInfos = uss.findAll();
		mav.addObject("urlSortInfos",urlSortInfos);
		mav.setViewName("admin/urlsorts");
		return mav;
	}
}
