package com.care.root.board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartFile;

public interface BoardFileService {
	public static final String IMAGE_REPO = "C:/img_repo";  //파일을저장한 위치
	public String getMessage(HttpServletRequest request,
							String msg, String url);
	
	public String saveFile(MultipartFile file);
	public void deleteImage(String originFileName);
}
