package org.kh.fin.common.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.kh.fin.common.domain.MainItem;
import org.kh.fin.common.service.CommonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class CommonController {
	
	@Autowired
	private CommonService cSerivce;
	
	@RequestMapping(value="mainLoad.do")
	public ModelAndView loadData(ModelAndView mv, HttpServletRequest request, HttpServletResponse response) {
		ArrayList<MainItem> favoriteList = cSerivce.selectFavoriteList();
		ArrayList<MainItem> showList = cSerivce.selectShowList();
		ArrayList<MainItem> soldList = cSerivce.selectSoldList();
		
		request.setAttribute("favoriteList", favoriteList);
		request.setAttribute("showList", showList);
		request.setAttribute("soldList", soldList);
		mv.setViewName("home");
		mv.addObject("favoriteList", favoriteList);
		mv.addObject("showList", showList);
		mv.addObject("soldList", soldList);
		return mv;
	}
}
