package com.uni.fund.member.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
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
	@Autowired
	MemberService memberService;

	// 로그인 페이지 이동
	@RequestMapping(value = "/member/login.go")
	public String home() {
		logger.info("최초 로그인 페이지 요청");
		return "member/login";
	}

	// 회원가입 페이지 이동
	@RequestMapping(value = "/member/join.go")
	public String joinForm() {
		logger.info("회원가입 페이지 이동");
		return "member/joinForm";
	}

	// id찾기 페이지 이동
	@RequestMapping(value = "/member/findId.go")
	public String findId() {
		logger.info("아이디찾기 페이지 이동");
		return "member/findId";
	}

	// 비밀번호찾기 페이지 이동
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
		model.addAttribute("msg", "로그아웃 되었습니다.");
		return "/main";
	}

	@RequestMapping(value = "member/login.do")
	public String login(Model model, HttpSession session, String id, String pw,
			@RequestParam(value = "remember", required = false) String remember) {
		String page = "member/login";
		logger.info("id : {} / pw : {}", id, pw);

		MemberDTO loginInfo = memberService.login(id, pw);
		logger.info("login :" + loginInfo);

		if (loginInfo != null) {
			if (loginInfo.getMem_status().equals("M") || loginInfo.getMem_status().equals("Y")) {
				page = "main";
				session.setAttribute("mem_idx", loginInfo.getMem_idx());
				session.setAttribute("mem_status", loginInfo.getMem_status());
				session.setAttribute("mem_id", loginInfo.getMem_id());
				logger.info("status:{}", loginInfo.getMem_status());
			} else {
				model.addAttribute("msg", "로그인이 불가능한 상태입니다.");
			}
		} else {
			model.addAttribute("msg", "아이디 또는 비밀번호 확인해주세요");
		}

		return page;
	}

	@RequestMapping(value = "/member/join.do", method = RequestMethod.POST)
	public String write(MultipartFile profilePhoto, MultipartFile mem_cor, HttpSession session,
			@RequestParam Map<String, String> param) {
		logger.info("글 작성 요청");
		logger.info("param : {}", param);
		logger.info("profilePhoto : {}", profilePhoto);
		logger.info("mem_cor : {}", mem_cor);

		String page = "redirect:/main";

		int row = memberService.write(profilePhoto, mem_cor, param);
		if (row > 0) {
			page = "/member/joinForm";

		}
		return page;
	}

	// 회원가입 아이디 유효성 검사
	@RequestMapping(value = "member/overlay.do")
	@ResponseBody
	public Map<String, Object> overlay(String id) {
		logger.info("id=" + id);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("use", memberService.overlay(id));

		return map;
	}

	// ID찾기 AJAX로 서버에 요청
	@RequestMapping(value = "member/findId.ajax")
	@ResponseBody
	public Map<String, Object> findId(String mem_name, String mem_number) {
		logger.info("userId : " + mem_name);
		logger.info("mem_number : " + mem_number);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("use", memberService.findId(mem_name, mem_number));

		return map;
	}

	// PW변경하기
	@RequestMapping(value = "member/findPw.do", method = RequestMethod.POST)
	public String findPw(String memId, String new_password) {
		String page = "member/findPw";
		logger.info("mem_id: {}", memId);
		logger.info("mem_pw: {}", new_password);
		int row = memberService.findPw(memId, new_password);
		if (row > 0) {
			page = "member/login";
		}
		return page;
	}

	// 인증번호 받기
	@RequestMapping(value = "member/memCheck.ajax", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> memCheck(String mem_id, String mem_number) {
		String page = "member/findPw";
		logger.info("mem_Id: {}", mem_id);
		logger.info("mem_number: {}", mem_number);
		Map<String, Object> map = new HashMap<String, Object>();
		int row = memberService.memCheck(mem_id, mem_number);
		if (row > 0) {
			map.put("check", row);
		} else {
			map.put("check", 0);
		}

		return map;
	}

	@RequestMapping(value = "/user/adminList.go")
	public String adminMemberList(HttpSession session, Model model) {
		String status = (String) session.getAttribute("mem_status");
		String page = "redirect:/member/login.go";
		logger.info("mem_status=" + status);
		logger.info("status=" + status);

		if (status != null && status.equals("M")) {
			page = "./user/adminMemberList";
		} else {
			model.addAttribute("msg", "로그인이 필요한 서비스입니다.");
		}

		return page;
	}

	@RequestMapping(value = "/user/adminMemberList.ajax")
	@ResponseBody
	public Map<String, Object> adminMemberListAjax(@RequestParam Map<String, Object> param, Model model) {
		int pg = param.get("pg") == null ? 1 : Integer.parseInt((String) param.get("pg"));
		String searchType = (String) param.get("searchType");
		String keyword = (String) param.get("keyword");
		logger.info("pg::" + pg);
		logger.info("searchType::" + searchType);
		logger.info("keyword::" + keyword);

		int showList = 10;
		int spaceBlock = 5;
		param.put("start", (pg - 1) * showList);
		int total = memberService.memberTotalCnt(param);
		int totalP = (total + (showList - 1)) / showList;
		int startPage = (pg - 1) / spaceBlock * spaceBlock + 1;
		int endPage = startPage + (spaceBlock - 1);
		if (endPage > totalP)
			endPage = totalP;

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberList", memberService.memberListAjax(param));
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
	public String adminJoinReq(HttpSession session,Model model) {
		String status = (String)session.getAttribute("mem_status"); 
		String page= "redirect:/member/login.go";
		logger.info("mem_status="+status);
		logger.info("status="+status);
		
		if(status != null && status.equals("M")) {
			page = "./user/adminJoinReq";
		}else {
			model.addAttribute("msg","로그인이 필요한 서비스입니다.");
		}
		
		return page;
	}

	@RequestMapping(value = "/user/adminMemberJoinReq.ajax")
	@ResponseBody
	public Map<String, Object> adminMemberJoinReq(@RequestParam Map<String, Object> param, Model model) {
		int pg = param.get("pg") == null ? 1 : Integer.parseInt((String) param.get("pg"));
		String keyword = (String) param.get("keyword");
		logger.info("pg::" + pg);
		logger.info("keyword::" + keyword);

		int showList = 10;
		int spaceBlock = 5;
		param.put("start", (pg - 1) * showList);
		int total = memberService.memberJoinCnt(param);
		int totalP = (total + (showList - 1)) / showList;
		int startPage = (pg - 1) / spaceBlock * spaceBlock + 1;
		int endPage = startPage + (spaceBlock - 1);
		if (endPage > totalP)
			endPage = totalP;

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("joinMemList", memberService.adminMemberJoinReqAjax(param));
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		map.put("totalP", totalP);

		model.addAttribute("total", total);
		model.addAttribute("pg", pg);
		model.addAttribute("blockScale", spaceBlock);
		model.addAttribute("keyword", keyword);

		return map;
	}

	@RequestMapping(value = "/user/adminMemberSubmitStatus.ajax")
	@ResponseBody
	public Map<String, Object> adminMemberSubmitStatus(@RequestParam Map<String, Object> param, Model model) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("submitStatus", memberService.adminMemberSubmitStatus(param));
		logger.info("#### submitStatus : {}", map.get("submitStatus"));
		return map;
	}

	@RequestMapping(value = "/user/adminMemberRefuseStatus.ajax")
	@ResponseBody
	public Map<String, Object> adminMemberRefuseStatus(@RequestParam Map<String, Object> param, Model model) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("refuseStatus", memberService.adminMemberRefuseStatus(param));
		logger.info("#### refuseStatus : {}", map.get("refuseStatus"));
		return map;
	}

	@RequestMapping(value = "/user/adminMemberDetail.go")
	public String adminMemberDetail(HttpSession session, Model model, @RequestParam(value = "mem_idx") String mem_idx) {
		String status = (String) session.getAttribute("mem_status");
		String page = "";

		String adminId = (String) session.getAttribute("mem_id");
		logger.info("##### adminId : {}", adminId);

		logger.info("mem_status=" + status);
		logger.info("status=" + status);
		if (status != null && status.equals("M")) {
			int memIdx = Integer.parseInt(mem_idx);
			logger.info("inininininin");
			List<MemberDTO> adminMemberDetail = memberService.adminMemberDetail(memIdx);
			page = "./user/adminMemberDetail";
			logger.info("adminMemberDetail=" + adminMemberDetail);

			if (!adminMemberDetail.isEmpty()) {
	            MemberDTO memberDTO = adminMemberDetail.get(0);
	            model.addAttribute("adminMemberDetail", adminMemberDetail);
	            model.addAttribute("memIdx", memIdx);
	            model.addAttribute("mng_rsndate", memberDTO.getMng_rsndate()); 
	            model.addAttribute("mng_stopdate", memberDTO.getMng_stopdate()); 
	            logger.info("mng_stopdate:{}",memberDTO.getMng_stopdate());
	        }
			
			
		}else {
			model.addAttribute("msg","로그인이 필요한 서비스입니다.");
			 page= "redirect:/member/login.go";
		}

		return page;
	}

	@RequestMapping(value = "/user/memActPhoList.ajax")
	@ResponseBody
	public Map<String, Object> memActPhoList(String page, String cnt, Model model, String mem_idx) {
		int memIdx = Integer.parseInt(mem_idx);
		int currPage = Integer.parseInt(page);
		int pagePerCnt = Integer.parseInt(cnt);
		logger.info("::::mem_idx::" + mem_idx);
		Map<String, Object> map = memberService.memActPhoList(currPage, pagePerCnt, memIdx);
		logger.info("#### memActPhoList : {}", map);
		return map;
	}

	@RequestMapping(value = "/user/fileRead/{file_read}")
	public void download(@PathVariable String file_read, HttpServletResponse response) {
		String file_root = "/Users/hsg/upload/Unifund/" + file_read;

		File file = new File(file_root);

		if (file.exists()) {
			response.setHeader("Content-Disposition", "attachment; file_read=\"" + file_read + "\"");
			response.setContentType("application/octet-stream");
			try (FileInputStream fis = new FileInputStream(file);
					BufferedInputStream bis = new BufferedInputStream(fis);
					OutputStream out = response.getOutputStream()) {

				byte[] buffer = new byte[1024];
				int bytesRead;

				while ((bytesRead = bis.read(buffer)) != -1) {
					out.write(buffer, 0, bytesRead);
				}

			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			logger.info("그만..");
		}
	}

	@RequestMapping(value = "/user/stopMemberApply.ajax")
	@ResponseBody
	public Map<String, Object> stopMemberApply(@RequestParam Map<String, Object> param, Model model,
			HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("stopMemberApply", memberService.stopMemberApply(param));
		logger.info("#### stopMemberApply : {}", map.get("stopMemberApply"));
		return map;
	}
	
	@RequestMapping(value = "/user/stopMemberChange.ajax")
	@ResponseBody
	public Map<String, Object> stopMemberChange(@RequestParam Map<String,Object> param,Model model,HttpSession session) {
		
		String stopApply = (String) param.get("mng_stopdate");
		logger.info("stopApply->>",stopApply);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		if (stopApply.equals("0")) {
			map.put("deleteMemberChange",memberService.deleteMemberChange(param));
		}else {
			map.put("stopMemberChange",memberService.stopMemberChange(param));
		}
		
		logger.info("#### stopMemberChange : {}", map.get("stopMemberChange"));
		return map;
	}
	
	@RequestMapping(value = "/user/adminMemberUpdate.go")
	public String adminMemberUpdate(HttpSession session, Model model, @RequestParam(value="mem_idx") String mem_idx) {
		String status = (String)session.getAttribute("mem_status"); 
		String page= "";
		
		String adminId = (String)session.getAttribute("mem_id");
		logger.info("##### adminId : {}", adminId);
		
		logger.info("mem_status="+status);
		logger.info("status="+status);
		if(status != null && status.equals("M")) {
			int memIdx = Integer.parseInt(mem_idx);
			logger.info("adminMemberUpdateadminMemberUpdate");
			List<MemberDTO> adminMemberUpdate = memberService.adminMemberUpdate(memIdx);
			page = "./user/adminMemberUpdate";
			logger.info("adminMemberUpdate="+adminMemberUpdate);
			
			
			if (!adminMemberUpdate.isEmpty()) {
	            MemberDTO memberDTO = adminMemberUpdate.get(0);
	            model.addAttribute("adminMemberUpdate", adminMemberUpdate);
	            model.addAttribute("memIdx", memIdx);
	            model.addAttribute("mng_rsndate", memberDTO.getMng_rsndate()); 
	            model.addAttribute("mng_stopdate", memberDTO.getMng_stopdate()); 
	            logger.info("mng_stopdate:{}",memberDTO.getMng_stopdate());
	        }
			
			
		}else {
			model.addAttribute("msg","로그인이 필요한 서비스입니다.");
			 page= "redirect:/member/login.go";
		}
		
	    return page;
	}
	
	@RequestMapping(value = "/user/deletePhotoAct.ajax")
	@ResponseBody
	public Map<String, Object> deletePhotoAct(@RequestParam Map<String,Object> param,Model model,HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("deletePhotoAct",memberService.deletePhotoAct(param));
		logger.info("#### deletePhotoAct : {}", map.get("deletePhotoAct"));
		return map;
	}
	
	@RequestMapping(value = "/user/addPhoAct.ajax")
	@ResponseBody
	public Map<String, Object> addPhoAct(MultipartFile[] fileInput, @RequestParam Map<String,Object> param,Model model,HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("addPhoAct",memberService.addPhoAct(fileInput));
		logger.info("#### addPhoAct : {}", map.get("addPhoAct"));
		return map;
	}
	
	@RequestMapping(value = "/user/adminMemberUpdate.do", method = RequestMethod.POST)
	public String adminMemberUpdateDo(@RequestParam Map<String, String> param) {
		logger.info(":: adminMemberUpdate CONTROLLER IN ::");
		logger.info("mem_idx:{}",param.get("mem_idx"));
		String page = "redirect:/user/adminMemberDetail.go";
		
		int row = memberService.adminMemberUpdateDo(param);
		if(row == 1 ) {
			page = "redirect:/user/adminMemberDetail.go?mem_idx="+param.get("mem_idx");
			//page = "redirect:/detail?idx=" + param.get("idx");
		}
		return page;
	}
}