package com.care.root.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.care.root.member.dto.MemberDTO;
import com.care.root.member.service.MemberService;

@Controller
public class MemberController {
	@Autowired MemberService ms;
	
	@RequestMapping("index")
	public String index() {
		return "member/index";
	}
	
	@GetMapping("memberview")		//회원 리스트 보는 곳
	public String memberview(Model model,HttpSession session) {
		if(session.getAttribute("LOGIN") != null) {
			ms.memberview(model);
			return "member/memberview";
			
		}else {
			return "redirect:login";
		}
	}
	
	@GetMapping("logout")
	public String logout(HttpSession session) {
		if(session.getAttribute("LOGIN") != null) {
			session.invalidate();
		}
		return "redirect:login";
	}
	
	@GetMapping("memberShipview")
	public String membership() {
		return "member/memberShipview";
	}
	
	@GetMapping("main")
	public String main() {
		return "default/main";
	}
	
	@GetMapping("login")
	public String login() {
		return "login/Login";
	}
	
	@PostMapping("loginChk")		//login버튼을 눌렀을 때 
	public String loginChk(HttpServletRequest request,RedirectAttributes re) {
		int result = ms.loginChk(request);
		if(result == 0) {
			re.addAttribute("id",request.getParameter("id"));
			return "redirect:successLogin";
		}
		return "redirect:login";
	}
	
	@RequestMapping("successLogin")
	public String successLogin(@RequestParam("id") String id, HttpSession session) {
		session.setAttribute("LOGIN",id);
		return "redirect:main";
	}
	
	@PostMapping("member_save")
	public String member_save(MemberDTO dto) {
		ms.memberSave(dto);
		return "redirect:login";
	}
	
	@GetMapping("info")
	public String info(@RequestParam String id, Model model) {
		ms.info(id,model);
		return "member/memberInfo";
	}
	
}
