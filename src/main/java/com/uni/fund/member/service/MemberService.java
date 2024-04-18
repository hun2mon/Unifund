package com.uni.fund.member.service;

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
		@Autowired MemberDAO MemberDAO;
	Logger logger = LoggerFactory.getLogger(getClass());
	
	public int join(Map<String, String> param) {
		logger.info("회원 가입 param 값");
		int row = MemberDAO.join(param);
		String perm = param.get("auth");
		if(perm !=null) {
			MemberDAO.setPermission(param.get("id"),perm);
		
		}
		return row;
	}
	
	public MemberDTO login(String id, String pw) {
		logger.info("Id,Pw 확인");
		return MemberDAO.login(id,pw);
	}
	
	public int overlay(String id) {
		return MemberDAO.overlay(id);
	}
	
	
	public int write(MultipartFile[] photos, 
			Map<String, String> param) {

		int row = -1;
		
		MemberDTO dto = new MemberDTO();
		dto.setUser_name(param.get("user_name"));
		dto.setSubject(param.get("subject"));
		dto.setContent(param.get("content"));
		row = dao.write(dto);
		
		int idx = dto.getIdx();
		logger.info("idx=" + idx);
		if (row > 0) {
			fileSave(idx, photos); 
		}

		return row;

	
	
	
	
	
	
	
	
	
	
	
	
}
