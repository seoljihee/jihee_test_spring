package com.care.root.member.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;


import com.care.root.member.dao.MemberDAO;
import com.care.root.member.dto.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService{
	@Autowired MemberDAO mapper;

	@Override
	public void memberSave(MemberDTO dto) {
		mapper.memberSave(dto);
		
	}

	@Override
	public void memberview(Model model) {
		ArrayList<MemberDTO> list = mapper.memberview();
		model.addAttribute("list",list);
	}

	@Override
	public void info(String id, Model model) {
		model.addAttribute("memberinfo",mapper.getMember(id));
		
	}

	@Override
	public int loginChk(HttpServletRequest request) {
		MemberDTO dto = mapper.getMember(request.getParameter("id"));
		if(dto != null) {
			if(request.getParameter("pwd").equals(dto.getPwd())) {
				return 0;
			}else {
				return -1;
			}
		}
		return 1;
		
	}

	@Override
	public int update(MemberDTO dto) {
		int result = mapper.update(dto);
		return result;
	}

	@Override
	public int del(String id) {
		int result = mapper.del(id);
		return result;
	}

	

	
	
}
