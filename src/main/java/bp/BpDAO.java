package bp;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BpDAO {
	private Connection conn;
	private ResultSet rs;

	public BpDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/BBS?serverTimezone=UTC";
			String dbID = "root";
			String dbPassword = "123456";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public String getDate() {
		String SQL = "SELECT NOW()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ""; // 데이터 베이스 오류
	}

	public int getNext() {
		String SQL = "SELECT bpID FROM BP ORDER BY bpID DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터 베이스 오류
	}

	public int bp_write(String bpTitle, String userID, String bpContent) {
		String SQL = "INSERT INTO BBS VALUES(?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, bpTitle);
			pstmt.setString(3, userID);
			pstmt.setString(4, getDate());
			pstmt.setString(5, bpContent);
			pstmt.setInt(6, 1);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터 베이스 오류
	}
	
	public ArrayList<Bp> getList(int pageNumber){
		String SQL = "SELECT * FROM BBS WHERE bpID < ? AND bpAvailable = 1 ORDER BY bpID DESC LIMIT 10";
		ArrayList<Bp> list = new ArrayList<Bp>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Bp bbs = new Bp();
				bbs.setBpID(rs.getInt(1));
				bbs.setBpTitle(rs.getString(2));
				bbs.setUserID(rs.getString(3));
				bbs.setBpDate(rs.getString(4));
				bbs.setBpContent(rs.getString(5));
				bbs.setBpAvailable(rs.getInt(6));
				list.add(bbs);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public boolean nextPage(int pageNumber) {
		String SQL = "SELECT * FROM Bp WHERE bpID < ? AND bpAvailable = 1 ORDER BY bpID DESC LIMIT 10";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public Bp getBp(int bpID){
		String SQL = "SELECT * FROM BP WHERE bpID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bpID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				Bp bp = new Bp();
				bp.setBpID(rs.getInt(1));
				bp.setBpTitle(rs.getString(2));
				bp.setUserID(rs.getString(3));
				bp.setBpDate(rs.getString(4));
				bp.setBpContent(rs.getString(5));
				bp.setBpAvailable(rs.getInt(6));
				return bp;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public int update(int bpID, String bpTItle, String bpContent) {
		String SQL = "UPDATE BBS SET bpTitle=?, bpContent=? WHERE bpID=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, bpTItle);
			pstmt.setString(2, bpContent);
			pstmt.setInt(3, bpID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터 베이스 오류
	}
	
	public int delete(int bpID) {
		String SQL = "UPDATE BP SET bbsAvailable = 0 WHERE bpID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bpID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터 베이스 오류
	}
	
}