package com.care.root.member.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;


import com.care.root.member.dao.MemberDAO;
import com.care.root.member.dto.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService{
	@Autowired MemberDAO mapper;
	BCryptPasswordEncoder encoder;
	
	public MemberServiceImpl() {
		encoder = new BCryptPasswordEncoder();
	}

	@Override
	public int memberSave(MemberDTO dto) {
		System.out.println("변경 전 : " + dto.getPwd());
		String securePwd = encoder.encode(dto.getPwd());
		System.out.println("변경 후 : " + securePwd);
		dto.setPwd(securePwd);
		int result = 0;
		try {
			result = mapper.memberSave(dto);			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
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

	//예전 로그인 체크
//	@Override
//	public int loginChk(HttpServletRequest request) {
//		MemberDTO dto = mapper.getMember(request.getParameter("id"));
//		if(dto != null) {
//			if(request.getParameter("pwd").equals(dto.getPwd())) {
//				return 0;
//			}else {
//				return -1;
//			}
//		}
//		return 1;
//		
//	}
	
	//비밀번호 암호화를 위한 로그인 체크
	//encoder에 있는 matches를 이용하여 암호화 된 비밀번호와 사용자가 입력한 비밀번호를 비교해준다.
	//encoder.matches('사용자가 입력한 pwd','dto에 저장 된 암호화 된 비밀번호') 순서 잘 알기.
	@Override
	public int loginChk(String id,String pwd) {
		MemberDTO dto = mapper.getMember(id);
		if(dto != null) {
			if(encoder.matches(pwd,dto.getPwd())) {
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

	@Override
	public MemberDTO getUserSessionId(String sessionId) {
		return mapper.getUserSessionId(sessionId);
	}

	

	
	
}
