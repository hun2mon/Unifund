package com.uni.fund.project.service;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.uni.fund.project.dao.ProjectDAO;
import com.uni.fund.project.dto.ProjectDTO;

@Service
public class ProjectService {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired ProjectDAO projectDAO;
	
	public String file_root = "/Users/hsg/upload/Unifund/";
	
	public ProjectDTO detail() {
		return projectDAO.detail();
	}
	
	public int projectCreate(MultipartFile pro_main_photo, MultipartFile pro_photo, Map<String, String> param,
			int mem_idx) {
		logger.info(":::projectCreate Service IN:::");
		int row = -1;
		
		SimpleDateFormat parseDate = new SimpleDateFormat("yyyy-MM-dd");
		ProjectDTO projectDTO = new ProjectDTO();
		projectDTO.setMem_idx(mem_idx);
		projectDTO.setPro_title(param.get("pro_title"));
		projectDTO.setPro_content(param.get("pro_content"));
		projectDTO.setCate_idx(Integer.parseInt(param.get("cate_idx")));
		projectDTO.setPro_phone(param.get("pro_phone"));
		projectDTO.setRew_name(param.get("rew_name"));
		projectDTO.setRew_max(Integer.parseInt(param.get("rew_max")));
		projectDTO.setOri_price(Integer.parseInt(param.get("ori_price")));
		projectDTO.setRew_price(Integer.parseInt(param.get("rew_price")));
		try {
			Date deadLineDate = parseDate.parse(param.get("pro_deadline"));
			projectDTO.setPro_deadline(new java.sql.Date(deadLineDate.getTime()));

			Date startDate = parseDate.parse(param.get("pro_startdate"));
			projectDTO.setPro_startdate(new java.sql.Date(startDate.getTime()));

			// projectDTO.setPro_deadline((Date)parseDate.parse(param.get("pro_deadline")));
			// projectDTO.setPro_startdate((Date)parseDate.parse(param.get("pro_startdate")));
		} catch (ParseException e) {
			logger.info(":::projectCreate Service Date Exception:::");
			e.printStackTrace();
		}
		projectDTO.setPro_tos(param.get("pro_tos"));

		row = projectDAO.projectCreate(projectDTO);

		if (row > 0) {
			int pro_idx = projectDTO.getPro_idx();
			String projectMainPhotoDiv = "프로젝트대표사진";
			String projectPhotoDiv = "프로젝트";
			projectMainFileSave(pro_idx, pro_main_photo, projectMainPhotoDiv);
			projectFileSave(pro_idx, pro_photo, projectPhotoDiv);
		}

		return row;
	}

	private void projectMainFileSave(int pro_idx, MultipartFile pro_main_photo, String projectMainPhotoDiv) {
		if (pro_main_photo != null) {
			String oriName = pro_main_photo.getOriginalFilename();
			String projectMainPhoto = oriName.substring(oriName.lastIndexOf("."));
			String newProjectMainFileName = System.currentTimeMillis() + projectMainPhoto;

			Path ProjectMainPath = Paths.get(file_root + newProjectMainFileName);

			try {
				byte[] mainPhotoBytes = pro_main_photo.getBytes();
				Files.write(ProjectMainPath, mainPhotoBytes);
				projectDAO.createMainPhoto(pro_idx, newProjectMainFileName, projectMainPhotoDiv);
				Thread.sleep(1);
			} catch (Exception e) {
				logger.info(":::projectMainFileSave Service FILE Exception:::");
				e.printStackTrace();
			}

		}

	}

	private void projectFileSave(int pro_idx, MultipartFile pro_photo, String projectPhotoDiv) {
		if (pro_photo != null) {
			String oriName = pro_photo.getOriginalFilename();
			String projectPhoto = oriName.substring(oriName.lastIndexOf("."));
			String newProjectFileName = System.currentTimeMillis() + projectPhoto;

			Path ProjectPath = Paths.get(file_root + newProjectFileName);

			try {
				byte[] photoBytes = pro_photo.getBytes();
				Files.write(ProjectPath, photoBytes);
				projectDAO.createPhoto(pro_idx, newProjectFileName, projectPhotoDiv);
				Thread.sleep(1);
			} catch (Exception e) {
				logger.info(":::projectFileSave Service FILE Exception:::");
				e.printStackTrace();
			}

		}

	}
	
	public void updateForm(String pro_idx, Model model) {
		ProjectDTO projectdto = projectDAO.updateForm(pro_idx);
		model.addAttribute("project",projectdto);
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String proDeadline = dateFormat.format(projectdto.getPro_deadline());
		String proStartDate = dateFormat.format(projectdto.getPro_startdate());
		model.addAttribute("proDeadline",proDeadline);
		model.addAttribute("proStartDate",proStartDate);
	}
	
	public int projectUpdate(MultipartFile pro_main_photo, MultipartFile pro_photo, Map<String, String> param) {
		int row = -1;

		row = projectDAO.projectUpdate(param);
		
		if(row > 0) {
			int pro_idx = Integer.parseInt(param.get("pro_idx"));
			projectMainFileSave(pro_idx,pro_main_photo,"프로젝트대표사진");
			projectFileSave(pro_idx,pro_photo,"프로젝트");
		}
		
		return row;
	}
	
	public void funding(Map<String, String> map) {
		int cnt = projectDAO.funding(map);
		projectDAO.moneyMng(map);
		logger.info("성공여부 : {}",cnt);
	}

	public void fundingCancle(Map<String, String> map) {
		projectDAO.moneyRefund(map);
		int cnt = projectDAO.fundingCancle(map);
		logger.info("성공여부 : {}", cnt);
	}

}
