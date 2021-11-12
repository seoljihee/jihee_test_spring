package com.care.root.member.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.care.root.member.dto.MemberDTO;

public interface MemberService {
	public void memberSave(MemberDTO dto);
	public void memberview(Model model);
	public void info(String id,Model model);
	public int loginChk(HttpServletRequest request);
	public int update(MemberDTO dto);
	public int del(String id);
}
