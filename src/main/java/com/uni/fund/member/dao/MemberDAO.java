package com.uni.fund.member.dao;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.uni.fund.member.dto.MemberDTO;
import com.uni.fund.project.dto.ProjectDTO;

public interface MemberDAO {

	int join(Map<String, String> param);

	void setPermission(String string, String perm);

	MemberDTO login(String id, String pw);

	int overlay(String id);

	int write(MemberDTO dto);

	void fileWrite(String fileName, int idx, String photoType);
	
	List<MemberDTO> memberListAjax(Map<String, Object> param);

	int memberTotalCnt(Map<String, Object> param);

	List<MemberDTO> adminMemberJoinReqAjax(Map<String, Object> param);

	int memberJoinCnt(Map<String, Object> param);

	String findId(String mem_name, String mem_number);

	int findPw(String mem_pw, String mem_id, String mem_number);
	
	int adminMemberSubmitStatus(Map<String, Object> param);

	int adminMemberRefuseStatus(Map<String, Object> param);

	void adminAddRefuseStatusTable(Map<String, Object> param);

	void adminAddSubmitStatusTable(Map<String, Object> param);

	List<MemberDTO> adminMemberDetail(Integer mem_idx);

	List<MemberDTO> memActPhoList(int pagePerCnt, int start, int memIdx);

	int memActPhoListCnt(int pagePerCnt, int memIdx);

	int stopMemberApply(Map<String, Object> param);

	void updatStopeMemberStatus(Map<String, Object> param);

	int stopMemberChange(Map<String, Object> param);

	int deleteMemberChange(Map<String, Object> param);

	void changeMemStoY(Map<String, Object> param);

	List<MemberDTO> adminMemberUpdate(int memIdx);

	int deletePhotoAct(Map<String, Object> param);

	int addPhoAct(MultipartFile[] fileInput);

	int adminMemberUpdateDo(Map<String, String> param);

	void adminMemberIntroUpdateDo(Map<String, String> param);

}
