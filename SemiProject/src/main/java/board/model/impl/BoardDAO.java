package board.model.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import board.model.BoardVO;
import common.JDBCUtil;

// DAO : Data Access Object -> CRUD SQL문 코딩
public class BoardDAO {
	private Connection conn = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;
	
	private final String BOARD_INSERT = "insert into board(seq, title, writer, content) values((select nvl(max(seq), 0) + 1 from board),?, ?, ?)";
	private final String BOARD_UPDATE = "update board set title = ?, content = ? where seq=?";
	private final String BOARD_DELETE = "delete from board where seq = ?";
	private final String BOARD_GET = "select * from board where seq = ?";
	private final String BOARD_LIST = "select * from board order by seq desc";
	private final String BOARD_LIST_TITLE = "select * from board where title like '%' || ? || '%' order by seq desc";
	private final String BOARD_LIST_CONTENT = "select * from board where content like '%' || ? || '%' order by seq desc";
	private final String BOARD_UPDATE_CNT = "update board set cnt = ? where seq = ?";
	
	public void insertBoard(BoardVO vo) {
		System.out.println("---> JDBC insertBoard() Start");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(BOARD_INSERT);
			stmt.setString(1, vo.getTitle());
			stmt.setString(2, vo.getwriter());
			stmt.setString(3, vo.getContent());
			stmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("insertBoard() Error");
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}
	
	public void updateBoard(BoardVO vo) {
		System.out.println("---> JDBC updatetBoard() Start");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(BOARD_UPDATE);
			stmt.setString(1, vo.getTitle());
			stmt.setString(2, vo.getContent());
			stmt.setInt(3, vo.getSeq());
			stmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("updateBoard() Error");
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}
	
	public void deleteBoard(BoardVO vo) {
		System.out.println("---> JDBC deleteBoard() Start");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(BOARD_DELETE);
			stmt.setInt(1, vo.getSeq());
			stmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("deleteBoard() Error");
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}
	
	public BoardVO getBoardVO(BoardVO vo) {
		BoardVO board = null;
		System.out.println("---> JDBC getBoard() Start");
		
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(BOARD_GET);
			stmt.setInt(1, vo.getSeq());	
			rs = stmt.executeQuery();
			if(rs.next()) {
				board = new BoardVO();
				board.setSeq(rs.getInt("SEQ"));
				board.setTitle(rs.getString("TITLE"));
				board.setwriter(rs.getString("WRITER"));
				board.setContent(rs.getString("CONTENT"));
				board.setRegDate(rs.getDate("REGDATE"));
				board.setCnt(rs.getInt("CNT"));

				stmt = conn.prepareStatement(BOARD_UPDATE_CNT);
				stmt.setInt(1, rs.getInt("CNT") + 1);
				stmt.setInt(2, vo.getSeq());
				stmt.executeUpdate();
				
			}
			
		} catch (SQLException e) {
			System.out.println("getBoard() Error");
		} finally {
			JDBCUtil.close(rs,stmt,conn);
		}

		return board;
	}
	
	public List<BoardVO> getBoardList(BoardVO vo) {
		List<BoardVO> boardList = new ArrayList<BoardVO>();
		
		System.out.println("---> JDBC getBoardList() Start");
		
		try {
			conn = JDBCUtil.getConnection();
			
			if(vo.getSearchCondition() == null) {
				stmt = conn.prepareStatement(BOARD_LIST);
				
			} else {
				if(vo.getSearchCondition().equals("TITLE")) {
					stmt = conn.prepareStatement(BOARD_LIST_TITLE);
					
				}  else if(vo.getSearchCondition().equals("CONTENT")) {
					stmt = conn.prepareStatement(BOARD_LIST_CONTENT);
				}
				stmt.setString(1, vo.getSearchKeyword());
			}
			
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				BoardVO board = new BoardVO();
				
				board.setSeq(rs.getInt("SEQ"));
				board.setTitle(rs.getString("TITLE"));
				board.setwriter(rs.getString("WRITER"));
				board.setContent(rs.getString("CONTENT"));
				board.setRegDate(rs.getDate("REGDATE"));
				board.setCnt(rs.getInt("CNT"));
				
				boardList.add(board);
			}
			
		} catch (SQLException e) {
			System.out.println("getBoardList() Error");
		} finally {
			JDBCUtil.close(rs,stmt, conn);
		}

		return boardList;
	}
}
