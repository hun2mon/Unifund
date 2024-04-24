package com.uni.fund.member.dao;

import java.util.List;
import java.util.Map;

import com.uni.fund.member.dto.MemberDTO;

public interface MemberDAO {

	List<MemberDTO> memberListAjax(Map<String, Object> param);

	int memberTotalCnt(Map<String, Object> param);

}
