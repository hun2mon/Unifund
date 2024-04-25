package com.uni.fund.member.dao;

import java.util.List;
import java.util.Map;

import com.uni.fund.member.dto.MemberDTO;

public interface MemberDAO {

	int join(Map<String, String> param);

	void setPermission(String string, String perm);

	MemberDTO login(String id, String pw);

	int overlay(String id);

	int write(MemberDTO dto);

	void fileWrite(String fileName, String newFileName, int idx);
	
	List<MemberDTO> memberListAjax(Map<String, Object> param);

	int memberTotalCnt(Map<String, Object> param);

	List<MemberDTO> adminMemberJoinReqAjax(Map<String, Object> param);

	int memberJoinCnt(Map<String, Object> param);

}
