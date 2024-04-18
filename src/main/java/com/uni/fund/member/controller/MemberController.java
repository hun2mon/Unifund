package com.uni.fund.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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
	
	
	@RequestMapping(value = "/")
	public String home() {
		logger.info("최초 로그인 페이지 요청");
		return "member/login";
	}

	@RequestMapping(value = "/join.go")
	public String joinForm() {
		logger.info("회원가입 페이지 이동");
		return "member/joinForm";
	}
	
	@RequestMapping(value = "/join.do", method = RequestMethod.POST)
	public String join(Model model,  @RequestParam Map<String,String>  param){
		String page = "joinForm";
		String msg = "회원가입에 실패 했습니다.";
		logger.info("param :"+param);
		
		int row = MemberService.join(param);
		logger.info("insert count : "+row);
		
		if(row==1) {
			page = "login";
			msg = "회원가입에 성공 했습니다.";			
		}
		
		model.addAttribute("msg", msg);
		return page;
	}
	
	@RequestMapping(value="/login")
	public String login(Model model, HttpSession session, String id, String pw) {
		String page = "login";
		logger.info("id : {} / pw : {}", id, pw);
		
		MemberDTO info = MemberService.login(id, pw);
		logger.info("login :" + info);
		
		if(info != null) {
			page = "redirect:/list";
			session.setAttribute("loginInfo", info);
		}else {
			model.addAttribute("msg", "아이디 또는 비밀번호 확인해주세요");
		}
		
		return page;
	}
	
	@RequestMapping(value="/overlay.do")
	@ResponseBody
	public Map<String, Object> overlay(String id) {
		logger.info("id="+id);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("use", MemberService.overlay(id));
		
		return map;
	}
	
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	 public String write(MultipartFile[] photos, HttpSession session,
			 @RequestParam Map<String,String>param) {
		logger.info("글 작성 요청");
		String page = "redirect:/list";
		if(session.getAttribute("loginId")!=null) {
			int row = service.write(photos,param);
			if(row<1) {
				page = "writeForm";
			}
			
			
		}
		return page;
		}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}