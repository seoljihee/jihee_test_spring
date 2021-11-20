package com.care.root.member.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.care.root.board.dto.BoardDTO;
import com.care.root.board.dto.BoardRepDTO;

public interface BoardMapper {
	public List<BoardDTO> boardAllList(@Param("s")int start,@Param("e") int end);  //두개의 값이 넘어갈때는 @Param을 꼭 넣어줘야 xml에서 에러가 나지 않는다.	
	public int writeSave(BoardDTO dto);
	public BoardDTO contentView(int writeNo);
	public void upHit(int writeNo);
	public int modify(BoardDTO dto);
	public int  delete(int writeNo);
	public void addReply(BoardRepDTO dto);
	public List<BoardRepDTO> getRepList(int write_group);
	public int selectBoardCount();
}
