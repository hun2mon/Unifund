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
	public String join(MultipartFile profilePhoto, MultipartFile mem_cor, HttpSession session, 
			@RequestParam Map<String,String>param, Model model){
		String page = "joinForm";
		String msg = "회원가입에 실패 했습니다.";
		logger.info("회원가입 do로 옴");
		logger.info("param join do 에서 받은 파람 :"+param);
		logger.info(mem_cor.getOriginalFilename()+" ::" +profilePhoto.getOriginalFilename());
		
		int row = memberService.join(param,mem_cor);
		logger.info("insert count : "+ row);
//		int row=1;
		if(row==1) {
			page = "member/login";
			msg = "회원가입에 성공 했습니다.";		
			logger.info("회원가입 성공시 메세지 : "+ msg);
		}
		
		model.addAttribute("msg", msg);
		
		return page;
	}
	
	
	
	@RequestMapping(value="/login.do")
	public String login(Model model, HttpSession session, String id, String pw) {
		String page = "member/login";
		logger.info("id : {} / pw : {}", id, pw);
		
		MemberDTO loginInfo = memberService.login(id, pw);
		session.setAttribute("Mem_idx", loginInfo.getMem_post());
		session.setAttribute("Mem_id", loginInfo.getMem_post());
		session.setAttribute("Mem_name", loginInfo.getMem_post());
		session.setAttribute("Mem_birth", loginInfo.getMem_post());
		session.setAttribute("Mem_number", loginInfo.getMem_post());
		session.setAttribute("Mem_gender", loginInfo.getMem_post());
		session.setAttribute("Mem_bankName", loginInfo.getMem_post());
		session.setAttribute("Mem_bank", loginInfo.getMem_bank());
		session.setAttribute("Mem_cor", loginInfo.getMem_cor());
		session.setAttribute("Mem_uni", loginInfo.getMem_post());
		session.setAttribute("Mem_joindate", loginInfo.getMem_post());
		session.setAttribute("Mem_status", loginInfo.getMem_post());
		session.setAttribute("Mem_post", loginInfo.getMem_post());
		session.setAttribute("Mem_addr", loginInfo.getMem_post());
		session.setAttribute("Mem_detail", loginInfo.getMem_post());
		session.setAttribute("Mem_cash", loginInfo.getMem_post());
		
		logger.info("login :" + loginInfo);
		
		if(loginInfo != null) {
			page = "member/joinForm";
			session.setAttribute("loginId", loginInfo.getMem_id());
			
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
		map.put("use", memberService.overlay(id));
		
		return map;
	}
	
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	 public String write(MultipartFile[] photos, HttpSession session,
			 @RequestParam(name ="profilePhoto") Map<String,String>param) {
		logger.info("글 작성 요청");
		String page = "redirect:/main";
		
		if(session.getAttribute("loginId")!=null) {
			int row = memberService.write(photos,param);
			if(row<1) {
				page = "writeForm";
			}
			
			
		}
		return page;
		}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}