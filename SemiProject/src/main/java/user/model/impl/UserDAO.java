package user.model.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import common.JDBCUtil;
import user.model.UserVO;

public class UserDAO {
	private Connection conn = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;
	
	private final String USER_GET = "select * from users where id = ? and password = ?";
	private final String USER_GETID = "select * from users where id = ?";
	private final String USER_INSERT = "insert into USERS (id, password, name, email, tel, role) values(?,?,?,?,?,?) ";
	private final String USER_UPDATE = "update USERS set password = ?, email = ?, tel =?, role = ? where id=?";
	
	public String existUserId(UserVO vo) {
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(USER_GETID);
			stmt.setString(1, vo.getId());
			
			rs = stmt.executeQuery();
			
			if (rs.next()) {
				return rs.getString("id");
			}
			
		} catch (SQLException e) {
			System.out.println("existUserId error");
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		return null;
	}

	public UserVO getUser(UserVO vo) {
		UserVO user = null;
		
		System.out.println("---> JDBC getUser() start");
		
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(USER_GET);
			stmt.setString(1, vo.getId());
			stmt.setString(2, vo.getPassword());
			
			rs = stmt.executeQuery();
			
			if (rs.next()) {
				user = new UserVO();
				user.setId(rs.getString("ID"));
				user.setPassword(rs.getString("PASSWORD"));
				user.setName(rs.getString("NAME"));
				user.setRole(rs.getString("ROLE"));
				user.setTel(rs.getString("tel"));
				user.setEmail(rs.getString("email"));
			}
			
		} catch (SQLException e) {
			System.out.println("getUser error");
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
			
		return user;
	}
	
	public void insertUser(UserVO vo) {
		System.out.println("---> JDBC insertUser Start");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(USER_INSERT);
			stmt.setString(1, vo.getId());
			stmt.setString(2, vo.getPassword());
			stmt.setString(3, vo.getName());
			stmt.setString(4, vo.getEmail());
			stmt.setString(5, vo.getTel());
			stmt.setString(6, vo.getRole());
			stmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("insertUser Error");
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}
	
	public void updateUser(UserVO vo) {
		System.out.println("---> JDBC updateUser Start");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(USER_UPDATE);
			stmt.setString(1, vo.getPassword());
			stmt.setString(2, vo.getEmail());
			stmt.setString(3, vo.getTel());
			stmt.setString(4, vo.getRole());
			stmt.setString(5, vo.getId());
			stmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("updateUser Error");
		}finally {
			JDBCUtil.close(stmt, conn);
		}
		
	}
}

