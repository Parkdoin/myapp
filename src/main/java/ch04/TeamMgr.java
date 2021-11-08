package ch04;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

//JSP���� DB�����Ǵ� �޼ҵ带 �����ϴ� Ŭ���� ������ TeamMgr
public class TeamMgr {

	private DBConnectionMgr pool;

	public TeamMgr() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			System.err.println("DB ���� ����");
			e.printStackTrace();
		}
	}

	// ����
	// public void insertTeam(String name, String city, int age, String team)
	public void insertTeam(TeamBean bean) {
		// java.sql ���
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {// pool���� Connection ������ -> ��� -> �ݳ�.
			con = pool.getConnection();// ������.
			sql = "insert tblTeam(name,city,age,team)values(?,?,?,?)";
			pstmt = con.prepareStatement(sql);// ����
			// sql���� �ִ� ? �� ����
			pstmt.setString(1, bean.getName()); // values('ȫ�浿',?,?,?)
			pstmt.setString(2, bean.getCity()); // values('ȫ�浿','�λ�',?,?)
			pstmt.setInt(3, bean.getAge()); // values('ȫ�浿','�λ�',27,?)
			pstmt.setString(4, bean.getTeam()); // values('ȫ�浿','�λ�',27,'����')
			// sql�� ����
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// Connection �ݳ�, pstmt�� close
			pool.freeConnection(con, pstmt);
		}
	}

	// ����Ʈ
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
			// ?�� ���� ������ ���� ������ ����.
			// select / insert, update, delete�� executeUpdate() -> int
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
			// ���ܰ� ���� ��� ��� �����Ͽ� ��µǴ� ���
			e.printStackTrace();
		} finally {
			// con�� �ݳ�, pstmt, rs�� ����Ŀ� close
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}

	// ȸ���Ѹ� ���� ��������
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
			// sql���� ù��° ?�� �Ű������� �޾ƿ� num���� ����
			pstmt.setInt(1, num);
			// sql�� ����
			rs = pstmt.executeQuery();
			if (rs.next()) {
				bean.setNum(rs.getInt(1));// ������ data �÷� ���� ��ȣ
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

	// ����
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
			if(cnt==1) flag = true;//�������� �����Ϸ�
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}

	// ���� 
	//���� ��Ʈ�� ����Ű : ctrl+space
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






