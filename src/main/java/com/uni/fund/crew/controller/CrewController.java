package com.uni.fund.crew.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.uni.fund.crew.service.CrewService;

@Controller
public class CrewController {

	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired CrewService crewService;
	
	
	@RequestMapping(value="/crew/crewCreate.go")
	public String crewCreateGo() {
		logger.info("crewCreate 들어왔다.");
		return "crew/crewCreateForm";
	}
	
	@RequestMapping(value="/crew/crewCreate.do", method = RequestMethod.POST)
	public String crewCreateDo(MultipartFile crew_logo_photo,MultipartFile crew_recru_photo, @RequestParam Map<String, String>param, Integer mem_idx, Model model) {
		logger.info("create 들어왔다.");
		logger.info("Create param:{}",param);
		
		String page="redirect:/";
		String msg="크루 등록에 실패했습니다.";
		mem_idx=2;
		
		int row = crewService.crewCreateDo(crew_logo_photo,crew_recru_photo,mem_idx,param);
		if(row == 1) {
			page ="redirect:/";
			msg="크루등록이 완료되었습니다!";
		}
		model.addAttribute("msg",msg);
		
		return page;
	}
	
	@RequestMapping(value="/crew/crewOverlay.do")
	@ResponseBody
	public Map<String, Object> crewOverlay(String crew_name){
		logger.info("crew_name =  "+crew_name);
		Map<String, Object>map = new HashMap<String, Object>();
		map.put("use",crewService.crewOverlay(crew_name));
		return map;
	}
	
	@RequestMapping(value="/crew/crewUpdateForm.go")
	public String crewUpdateFormGo(Model model) {
		String page="redirect:/crewDetail";
		int crew_idx = 1;
		logger.info("update form idx = "+crew_idx);
		crewService.crewUpdateForm(crew_idx,model);
		page="crew/crewUpdateForm";
		
		return page;
	}
	
	@RequestMapping(value="/crew/crewUpdate.do",method = RequestMethod.POST)
	public String crewUpdateDo(MultipartFile crew_logo_photo,MultipartFile crew_recru_photo, @RequestParam Map<String, String>param){
		logger.info("param : {}",param);
		//int crew_idx=1;
		String page="redirect:/crewDetail";
		
		crewService.crewUpdate(param,crew_logo_photo,crew_recru_photo);
		page="redirect:/detail?crew_idx="+param.get("crew_idx");
		logger.info("page : "+page);
		
		return page;
	}
	
	@RequestMapping(value="/crew/crewList.go", method = RequestMethod.GET)
	public String crewListGo() {
		logger.info("crewList 진입");
		String page= "crew/crewList";
		return page;
	}
	
	@RequestMapping(value="/crew/crewList.ajax", method = RequestMethod.GET)
	@ResponseBody
	public Map<String,Object> crewListCall
	(@RequestParam (value = "page", defaultValue = "1") String page,
	@RequestParam (value = "cnt", defaultValue = "10")	String cnt){
		logger.info("crewList.ajax");
		
		int currentPage = Integer.parseInt(page);	//현재 보여지는 페이지
		int pagePerCnt =Integer.parseInt(cnt);		//페이당 보여줄 개
		
		Map<String,Object> map = crewService.crewList(currentPage, pagePerCnt);
		
		return map;
	}
	
	@RequestMapping(value="/crew/apply.ajax")
	@ResponseBody
	public Map<String, Object> crewApply(Integer mem_idx, Integer crew_idx) {
	    logger.info("memidx : {}", mem_idx); // 로그 출력 시 {}로 값을 대체합니다.
	    String page="redirect:/crewList.go";
	    
	    Map<String, Object> response = new HashMap<String, Object>();
	    
	    String result = crewService.applyCrew(mem_idx, crew_idx);
	    
	    if(result.equals("success")) {
	        response.put("success", "신청이 완료되었습니다.");
	    } else if(result.equals("isApplying")) {
	        response.put("error", "이미 신청 중 크루가 있습니다.");
	    } else {
	        response.put("error", "현재 가입된 크루가 있습니다.");
	    }        
	    
	    return response;        
	}
	
	@RequestMapping(value="/crew/CoolCheck.ajax")
	@ResponseBody
	public Map<String, Object> crewCoolCheck(Integer mem_idx, Integer crew_idx){
		logger.info("crewPopularityCheck");
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("row", crewService.crewCoolCheck(mem_idx, crew_idx));
		
		return map;
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
