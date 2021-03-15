package com.spring.bom.dao.god;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.bom.model.god.Board;

@Repository
public class BoardDaoImpl implements BoardDao {
	@Autowired
	private SqlSession session;
	
	@Override
	//일반 글 삽입
	public int insertBoard(Board board) {
		int result=0;
		try {
			System.out.println("board.getBsaveorrsvd() -> "+board.getBsaveorrsvd());
			//저장글이면
			if(board.getBsaveorrsvd()==0) {
				System.out.println("저장 글 등록");
				result=session.insert("JHinsertSaveBoard", board); //저장글이면 bregdate=null, bsaveorrsvd=0
			}
			//예약글이면
			else if(board.getBsaveorrsvd()==1) {
				System.out.println("예약 글 등록");
				//예약글을 등록할경우
				if(!board.getSavebcode().equals("")) {
					result=session.update("JHinsertSaveRsvdBoard1", board);
				}
				else
					result=session.insert("JHinsertRsvdBoard", board); //예약글이면 bregdate 있고, bsaveorrsvd=1
			}
			//일반글이면
			else {	
				System.out.println("board.getsavebcode() -> "+board.getSavebcode());
				//저장글 등록할경우
				if(!board.getSavebcode().equals("")) {
					System.out.println("저장,예약글을 일반글로 등록");
					result=session.update("JHinsertSaveRsvdBoard2", board);
				}
				else {
					System.out.println("일반글 등록");
					result=session.insert("JHinsertBoard", board); //일반글이면 bregdate 있고, bsaveorrsvd=null
				}
			}
		} catch (Exception e) {
			System.out.println("GOD BoardDaoImpl insertBoard -> "+e.getMessage());
		}
		return result;
	}

	@Override
	//투표있는 글 삽입
	public int insertVoteBoard(Board board) {
		int result=0;
		try {
			//저장글이면
			if(board.getBsaveorrsvd()==0)
				result=session.insert("JHinsertSaveVoteBoard", board); //저장글이면 bregdate=null, bsaveorrsvd=0
			//예약글이면
			else if(board.getBsaveorrsvd()==1)
				result=session.insert("JHinsertRsvdVoteBoard", board); //예약글이면 bregdate 있고, bsaveorrsvd=1
			//일반글이면
			else {
				//저장글 or 예약글을 등록할경우
				if(board.getSavebcode()!=null) {
					result=session.update("JHinsertSaveRsvdVoteBoard", board);
				}
				else
					result=session.insert("JHinsertVoteBoard", board); //일반글이면 bregdate 있고, bsaveorrsvd=null
			}
		} catch (Exception e) {
			System.out.println("GOD BoardDaoImpl insertVoteBoard -> "+e.getMessage());
		}
		return result;
	}

	@Override
	public Board getBoard(int bcode) {
		Board board=new Board();
		try {
			board=session.selectOne("JHgetBoard", bcode);
		} catch (Exception e) {
			System.out.println("GOD BoardDaoImpl getBoard -> "+e.getMessage());
		}
		return board;
	}

}
