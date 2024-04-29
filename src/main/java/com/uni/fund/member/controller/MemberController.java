package com.uni.fund.member.controller;

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

import com.uni.fund.member.dto.MemberDTO;
import com.uni.fund.member.service.MemberService;

@Controller
public class MemberController {	
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired MemberService memberService;
	
	//로그인 페이지 이동
	@RequestMapping(value = "/member/login.go")
	public String home() {
		logger.info("최초 로그인 페이지 요청");
		return "member/login";
	}
	//회원가입 페이지 이동
	@RequestMapping(value = "/member/join.go")
	public String joinForm() {
		logger.info("회원가입 페이지 이동");
		return "member/joinForm";
	}
	//id찾기 페이지 이동
	@RequestMapping(value = "/member/findId.go")
	public String findId() {
		logger.info("아이디찾기 페이지 이동");
		return "member/findId";
	}
	
	
	//비밀번호찾기 페이지 이동
	@RequestMapping(value = "/member/findPw.go")
	public String findPw() {
		logger.info("비밀번호찾기 페이지 이동");
		return "member/findPw";
	}
	@RequestMapping(value = "/member/logout.do")
	public String logout(HttpSession session, Model model) {
		session.removeAttribute("mem_idx");
		session.removeAttribute("mem_status");
		session.removeAttribute("mem_id");
		session.removeAttribute("mem_status");
		model.addAttribute("msg", "로그아웃 되었습니다.");
		return "/main";
	}
	
	
	@RequestMapping(value="member/login.do")
	public String login(Model model, HttpSession session, String id, String pw) {
		String page = "member/login";
		logger.info("id : {} / pw : {}", id, pw);
		
		MemberDTO loginInfo = memberService.login(id, pw);
		logger.info("login :" + loginInfo);

		
		if(loginInfo != null) {
			page = "main";
			session.setAttribute("mem_idx", loginInfo.getMem_idx());
			session.setAttribute("mem_status", loginInfo.getMem_status());
			session.setAttribute("mem_id", loginInfo.getMem_id());
			session.setAttribute("mem_status", loginInfo.getMem_status());
			logger.info("status:{}", loginInfo.getMem_status());
		}else {
			model.addAttribute("msg", "아이디 또는 비밀번호 확인해주세요");
		}
	
		return page;
	}
	
	@RequestMapping(value = "/member/join.do", method = RequestMethod.POST)
	public String write(MultipartFile profilePhoto, MultipartFile mem_cor, HttpSession session,@RequestParam Map<String,String>param) {
		logger.info("글 작성 요청");
		logger.info("param : {}" , param);
		logger.info("profilePhoto : {}", profilePhoto);
		logger.info("mem_cor : {}", mem_cor);
		
		String page = "redirect:/main";
		
			int row = memberService.write(profilePhoto,mem_cor,param);
			if(row>0) {
				page = "/member/joinForm";
				
				
			}
		return page;
	}
	
	//회원가입 아이디 유효성 검사
	@RequestMapping(value="member/overlay.do")
	@ResponseBody
	public Map<String, Object> overlay(String id) {
		logger.info("id="+id);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("use", memberService.overlay(id));
		
		return map;
	}
	
	//ID찾기 AJAX로 서버에 요청
		@RequestMapping(value="member/findId.ajax")
		@ResponseBody
		public Map<String, Object> findId(String mem_name, String mem_number) {
			logger.info("userId : "+mem_name);
			logger.info("mem_number : "+ mem_number);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("use", memberService.findId(mem_name,mem_number));
			
			return map;
		}
		
	//PW변경하기
	@RequestMapping(value = "member/findPw.ajax", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> findPw(String mem_pw, String mem_id, String mem_number) {
		logger.info("mem_id: {}, mem_number: {}", mem_id , mem_number);
		logger.info("mem_pw : {}",  mem_pw);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("use", memberService.findPw(mem_pw,mem_id,mem_number));
		
		return map;
	}
	
	
		
	
	
	
	
	
	@RequestMapping(value = "/user/adminMemberList.go")
	public String adminMemberList(HttpSession session, Model model) {
		String status = (String)session.getAttribute("mem_status"); 
		String page= "redirect:/member/login.go";
		logger.info("mem_status="+status);
		logger.info("status="+status);
		
		if(status != null && status.equals("M")) {
			page = "./user/adminMemberList";
		}else {
			model.addAttribute("msg","로그인이 필요한 서비스입니다.");
		}
		
	    return page;
	}
	
	@RequestMapping(value = "/user/adminMemberList.ajax")
	@ResponseBody
	public Map<String, Object> adminMemberListAjax(@RequestParam Map<String,Object> param,Model model) {
		int pg = param.get("pg") == null ? 1 : Integer.parseInt((String) param.get("pg"));
		String searchType = (String)param.get("searchType");
		String keyword = (String)param.get("keyword");
		logger.info("pg::"+pg);
		logger.info("searchType::"+searchType);
		logger.info("keyword::"+keyword);
		
		int showList = 20;
		int spaceBlock = 5;
		param.put("start", (pg-1) * showList);
		int total = memberService.memberTotalCnt(param);
		int totalP = (total + (showList-1)) / showList;	
		int startPage = (pg-1) / spaceBlock*spaceBlock + 1;	
		int endPage= startPage + (spaceBlock-1);
		if(endPage > totalP) endPage = totalP;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberList",memberService.memberListAjax(param));
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		map.put("totalP", totalP);
		
		logger.info("#### memberList : {}", map.get("memberList"));

		model.addAttribute("total", total);
		model.addAttribute("pg", pg);
		model.addAttribute("blockScale", spaceBlock);
		model.addAttribute("keyword", keyword);
		model.addAttribute("searchType", searchType);

		return map;
	}
	
	// 회원가입 페이지 이동
	@RequestMapping(value = "/user/adminJoinReq.go")
	public String adminJoinReq() {
		logger.info("adminJoinReq 페이지 이동");
		
		return "user/adminJoinReq";
	}
	
	@RequestMapping(value = "/user/adminMemberJoinReq.ajax")
	@ResponseBody
	public Map<String, Object> adminMemberJoinReq(@RequestParam Map<String,Object> param,Model model) {
		int pg = param.get("pg") == null ? 1 : Integer.parseInt((String) param.get("pg"));
		String keyword = (String)param.get("keyword");
		logger.info("pg::"+pg);
		logger.info("keyword::"+keyword);
		
		int showList = 20;
		int spaceBlock = 5;
		param.put("start", (pg-1) * showList);
		int total = memberService.memberJoinCnt(param);
		int totalP = (total + (showList-1)) / showList;	
		int startPage = (pg-1) / spaceBlock*spaceBlock + 1;	
		int endPage= startPage + (spaceBlock-1);
		if(endPage > totalP) endPage = totalP;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("joinMemList",memberService.adminMemberJoinReqAjax(param));
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		map.put("totalP", totalP);
		
		model.addAttribute("total", total);
		model.addAttribute("pg", pg);
		model.addAttribute("blockScale", spaceBlock);
		model.addAttribute("keyword", keyword);

		return map;
	}
	
	
	
}