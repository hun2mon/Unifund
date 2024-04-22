package com.uni.fund.project.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.uni.fund.project.dto.ProjectDTO;
import com.uni.fund.project.service.ProjectService;

@Controller
public class ProjectController {
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired ProjectService projectService;
	
	@RequestMapping(value = "/detail")
	public String detail(Model model) {
		ProjectDTO project = projectService.detail();
		model.addAttribute("project", project);
		return "project/detail";
	}
	
	/* *
	 * 작성자 : 허승경
	 * 프로젝트 등록 페이지 IN
	 * */
	@RequestMapping(value="/projectCreateForm")
	public String projectCreateForm() {
		logger.info(":: projectCreateForm IN ::");
		return "project/create";
	}
	
	/* *
	 * 작성자 : 허승경
	 * 프로젝트 등록하기
	 * */
	@RequestMapping(value="/projectCreate", method=RequestMethod.POST)
	public String projectCreate(MultipartFile pro_main_photo, MultipartFile pro_photo,@RequestParam Map<String, String> param, Integer mem_idx,Model model) {
		logger.info(":: projectCreate CONTROLLER IN ::");
		logger.info(":: Create param:{}",param);
		String page = "project/create";
		String msg = "등록실패";
		mem_idx = 1;
		
		int row = projectService.projectCreate(pro_main_photo,pro_photo,param,mem_idx);
		if(row == 1) {
			page = "redirect:/";
			msg = "등록완료되었습니다. 심사가 완료될때까지 기다려주세요.";
		}
		model.addAttribute("msg",msg);
		
		return page;
	}
	
	/* *
	 * 작성자 : 허승경
	 * 프로젝트 수정페이지 IN
	 * */
	@RequestMapping(value = "/pro_update.go")
	public String updateGo(String pro_idx,Model model) {
		logger.info(":: updateGo CONTROLLER IN ::");
		logger.info("pro_idx {}",pro_idx);
		projectService.updateForm(pro_idx,model);
		return "project/update";
	}
	
	/* *
	 * 작성자 : 허승경
	 * 프로젝트 수정하기
	 * */
	@RequestMapping(value = "/projectUpdate.do", method = RequestMethod.POST)
	public String updateProject(MultipartFile pro_main_photo, MultipartFile pro_photo, @RequestParam Map<String, String> param) {
		logger.info(":: updateProject CONTROLLER IN ::");
		logger.info("pro_idx:{}",param.get("pro_idx"));
		logger.info("pro_title:{}",param.get("pro_title"));
		String page = "redirect:/pro_update.go";
		
		int row = projectService.projectUpdate(pro_main_photo,pro_photo,param);
		if(row == 1 ) {
			page = "redirect:/";
			//page = "redirect:/detail?idx=" + param.get("idx");
		}
		return page;
	}
	
	
	/* *
	 * 작성자 : 허승경
	 * 프로젝트 리스트페이지 IN
	 * */
	@GetMapping(value = "/proList.go")
	public String proList(String pro_idx,Model model, @RequestParam Map<String, Object> param) {
		logger.info(":: proList CONTROLLER IN ::");
		
		int pg = param.get("pg") == null ? 1 : Integer.parseInt((String) param.get("pg"));
		param.put("pg", String.valueOf(pg));

		String category = (String) param.get("category");
		
		List<ProjectDTO> projectList = projectService.projectList(param);
		
		param.put("mem_idx",1);

		// 데이터 공유
		model.addAttribute("pg", pg);
		model.addAttribute("list", projectList);
		model.addAttribute("category", category);
		

		return "project/list";
	}
	
	/* *
	 * 작성자 : 허승경
	 * 프로젝트 작성하기 클릭시 3개초과인지 체크하기
	 * */
	@RequestMapping(value="checkProject.ajax")
	@ResponseBody
	public Map<String, Object> checkProject(Integer mem_idx){
		logger.info("mem_idx:{}",mem_idx);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("checkProject", projectService.checkProject(mem_idx));
		logger.info("ㅇ야ㅑ야양:{}",projectService.checkProject(mem_idx));
		return map;
	}
	
	/* *
	 * 작성자 : 허승경
	 * 프로젝트 리스트페이지 IN --> 좋아요 읽어오기
	 * */
	@RequestMapping(value="projectReadLike.ajax")
	@ResponseBody
	public Map<String, Object> projectReadLike(int pro_idx, int mem_idx){
		logger.info(":: projectReadLike CONTROLLER IN ::");
		logger.info("mem_idx:{}",mem_idx);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("projectReadLike", projectService.projectReadLike(pro_idx, mem_idx));

		return map;
	}
	
	/* *
	 * 작성자 : 허승경
	 * 프로젝트 좋아요 확인 / 추가 / 삭제
	 * */
	@RequestMapping(value="projectCheckLike.ajax")
	@ResponseBody
	public Map<String, Object> projectCheckLike(Integer pro_idx, Integer mem_idx){
		logger.info(":: projectCheckLike CONTROLLER IN ::");
		logger.info("mem_idx:{}",mem_idx);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("projectCheckLikeRow", projectService.projectCheckLike(pro_idx, mem_idx));

		return map;
	}
	
	@RequestMapping(value = "/fund.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> fundDo(@RequestParam Map<String,String> map) {
		logger.info("mem_idx : {}" , map);
		Map<String, Object> mapMap = new HashMap<String, Object>();
		projectService.funding(map);
		return mapMap;
	}
	
	@RequestMapping(value = "/fund_cancle.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> fundCancle(@RequestParam Map<String,String> map) {
		logger.info("mem_idx : {}" , map);
		Map<String, Object> mapMap = new HashMap<String, Object>();
		projectService.fundingCancle(map);
		return mapMap;
	}
	
	@RequestMapping(value = "/review.do", method = RequestMethod.POST)
	public String reviewWrite(MultipartFile photo, String revNum, String revContent, String pro_idx) {
		logger.info("photo : {}", photo);
		logger.info("revNum : {}", revNum);
		logger.info("revContent : {}", revContent);
		logger.info("pro_idx : {}", pro_idx);
		int mem_idx = 1;
		return "/";
	}

}
