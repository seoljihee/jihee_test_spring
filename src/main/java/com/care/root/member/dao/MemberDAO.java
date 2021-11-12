package com.care.root.member.dao;

import java.util.ArrayList;

import com.care.root.member.dto.MemberDTO;

public interface MemberDAO {
	public void memberSave(MemberDTO dto);
	public ArrayList<MemberDTO> memberview();
	public MemberDTO getMember(String id);
	public int update(MemberDTO dto);
	public int del(String id);
	
}
