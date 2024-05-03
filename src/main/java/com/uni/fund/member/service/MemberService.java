package com.uni.fund.member.service;

import java.util.HashMap;
import java.util.List;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.uni.fund.member.dao.MemberDAO;
import com.uni.fund.member.dto.MemberDTO;



@Service
public class MemberService {
		@Autowired MemberDAO memberDAO;
	Logger logger = LoggerFactory.getLogger(getClass());
	
	public String file_root = "C:/upload/";
	
	
	public MemberDTO login(String id, String pw) {
		logger.info("id : {} / pw : {}", id, pw);
		return memberDAO.login(id,pw);
	}
	
	public int overlay(String id) {
		return memberDAO.overlay(id);
	}
	
	
	public int write(MultipartFile profilePhoto, MultipartFile mem_cor, Map<String, String> param) {

		int row = -1;
		
		MemberDTO dto = new MemberDTO();
		
		dto.setMem_id(param.get("mem_id"));
		dto.setMem_pw(param.get("mem_pw"));
		dto.setMem_name(param.get("mem_name"));
		dto.setMem_birth(param.get("mem_birth"));
		dto.setMem_number(param.get("mem_number"));
		dto.setMem_gender(param.get("mem_gender"));
		dto.setMem_email(param.get("mem_email"));
		dto.setMem_bankName(param.get("mem_bankName"));
		dto.setMem_bank(param.get("mem_bank"));
		dto.setMem_uni(param.get("mem_uni"));
		dto.setMem_post(param.get("mem_post"));
		dto.setMem_addr(param.get("mem_addr"));
		dto.setMem_detail(param.get("mem_detail"));
		
		
		row = memberDAO.write(dto);
		
		int idx = dto.getMem_idx();
		logger.info("idx=" + idx);
		if (row > 0) {
			fileSave(idx,profilePhoto,"A"); 
			fileSave(idx,mem_cor,"B"); 
		}
		return row;
	}


	private void fileSave(int idx, MultipartFile mem_cor, String cate) {
		String fileName = mem_cor.getOriginalFilename();
		logger.info("upload file name : " + fileName);
		if (!fileName.equals("")) {
			String ext = fileName.substring(fileName.lastIndexOf("."));
			String newFileName = System.currentTimeMillis() + ext;
			logger.info(fileName + " -> " + newFileName);
			try {
				byte[] bytes = mem_cor.getBytes(); // MultipartFile 로 부터 바이너리 추출
				Path path = Paths.get(file_root + newFileName);// 저장경로지정
				Files.write(path, bytes);// 저장
				
				  // DAO를 통해 파일 이름을 데이터베이스에 저장
	            memberDAO.fileWrite(newFileName, idx, cate);

				Thread.sleep(1);// 파일명을 위해 강제 휴식 부여
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	
	public List<MemberDTO> memberListAjax(Map<String, Object> param) {
		return memberDAO.memberListAjax(param);
	}

	public int memberTotalCnt(Map<String, Object> param) {
		return memberDAO.memberTotalCnt(param);
	}

	public List<MemberDTO> adminMemberJoinReqAjax(Map<String, Object> param) {
		return memberDAO.adminMemberJoinReqAjax(param);
	}
	
	public int memberJoinCnt(Map<String, Object> param) {
		return memberDAO.memberJoinCnt(param);
	}

	public Object findId(String mem_name, String mem_number) {
		return memberDAO.findId(mem_name,mem_number);
	}

	
	public int findPw(String memId, String new_password) {
		return memberDAO.findPw(memId, new_password);
	}
	public int adminMemberSubmitStatus(Map<String, Object> param) {
		memberDAO.adminAddSubmitStatusTable(param);
		return memberDAO.adminMemberSubmitStatus(param);
	}

	public int adminMemberRefuseStatus(Map<String, Object> param) {
		memberDAO.adminAddRefuseStatusTable(param);
		return memberDAO.adminMemberRefuseStatus(param);
	}

	public List<MemberDTO> adminMemberDetail(Integer mem_idx) {
		return memberDAO.adminMemberDetail(mem_idx);
	}

	public Map<String, Object> memActPhoList(int currPage, int pagePerCnt, int memIdx) {
		int start = (currPage-1) * pagePerCnt;
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<MemberDTO> memActPhoList = memberDAO.memActPhoList(pagePerCnt,start,memIdx);
		map.put("list",memActPhoList);
		map.put("currPage", currPage);
		map.put("totalPages", memberDAO.memActPhoListCnt(pagePerCnt,memIdx));
		
		return map;
	}

	public int stopMemberApply(Map<String, Object> param) {
		memberDAO.updatStopeMemberStatus(param);
		return memberDAO.stopMemberApply(param);
	}

	public int memCheck(String mem_id, String mem_number) {
		return memberDAO.memCheck(mem_id,mem_number);
	}

	public int stopMemberChange(Map<String, Object> param) {
		return memberDAO.stopMemberChange(param);
	}

	public int deleteMemberChange(Map<String, Object> param) {
		memberDAO.changeMemStoY(param);
		return memberDAO.deleteMemberChange(param);
	}

	public List<MemberDTO> adminMemberUpdate(int memIdx) {
		return memberDAO.adminMemberUpdate(memIdx);
	}

	public int deletePhotoAct(Map<String, Object> param) {
		return memberDAO.deletePhotoAct(param);
	}

	public int addPhoAct(MultipartFile[] fileInput) {
		return memberDAO.addPhoAct(fileInput);
	}

	public int adminMemberUpdateDo(Map<String, String> param) {
		memberDAO.adminMemberIntroUpdateDo(param);
		return memberDAO.adminMemberUpdateDo(param);
	}
	
}
