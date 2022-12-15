package user.model.impl;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import common.JDBCUtil;
import user.model.UserVO;

public class UserDAO {
	private Connection conn = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;
	
	private final String USER_GET = "select * from users where username = ? and password = ?";
	private final String USER_GETUSERNAME = "select * from users where username = ?";
	private final String USER_INSERT = "insert into USERS (username, password, name, mobilephone, gender, birthdate) values(?,?,?,?,?,?)";
	private final String USER_UPDATE = "update USERS set password = ?, mobilephone = ?, gender = ? where username=?";
	
	public String existUsername(UserVO vo) {
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(USER_GETUSERNAME);
			stmt.setString(1, vo.getUsername());
			
			rs = stmt.executeQuery();
			
			if (rs.next()) {
				return rs.getString("username");
			}
			
		} catch (SQLException e) {
			System.out.println("existUserusername error");
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
			stmt.setString(1, vo.getUsername());
			stmt.setString(2, vo.getPassword());
			
			rs = stmt.executeQuery();
			
			if (rs.next()) {
				user = new UserVO();
				user.setUsername(rs.getString("username"));
				user.setPassword(rs.getString("PASSWORD"));
				user.setName(rs.getString("NAME"));
				user.setGender(rs.getString("gender"));
				user.setMobilePhone(rs.getString("mobilephone"));
				user.setBirthDate(rs.getString("birtdate"));
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
			stmt.setString(1, vo.getUsername());
			stmt.setString(2, vo.getPassword());
			stmt.setString(3, vo.getName());
			stmt.setString(4, vo.getMobilePhone());
			stmt.setString(5, vo.getGender());
			stmt.setString(6, vo.getBirthDate());
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
			stmt.setString(2, vo.getMobilePhone());
			stmt.setString(3, vo.getGender());
			stmt.setString(4, vo.getUsername());
			stmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("updateUser Error");
		}finally {
			JDBCUtil.close(stmt, conn);
		}
		
	}
}

