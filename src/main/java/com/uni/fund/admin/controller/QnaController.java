package com.uni.fund.admin.controller;

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

import com.uni.fund.admin.dao.QnaDAO;
import com.uni.fund.admin.dto.QnaDTO;
import com.uni.fund.admin.service.QnaService;

@Controller
public class QnaController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired QnaService qnaService;
	
	@RequestMapping(value = "/qna/adminQnaList.go")
	public String adminListGo(HttpSession session) {
		 String memId = (String) session.getAttribute("mem_id");
		 String page = "redirect:/member/login.go";
			if (memId != null) {
				page ="qna/adminQnaList";
			}
	 	return page;
	}
	

	
	
	@RequestMapping(value="/qna/create.go")
	public String writeForm() {
		logger.info("QnA 작성페이지 진입");
		return "qna/qnaForm";
	}
	
	@RequestMapping(value="/qna/create.do", method=RequestMethod.POST)
	public String qnaForm(HttpSession session, @RequestParam Map<String,String> param) {
		
		logger.info("param = {}",param);
		String page = "redirect:/member/login";
		String mem_idx = session.getAttribute("mem_idx").toString();
		
		logger.info("mem_idx"+mem_idx);
		if (session.getAttribute("mem_id") != null) {
			
			int row = qnaService.qnaForm(param,mem_idx);
			if(row>0)
			
					page = "redirect:/qna/list.go";
					
				
		}
		return page;
		
	}
	@RequestMapping(value="/qna/update.go")
	public String updateForm(Model model, HttpSession session) {
		logger.info("QnA 수정페이지 진입");
		String page = "member/login.go";
		String qna_idx = "15";
		QnaDTO qnaDTO = qnaService.qnaDetail(qna_idx);
		qnaDTO.setQna_idx(Integer.parseInt(qna_idx));
		model.addAttribute("qnaDTO",qnaDTO);
		
		return "qna/qnaUpdate";
	}
	
	
	
	@RequestMapping(value = "/qna/update.do")
	public String qnaUpdate( HttpSession session, @RequestParam Map<String, String> param, Model model) {
	    logger.info(":: update CONTROLLER IN ::");
	    logger.info("params ={}", param);
	    String page = "qna/qnaUpdate ";
	    String msg = "수정 실패";

	    
	    // 공지사항 수정을 위한 서비스 메서드 호출
	    int row = qnaService.qnaUpdate(param, session);
	    logger.info("row"+row);
	    if (row == 1) {
	        page = "redirect:/qna/qnaDetail.go?qna_idx=" + param.get("qna_idx");
	        msg = "수정 완료";
	    }

	    model.addAttribute("msg", msg);
	    logger.info("qnaUpdate controller end");

	    return page;
	}
	
	
	
	
	
	
	
	
	@RequestMapping(value = "/qna/adminQnaList.ajax")
	@ResponseBody
	public Map<String, Object> adminQnaList(String category, String page, String cnt){
		logger.info("category : {}", category);
		logger.info("페이지당 보여줄 갯수 : " + cnt);
		logger.info("요청 페이지 : " + page);
		
		int currPage = Integer.parseInt(page);
		int pagePerCnt = Integer.parseInt(cnt);
		
		Map<String, Object> map = qnaService.adminQnaList(category,currPage,pagePerCnt);
		
		return map;
	}
	
	@RequestMapping(value = "/qna/search.ajax")
	@ResponseBody
	public Map<String, Object> search(String keyWord, String page, String cnt){
		
		logger.info("페이지당 보여줄 갯수 : " + cnt);
		logger.info("요청 페이지 : " + page);

		int currPage = Integer.parseInt(page);
		int pagePerCnt = Integer.parseInt(cnt);
		
		Map<String, Object> map = qnaService.search(keyWord,currPage,pagePerCnt);
		return map;
	}
	
	@RequestMapping(value = "/qna/statusUpdate.do")
	public String statusUpdateDo(int qna_idx,String status) {
		logger.info("qna_idx : " +qna_idx);
		logger.info("status : " +status);
		
		qnaService.statusUpdate(qna_idx,status);
		
		return "redirect:/qna/adminQnaList.go";
	}
	
	@RequestMapping(value = "/qna/list.go")
	public String ListGo(HttpSession session) {
		 String memId = (String) session.getAttribute("mem_id");
		 String page = "redirect:/member/login.go";
			if (memId != null) {
				page = "qna/list";
			}

		
		return page;
	}
	

	

	@RequestMapping(value = "/qna/userQnaList.ajax")
	@ResponseBody
	public Map<String, Object> userQnaList(String category, String page, String cnt){
		logger.info("category : {}", category);
		logger.info("페이지당 보여줄 갯수 : " + cnt);
		logger.info("요청 페이지 : " + page);
		
		int currPage = Integer.parseInt(page);
		int pagePerCnt = Integer.parseInt(cnt);
		
		Map<String, Object> map = qnaService.userQnaList(category,currPage,pagePerCnt);
		
		return map;
	}

}
