package com.uni.fund.member.dao;

import java.util.Map;

import com.uni.fund.member.dto.MemberDTO;

public interface MemberDAO {

	int join(Map<String, String> param);

	void setPermission(String string, String perm);

	MemberDTO login(String id, String pw);

	int overlay(String id);

	int write(MemberDTO dto);

	void fileWrite(String fileName, String newFileName, int idx);

}
