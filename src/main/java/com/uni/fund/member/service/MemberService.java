package com.uni.fund.member.service;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
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
	
	public int join(Map<String, String> param, MultipartFile mem_cor) {
		logger.info("회원 가입 param 값");
		param.put("mem_cor", mem_cor.getOriginalFilename());
		int row = memberDAO.join(param);
		String perm = param.get("auth");
		if(perm !=null) {
			memberDAO.setPermission(param.get("id"),perm);
		
		}
		return row;
	}
	
	public MemberDTO login(String id, String pw) {
		MemberDTO memberInfo = memberDAO.login(id,pw);
		logger.info(memberInfo.getMem_idx() + "로그인 서비스에서받은 값");
		logger.info(memberInfo.getMem_id() + "로그인 서비스에서 받은 값");
		logger.info(memberInfo.getMem_name() + "로그인 서비스에서 받은 값");
		logger.info(memberInfo.getMem_birth() + "로그인 서비스에서 받은 값");
		logger.info(memberInfo.getMem_number() + "로그인 서비스에서 받은 값");
		logger.info(memberInfo.getMem_gender() + "로그인 서비스에서 받은 값");
		logger.info(memberInfo.getMem_bankName() + "로그인 서비스에서 받은 값");
		logger.info(memberInfo.getMem_bank() + "로그인 서비스에서 받은 값");
		logger.info(memberInfo.getMem_cor() + "로그인 서비스에서 받은 값");
		logger.info(memberInfo.getMem_uni() + "로그인 서비스에서 받은 값");
		logger.info(memberInfo.getMem_joindate() + "로그인 서비스에서 받은 값");
		logger.info(memberInfo.getMem_status() + "로그인 서비스에서 받은 값");
		logger.info(memberInfo.getMem_post() + "로그인 서비스에서 받은 값");
		logger.info(memberInfo.getMem_addr() + "로그인 서비스에서 받은 값");
		logger.info(memberInfo.getMem_detail() + "로그인 서비스에서 받은 값");
		logger.info(memberInfo.getMem_cash() + "로그인 서비스에서 받은 값");
		
		
		
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
//		if (row > 0) {
//			fileSave(idx,photos); 
//		}

		return row;

//		public void fileSave(int idx) {
//
//				String fileName = mem_cor.getOriginalFilename();
//				logger.info("upload file name : " + fileName);
//				if (!fileName.equals("")) {
//					String ext = fileName.substring(fileName.lastIndexOf("."));
//					String newFileName = System.currentTimeMillis() + ext;
//					logger.info(fileName + " -> " + newFileName);
//					try {
//						byte[] bytes = mem_cor.getBytes(); // MultipartFile 로 부터 바이너리 추출
//						Path path = Paths.get(fileName + newFileName);// 저장경로지정
//						Files.write(path, bytes);// 저장
//						memberDAO.fileWrite(fileName, newFileName, idx);
//						Thread.sleep(1);// 파일명을 위해 강제 휴식 부여
//					} catch (Exception e) {
//						e.printStackTrace();
//					}
//				}
//			
//		}
	
	
	
	
	
	
	
	
	
	}
	
}
