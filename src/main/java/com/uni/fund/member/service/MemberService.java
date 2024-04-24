package com.uni.fund.member.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uni.fund.member.dao.MemberDAO;
import com.uni.fund.member.dto.MemberDTO;

@Service
public class MemberService {
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired MemberDAO memberDAO;
	
	public List<MemberDTO> memberListAjax(Map<String, Object> param) {
		return memberDAO.memberListAjax(param);
	}

	public int memberTotalCnt(Map<String, Object> param) {
		return memberDAO.memberTotalCnt(param);
	}
	
}
