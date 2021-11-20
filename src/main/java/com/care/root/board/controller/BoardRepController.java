package com.care.root.board.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.care.root.board.dto.BoardRepDTO;
import com.care.root.board.service.BoardService;
import com.care.root.common.session.MemberSessionName;
@RestController
@RequestMapping("/board")
public class BoardRepController implements MemberSessionName{
	@Autowired BoardService bs;
	  @PostMapping(value="addReply", produces = "application/json; charset=utf-8")
	    public String addReply(@RequestBody Map<String, Object> map, HttpSession session){

	   BoardRepDTO dto = new BoardRepDTO();
	   dto.setId( (String)session.getAttribute(LOGIN));
	   dto.setWrite_group( Integer.parseInt((String)map.get("write_no")) );  //원글에 대한 번호로 저장을 해준다.
	   dto.setTitle((String)map.get("title"));
	   dto.setContent((String)map.get("content"));

	   bs.addReply(dto);
	   return "{\"result\" : true}";  //json형태로 보냈기 때문에 키와 key와 value값으로 리턴타입을 정한것이다.
	    }
	  
	  @GetMapping(value="replyData/{write_group}", 
	            produces="application/json;charset=utf-8")
	public List<BoardRepDTO> replyData(@PathVariable int write_group) {
	   return bs.getRepList(write_group);
	}
	
}	