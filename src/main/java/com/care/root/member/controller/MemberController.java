package com.care.root.member.controller;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.care.root.common.session.MemberSessionName;
import com.care.root.member.dto.MemberDTO;
import com.care.root.member.service.MemberService;

import oracle.jdbc.proxy.annotation.Post;

@Controller
@RequestMapping("/member")
public class MemberController implements MemberSessionName{
	@Autowired MemberService ms;
	
	@RequestMapping("index")
	public String index() {
		return "member/index";
	}
	
	@GetMapping("memberview")		//회원 리스트 보는 곳
	public String memberview(Model model,HttpSession session) {
		//if(session.getAttribute(LOGIN) != null) {
			ms.memberview(model);
			return "member/memberview";
			
		//}else {
			//return "redirect:login";
		//}
	}
	
	@GetMapping("logout")
	public String logout(HttpSession session) {
		if(session.getAttribute(LOGIN) != null) {
			session.invalidate();
			//session.removeAttribute(LOGIN);
		}
		return "redirect:login";
	}
	
	@GetMapping("memberShipview")
	public String membership() {
		return "member/memberShipview";
	}
	
	@GetMapping("main")
	public String main(Model model, @CookieValue(value = "COOK",required = false) Cookie cookie) {
		      if(cookie != null) {
		         model.addAttribute("cook",cookie.getName());
		      }
		return "default/main";
	}
	
	@GetMapping("login")
	public String login() {
		return "login/Login";
	}
	
	@PostMapping("loginChk")		//login버튼을 눌렀을 때 
	public String loginChk(@RequestParam("id") String id,
							@RequestParam("pwd") String pwd,
							@RequestParam(required = false) String autoLogin,
							RedirectAttributes re) {
		System.out.println("loginch :"+ id);
		int result = ms.loginChk(id,pwd);
		if(result == 0) {
			re.addAttribute("id",id);
			re.addAttribute("autoLogin",autoLogin);
			return "redirect:successLogin";
		}
		return "redirect:login";
	}
	
	@GetMapping("successLogin")
	public String successLogin(@RequestParam String id,
								@RequestParam(required = false) String autoLogin,
								HttpSession session,
								HttpServletResponse response) {
		System.out.println("successLogin :"+ id);
		if(autoLogin != null) {
			int limitTime = 60*60*24*90;
			Cookie loginCookie = new Cookie("loginCookie",session.getId());
			loginCookie.setMaxAge(limitTime);
			loginCookie.setPath("/");
			response.addCookie(loginCookie);
			
			Calendar cal = Calendar.getInstance();
			cal.setTime(new java.util.Date());
			cal.add(Calendar.MONTH, 3);
			
			
			java.sql.Date limitDate = new java.sql.Date(cal.getTimeInMillis());
		}
		
		session.setAttribute(LOGIN, id);
		
		return "redirect:main";
	}

	
	@PostMapping("member_save")		//회원가입 버튼을 누르면 오는 곳
	public String member_save(MemberDTO dto) {
		int result = ms.memberSave(dto);
		return "redirect:login";
	}
	
	@GetMapping("info")
	public String info(@RequestParam String id, Model model) {
		ms.info(id,model);
		return "member/memberInfo";
	}
	
	@GetMapping("popup")
	public String popup() {
		return "login/popup";
	}
	
	@GetMapping("make_cook")
	public void make_cook(HttpServletResponse response) {
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = null;
		Cookie cook = new Cookie("COOK","쿠키생성");
		cook.setMaxAge(5);
		response.addCookie(cook);
		cook.setPath("/");
		
		try {
			out = response.getWriter();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		out.print("<script>window.close();</script>");
		
	}
	
	@GetMapping("memberInfo2")
	public String memberInfo2(@RequestParam String id,Model model) {
		ms.info(id,model);
		return "member/memberInfo2";
	}
	
	@PostMapping("memberinfo2_save")
	public void memberInfosave(HttpServletResponse response,MemberDTO dto) {
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = null;
		
		try {
			out = response.getWriter();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int result = ms.update(dto);
		if(result == 1) {
			out.print("<script>alert('수정 성공!');"
					+ "location.href='memberview'</script>");
		}else {
			out.print("<script>alert('수정 실패!');"
					+ "location.href='memberinfo2</script>");
		}
		
	}
	
	@GetMapping("delete")
	public void delete(HttpServletResponse response, @RequestParam String id) {
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = null;
		
		try {
			out = response.getWriter();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int result = ms.del(id);
		if(result == 1) {
			out.print("<script>alert('삭제 성공!!');"
					+ "location.href='memberview'</script>");
		}else {
			out.print("<script>alert('삭제 실패!!');"
					+ "location.href='info'</script>");
		}
		
	}
	
	
}
