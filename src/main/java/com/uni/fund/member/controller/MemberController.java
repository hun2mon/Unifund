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
	
	
	@RequestMapping(value="member/login.do")
	public String login(Model model, HttpSession session, String id, String pw) {
		String page = "member/login";
		logger.info("id : {} / pw : {}", id, pw);
		
		MemberDTO loginInfo = memberService.login(id, pw);
		logger.info("login :" + loginInfo);

		
		if(loginInfo != null) {
			String mem_id = loginInfo.getMem_id();
			String mem_idx = loginInfo.getMem_idx() + "";
			page = "main";
			session.setAttribute("mem_id", mem_id);
			session.setAttribute("mem_idx", mem_idx);
			logger.info("sadfasd : {}", loginInfo.getMem_id());
			model.addAttribute("msg", "로그인에 성공하였습니다.");
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
		
		if(session.getAttribute("mem_idx")!=null) {
			int row = memberService.write(profilePhoto,mem_cor,param);
			if(row>0) {
				page = "writeForm";
			}
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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}