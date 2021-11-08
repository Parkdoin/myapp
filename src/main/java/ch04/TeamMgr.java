package ch04;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

//JSP에서 DB연동되는 메소드를 선언하는 클래스 무조건 TeamMgr
public class TeamMgr {

	private DBConnectionMgr pool;

	public TeamMgr() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			System.err.println("DB 연결 실패");
			e.printStackTrace();
		}
	}

	// 저장
	// public void insertTeam(String name, String city, int age, String team)
	public void insertTeam(TeamBean bean) {
		// java.sql 사용
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {// pool에서 Connection 빌려옴 -> 사용 -> 반납.
			con = pool.getConnection();// 빌려옴.
			sql = "insert tblTeam(name,city,age,team)values(?,?,?,?)";
			pstmt = con.prepareStatement(sql);// 공식
			// sql문에 있는 ? 값 세팅
			pstmt.setString(1, bean.getName()); // values('홍길동',?,?,?)
			pstmt.setString(2, bean.getCity()); // values('홍길동','부산',?,?)
			pstmt.setInt(3, bean.getAge()); // values('홍길동','부산',27,?)
			pstmt.setString(4, bean.getTeam()); // values('홍길동','부산',27,'산적')
			// sql문 실행
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// Connection 반납, pstmt는 close
			pool.freeConnection(con, pstmt);
		}
	}

	// 리스트
	public Vector<TeamBean> listTeam() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<TeamBean> vlist = new Vector<TeamBean>();
		try {
			con = pool.getConnection();
			sql = "select * from tblTeam";
			pstmt = con.prepareStatement(sql);
			// ?가 없기 때문에 따로 세팅은 없다.
			// select / insert, update, delete는 executeUpdate() -> int
			rs = pstmt.executeQuery();
			while (rs.next()) {
				TeamBean bean = new TeamBean();
				/*
				 * int num = rs.getInt("num"); String name = rs.getString("name"); String city =
				 * rs.getString("city"); int age = rs.getInt("age"); String team =
				 * rs.getString("team");
				 */
				bean.setNum(rs.getInt("num"));
				bean.setName(rs.getString("name"));
				bean.setCity(rs.getString("city"));
				bean.setAge(rs.getInt("age"));
				bean.setTeam(rs.getString("team"));
				vlist.addElement(bean);
			}
		} catch (Exception e) {
			// 예외가 생긴 모든 경로 추적하여 출력되는 기능
			e.printStackTrace();
		} finally {
			// con은 반납, pstmt, rs는 사용후에 close
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}

	// 회원한명 정보 가져오기
	public TeamBean getTeam(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		TeamBean bean = new TeamBean();
		try {
			con = pool.getConnection();
			sql = "select * from tblTeam where num=?";// num=3
			pstmt = con.prepareStatement(sql);
			// sql문에 첫번째 ?에 매개변수로 받아온 num값을 세팅
			pstmt.setInt(1, num);
			// sql문 실행
			rs = pstmt.executeQuery();
			if (rs.next()) {
				bean.setNum(rs.getInt(1));// 가져온 data 컬럼 순서 번호
				bean.setName(rs.getString(2));
				bean.setCity(rs.getString(3));
				bean.setAge(rs.getInt(4));
				bean.setTeam(rs.getString(5));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return bean;
	}

	// 수정
	public boolean updateTeam(TeamBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "update tblTeam set name=?, city=?, age=?, team=? where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getName()); 
			pstmt.setString(2, bean.getCity());
			pstmt.setInt(3, bean.getAge()); 
			pstmt.setString(4, bean.getTeam()); 
			pstmt.setInt(5, bean.getNum());
			int cnt =pstmt.executeUpdate();
			if(cnt==1) flag = true;//정상적인 수정완료
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}

	// 삭제 
	//슈퍼 울트라 단축키 : ctrl+space
	public void deleteTeam(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "delete from tblTeam where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}

	public static void main(String[] args) {
		TeamMgr mgr = new TeamMgr();
	}
}






