package com.uni.fund.member.service;

import java.sql.Date;
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
	
	public int join(Map<String, String> param) {
		logger.info("회원 가입 param 값");
		int row = memberDAO.join(param);
		String perm = param.get("auth");
		if(perm !=null) {
			memberDAO.setPermission(param.get("id"),perm);
		
		}
		return row;
	}
	
	public String login(String id, String pw) {
		logger.info("Id,Pw 확인");
		return memberDAO.login(id,pw);
	}
	
	public int overlay(String id) {
		return memberDAO.overlay(id);
	}
	
	
	public int write(MultipartFile[] photos, 
			Map<String, String> param) {

		int row = -1;
		
		MemberDTO dto = new MemberDTO();
		dto.setMem_cor(null);
		dto.setMem_addr(null);
		
		dto.setMem_id(param.get("mem_id"));
		dto.setMem_pw(param.get("mem_pw"));
		dto.setMem_name(param.get("mem_name"));
		dto.setMem_birth(param.get("mem_birth"));
		dto.setMem_number(param.get("mem_number"));
		dto.setMem_gender(param.get("mem_gender"));
		dto.setMem_email(param.get("mem_email"));
		dto.setMem_bankName(param.get("mem_bankName"));
		dto.setMem_bank(param.get("mem_bank"));
		dto.setMem_cor(param.get("mem_cor"));
		dto.setMem_uni(param.get("mem_uni"));
		dto.setMem_joindate(Date.valueOf(param.get("mem_joindate")));
		dto.setMem_status(param.get("mem_status"));
		dto.setMem_post(param.get("mem_post"));
		dto.setMem_addr(param.get("mem_addr"));
		dto.setMem_detail(param.get("mem_detail"));
		dto.setMem_cash(Integer.parseInt(param.get("mem_cash")));
		dto.setMem_mileage(Integer.parseInt(param.get("mem_mileage")));
		
		
		row = memberDAO.write(dto);
		
		int idx = dto.getMem_idx();
		logger.info("idx=" + idx);
		/*if (row > 0) {
			fileSave(idx, photos); 
		}*/

		return row;

	
	
	
	
	
	
	
	
	
	
	}
	
}
