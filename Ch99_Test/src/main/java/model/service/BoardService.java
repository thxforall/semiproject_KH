package model.service;

import java.sql.Connection;

import model.vo.Board;

public class BoardService {
	
	public int updateBoard(Board board) {
		Connection conn = getConnection();
		int result = new BoardDAO().updateBoard(conn, board);

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);

		return result;
	}

}
