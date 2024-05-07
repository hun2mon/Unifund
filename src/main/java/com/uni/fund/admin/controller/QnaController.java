package com.uni.fund.admin.controller;

import java.util.HashMap;
import java.util.List;
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
import com.uni.fund.admin.dto.AnnouncementDTO;
import com.uni.fund.admin.dto.QnaDTO;
import com.uni.fund.admin.service.QnaService;
import com.uni.fund.project.dto.ReviewDTO;

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
		String mem_idx = "";
		
		logger.info("mem_idx"+mem_idx);
		if (session.getAttribute("mem_id") != null) {
			mem_idx = session.getAttribute("mem_idx").toString();
			int row = qnaService.qnaForm(param,mem_idx);
			if(row>0)
			
					page = "redirect:/qna/list.go" ;
					
				
		}
		return page;
		
	}
	@RequestMapping(value = "/qna/qnaDetail.go")
	public String qnaDetail(Model model, HttpSession session, Integer qna_idx, Integer mem_idx, String mem_status) {
		logger.info("상세보기 요청");
		logger.info("qna_idx=" + qna_idx);
		QnaDTO qnaDTO = qnaService.qnaDetail(qna_idx);
		// logger.info("UserInfo :{}",announcementDTO.toString());
		model.addAttribute("qnaDTO", qnaDTO);
		model.addAttribute("qna_idx",qna_idx);
		return "qna/qnaDetail";
	}
	
	

	
	
	
	
	
	@RequestMapping(value="/qna/update.go")
	public String updateForm(Model model, HttpSession session , Integer qna_idx) {
		logger.info("QnA 수정페이지 진입");
		String page = "member/login.go";
		QnaDTO qnaDTO = qnaService.qnaDetail(qna_idx);
		qnaDTO.setQna_idx((qna_idx));
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
	
	@RequestMapping(value = "/qna/userSearch.ajax")
	@ResponseBody
	public Map<String, Object> userSearch(String keyWord, String page, String cnt){
		
		logger.info("페이지당 보여줄 갯수 : " + cnt);
		logger.info("요청 페이지 : " + page);

		int currPage = Integer.parseInt(page);
		int pagePerCnt = Integer.parseInt(cnt);
		
		Map<String, Object> map = qnaService.userSearch(keyWord,currPage,pagePerCnt);
		return map;
	}
	
	@RequestMapping(value = "/qna/statusUpdate.do")
	public String statusUpdateDo(int qna_idx,String status) {
		logger.info("qna_idx : " +qna_idx);
		logger.info("status : " +status);
		
		qnaService.statusUpdate(qna_idx,status);
		
		return "redirect:/qna/adminQnaList.go";
	}
	
	
	@RequestMapping(value = "/qna/delete.ajax", method = RequestMethod.POST)
	@ResponseBody
	public String qnaDel(@RequestParam("qnaDel") Integer qnaDel) {
		// 공지사항 삭제 기능 구현
		qnaService.qnaDel(qnaDel);
		
		return "success";
		
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

	
	@RequestMapping(value= "/qna/allChangeStatus.do")
	public String allChangeStatusDO(@RequestParam("qna_idx") List<String> qnaIdxList,String status) {
		logger.info("qna_idx List : {}",qnaIdxList);
		logger.info("status : " + status);
		qnaService.allChangeStatusDO(qnaIdxList,status);
		
		return "redirect:/qna/adminQnaList.go";
		       
	}
	
	@RequestMapping(value="/qna/passCheck.ajax")
	@ResponseBody
	public Map<String, Object> passCheck(String qnaIdx){
		logger.info(qnaIdx);
		int qna_idx = Integer.parseInt(qnaIdx);
		
		Map<String,Object> map = qnaService.passCheck(qna_idx);
		
		return map;
	}


	
	
	@RequestMapping(value = "/qna/replyList.ajax")
	@ResponseBody
	public Map<String, Object> replyAjax(String qna_idx){
		logger.info("qna_idx : {}" , qna_idx);
		Map<String, Object> map = new HashMap<String, Object>();
		List<QnaDTO> list = qnaService.rplList(qna_idx);
		map.put("list", list);
		logger.info("list : {}",list);
		return map;
	}
	
	

	@RequestMapping(value="/qna/delete.do")
	public String del(Model model, Integer comm_idx, HttpSession session, String qna_idx) {
		String page="redirect:/";
		
		logger.info("del comm_idx" + comm_idx);
		logger.info("del qna_idx" + qna_idx);
		

			logger.info("comm_idx=" + comm_idx);
			qnaService.rplDel(comm_idx);
			page = "redirect:/qna/qnaDetail.go?qna_idx="+qna_idx;
		
		
		return page;
	}
	
	@RequestMapping(value = "/qna/reply/write.do", method = RequestMethod.POST)
	public String replyWrite(@RequestParam Map<String,String> param, Model model,HttpSession session) {
		String page = "redirect:/";
		logger.info("param : {}", param);
		logger.info("param_qna_idx : {}",param.get("qna_idx"));
		int mem_idx = (int) session.getAttribute("mem_idx");
		logger.info("mem_idx : {}", mem_idx);
		param.put("mem_idx", String.valueOf(mem_idx));
		int row = qnaService.replyDo(param);
		logger.info("row : {}",row);
		return "redirect:/qna/qnaDetail.go?qna_idx=" + param.get("qna_idx");
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
