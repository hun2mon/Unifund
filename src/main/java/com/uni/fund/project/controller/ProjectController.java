package com.uni.fund.project.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.uni.fund.project.dto.ProjectDTO;
import com.uni.fund.project.dto.ReviewDTO;
import com.uni.fund.project.service.ProjectService;

@Controller
public class ProjectController {
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired ProjectService projectService;


	@RequestMapping(value = "/project/detail.go")
	public String detail(Model model, HttpSession session, String row, String pro_idx) {
		String page = "project/detail";
		
		session.setAttribute("loginId", "admin");
		session.setAttribute("memIdx", "1");
		model.addAttribute("mem_idx",1);
		
		String pro_idxState= projectService.stateCheck(pro_idx);
		if (pro_idxState.equals("A")) {
			String memIdx = (String) session.getAttribute("memIdx");
			page = "project/adminJudge";
			ProjectDTO project = projectService.detail(pro_idx,memIdx);
			model.addAttribute("project", project);
		}else {
			String memIdx = (String) session.getAttribute("memIdx");
			ProjectDTO project = projectService.detail(pro_idx,memIdx);
			model.addAttribute("project", project);
			logger.info("memIdx : " + memIdx);
			logger.info("row = " + row);
			logger.info("pro_idx = " + pro_idx);
			if (row != null) {
				model.addAttribute("msg", "리뷰가 정상적으로 삭제되었습니다.");
			}			
		}
		return page;
	}
	
	
	
	@RequestMapping(value = "/project/appList.go")
	public String appListGo(Model model, String pro_idx) {
		logger.info("appList pro_idx : {}",pro_idx);
		model.addAttribute("proIdx", pro_idx);
		return "project/appList";
	}
	
	@RequestMapping(value = "/project/adminList.go")
	public String adminListGo() {
		return "project/adminList";
	}
	
	@RequestMapping(value = "/project/appList.ajax", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> appListCall(String page, String cnt, String pro_idx){
		logger.info("appListCall요청 들어옴");
		logger.info("listCall 요청");
		logger.info("페이지당 보여줄 갯수 : " + cnt);
		logger.info("요청 페이지 : " + page);
		logger.info("ajax pro_idx : " + pro_idx);
		
		int currPage = Integer.parseInt(page);
		int pagePerCnt = Integer.parseInt(cnt);
		
		Map<String, Object> map = projectService.list(currPage,pagePerCnt,pro_idx);
		return map;
	}
	
	/* *
	 * 작성자 : 허승경
	 * 프로젝트 등록 페이지 IN
	 * */
	@RequestMapping(value="/project/create.go")
	public String projectCreateForm() {
		logger.info(":: projectCreateForm IN ::");
		return "project/create";
	}
	
	/* *
	 * 작성자 : 허승경
	 * 프로젝트 등록하기
	 * */
	@RequestMapping(value="/project/create.do", method=RequestMethod.POST)
	public String projectCreate(MultipartFile pro_main_photo, MultipartFile pro_photo,@RequestParam Map<String, String> param, Integer mem_idx,Model model) {
		logger.info(":: projectCreate CONTROLLER IN ::");
		logger.info(":: Create param:{}",param);
		String page = "redirect:/project/list.go";
		String msg = "등록실패";
		mem_idx = 1;
		
		int row = projectService.projectCreate(pro_main_photo,pro_photo,param,mem_idx);
		if(row == 1) {
			page = "redirect:/project/list.go";
			msg = "등록완료되었습니다. 심사가 완료될때까지 기다려주세요.";
		}
		model.addAttribute("msg",msg);
		
		return page;
	}
	
	/* *
	 * 작성자 : 허승경
	 * 프로젝트 수정페이지 IN
	 * */
	@RequestMapping(value = "/project/update.go")
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
	@RequestMapping(value = "/project/update.do", method = RequestMethod.POST)
	public String updateProject(MultipartFile pro_main_photo, MultipartFile pro_photo, @RequestParam Map<String, String> param) {
		logger.info(":: updateProject CONTROLLER IN ::");
		logger.info("pro_idx:{}",param.get("pro_idx"));
		logger.info("pro_title:{}",param.get("pro_title"));
		String page = "redirect:/project/list.go";
		
		int row = projectService.projectUpdate(pro_main_photo,pro_photo,param);
		if(row == 1 ) {
			page = "redirect:/project/detail";
			//page = "redirect:/detail?idx=" + param.get("idx");
		}
		return page;
	}
	
	/* *
	 * 작성자 : 허승경
	 * 프로젝트 수정 버튼 클릭시 펀딩신청한 사람 체크하기
	 * */
	@RequestMapping(value="/project/checkFundPeople.ajax")
	@ResponseBody
	public Map<String, Object> checkFundPeople(Integer pro_idx){
		logger.info(":: checkFundPeople CONTROLLER IN ::");
		logger.info(":: checkFundPeople ::", projectService.checkFundPeople(pro_idx));
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("FundPeople", projectService.checkFundPeople(pro_idx));
		
		return map;
	}
	
	/* *
	 * 작성자 : 허승경
	 * 프로젝트 리스트페이지 IN
	 * */
	@GetMapping(value = "/project/list.go")
	public String proList(String pro_idx,Model model, @RequestParam Map<String, Object> param, HttpSession session) {
		logger.info(":: proList CONTROLLER IN ::");

		session.setAttribute("loginId", "admin");
		session.setAttribute("memIdx", "1");
		
		int pg = param.get("pg") == null ? 1 : Integer.parseInt((String) param.get("pg"));
		param.put("pg", String.valueOf(pg));

		String category = (String) param.get("category");
		String keyword = (String)param.get("keyword");
		String filter = (String)param.get("filter");
		
		int showList = 8;
		int spaceBlock = 5;
		int total = projectService.projectTotalCnt(param);
		int totalP = (total + (showList-1)) / showList;	
		int wantStart = (pg-1) / spaceBlock*spaceBlock + 1;	
		int endPage= wantStart + (spaceBlock-1);
		if(endPage > totalP) endPage = totalP;
		
		param.put("start", (pg-1) * showList);
		
		List<ProjectDTO> projectList = projectService.projectList(param);
		
		param.put("mem_idx",1);

		// 데이터 공유
		model.addAttribute("pg", pg);
		model.addAttribute("list", projectList);
		model.addAttribute("startPage", wantStart);
		model.addAttribute("endPage", endPage);
		model.addAttribute("totalP", totalP);
		model.addAttribute("blockScale", spaceBlock);
		model.addAttribute("category", category);
		model.addAttribute("keyword", keyword);
		model.addAttribute("filter", filter);

		return "project/list";
	}
	
	/* *
	 * 작성자 : 허승경
	 * 프로젝트 작성하기 클릭시 3개초과인지 체크하기
	 * */
	@RequestMapping(value="/project/checkProject.ajax")
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
	@RequestMapping(value="/project/readLike.ajax")
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
	@RequestMapping(value="/project/checkLike.ajax")
	@ResponseBody
	public Map<String, Object> projectCheckLike(Integer pro_idx, Integer mem_idx){
		logger.info(":: projectCheckLike CONTROLLER IN ::");
		logger.info("mem_idx:{}",mem_idx);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("projectCheckLikeRow", projectService.projectCheckLike(pro_idx, mem_idx));

		return map;
	}
	
	/* *
	 * 작성자 : 허승경
	 * 프로젝트 리스트페이지 IN --> 즐겨찾기 읽어오기
	 * */
	@RequestMapping(value="/project/projectReadFavorites.ajax")
	@ResponseBody
	public Map<String, Object> projectReadFavorites(int pro_idx, int mem_idx){
		logger.info(":: projectReadLike CONTROLLER IN ::");
		logger.info("mem_idx:{}",mem_idx);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("projectReadFavorites", projectService.projectReadFavorites(pro_idx, mem_idx));

		return map;
	}
	
	/* *
	 * 작성자 : 허승경
	 * 프로젝트 즐겨찾기 확인 / 추가 / 삭제
	 * */
	@RequestMapping(value="/project/checkFavorites.ajax")
	@ResponseBody
	public Map<String, Object> projectCheckFavorites(Integer pro_idx, Integer mem_idx){
		logger.info(":: projectCheckLike CONTROLLER IN ::");
		logger.info("mem_idx:{}",mem_idx);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("projectCheckFavorites", projectService.projectCheckFavorites(pro_idx, mem_idx));

		return map;
	}
	
	/* *
	 * 작성자 : 허승경
	 * 프로젝트 리스트페이지 IN --> 펀딩진행중 -> 실패상태 읽어오기
	 * */
	@RequestMapping(value="/project/projectFundingState.ajax")
	@ResponseBody
	public Map<String, Object> projectFundingState(int pro_idx, int mem_idx){
		logger.info(":: projectFundingState CONTROLLER IN ::");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("projectFundingState", projectService.projectFundingState(pro_idx));
		logger.info("projectFundingState:{}",projectService.projectFundingState(pro_idx));
		
		return map;
	}
	
	@RequestMapping(value = "/project/fund.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> fundDo(@RequestParam Map<String,String> map) {
		logger.info("mem_idx : {}" , map);
		Map<String, Object> mapMap = new HashMap<String, Object>();
		projectService.funding(map);
		return mapMap;
	}
	
	@RequestMapping(value = "/project/fund_cancle.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> fundCancle(@RequestParam Map<String,String> map) {
		logger.info("mem_idx : {}" , map);
		Map<String, Object> mapMap = new HashMap<String, Object>();
		projectService.fundingCancle(map);
		return mapMap;
	}
	
	@RequestMapping(value = "/project/review/write.do", method = RequestMethod.POST)
	public String reviewWrite(MultipartFile photo, @RequestParam Map<String,String> param, Model model) {
		String page = "redirect:/";
		logger.info("photo : {}", photo);
		logger.info("param : {}", param);
		logger.info("param_pro_idx : {}",param.get("pro_idx"));
		int mem_idx = 1;
		int row = projectService.reviewDo(photo,param,mem_idx);
		logger.info("row : {}",row);
		return "redirect:/project/detail.go?pro_idx=" + param.get("pro_idx");
	}
	
	@RequestMapping(value = "/project/review/list.ajax")
	@ResponseBody
	public Map<String, Object> reviewAjax(String pro_idx,int limit){
		logger.info("pro_idx : {}" , pro_idx);
		logger.info("limit : {}" , limit);
		Map<String, Object> map = new HashMap<String, Object>();
		List<ReviewDTO> list = projectService.revList(pro_idx,limit);
		map.put("list", list);
		logger.info("list : {}",list);
		return map;
	}
	
	@RequestMapping(value = "/project/review/delete.do")
	public String revDel(String rev_idx, String pro_idx) {
		logger.info("rev_idx :{}", rev_idx);
		String page = "redirect:/";
		int row = 0;
		row = projectService.revDel(rev_idx);
		if (row >0) {
			page = "redirect:/project/detail.go?row=" + row + "&pro_idx=" + pro_idx;
		}
		return page;
	}
	
	@RequestMapping(value = "/project/like.do")
	@ResponseBody
	public Map<String, Object> likeDo(HttpSession session, String pro_idx, String msg){
		Map<String, Object> map = new HashMap<String, Object>();
		logger.info("msg : {}", msg);
		logger.info("pro_idx : {}", pro_idx);
		logger.info("session : {}", session.getAttribute("memIdx"));
		String mem_idx = (String) session.getAttribute("memIdx");
		projectService.likeDo(pro_idx,msg,mem_idx);
		logger.info("session : {}", session.getAttribute("memIdx"));
		return map;
	}
	
	@RequestMapping(value = "/project/delForm.go")
	public String delFormGo() {
		return "project/delForm";
	}
	
	@RequestMapping(value = "/project/delete.do", method = RequestMethod.POST)
	public String proDel() {
		logger.info("del요청 들어옴");
		return "redirect:/project/detail.go";
	}
	
	@RequestMapping(value = "/project/report.do", method = RequestMethod.POST)
	public String report(String pro_idx, String repContent,HttpSession session) {
		logger.info("rep요청 들어옴");
		logger.info("신고 사유 : " +repContent);
		logger.info("프로젝트 번호 : " +pro_idx);
		String mem_idx = (String) session.getAttribute("memIdx");
		logger.info(mem_idx);
		projectService.report(pro_idx,repContent,mem_idx);
	
		return "redirect:/project/detail.go?pro_idx="+pro_idx;
	}
	
	
	@RequestMapping(value = "/project/adminList.ajax")
	@ResponseBody
	public Map<String, Object> adminList(String category, String page, String cnt){
		logger.info("category : {}", category);
		logger.info("페이지당 보여줄 갯수 : " + cnt);
		logger.info("요청 페이지 : " + page);
		

		int currPage = Integer.parseInt(page);
		int pagePerCnt = Integer.parseInt(cnt);
		
		Map<String, Object> map = projectService.adminList(category,currPage,pagePerCnt);
		
		return map;
	}
	
	@RequestMapping(value = "/project/search.ajax")
	@ResponseBody
	public Map<String, Object> search(String keyWord, String page, String cnt){
		
		logger.info("페이지당 보여줄 갯수 : " + cnt);
		logger.info("요청 페이지 : " + page);

		int currPage = Integer.parseInt(page);
		int pagePerCnt = Integer.parseInt(cnt);
		
		Map<String, Object> map = projectService.search(keyWord,currPage,pagePerCnt);
		return map;
	}
	
	@RequestMapping(value = "/project/agree.do")
	public String agree(String pro_idx) {
		logger.info("pro_idx : {}", pro_idx);
		projectService.agree(pro_idx);
		return "redirect:/project/adminList.go";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
