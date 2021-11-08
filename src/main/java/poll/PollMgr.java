package poll;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

public class PollMgr {
	
	private DBConnectionMgr pool;
	
	public PollMgr() {
		pool = DBConnectionMgr.getInstance();
	}
	
	//Max Num : 현재 num의 Max
	public int getMaxNum() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int maxNum = 0;
		try {
			con = pool.getConnection();
			sql = "select max(num) from tblPollList";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) maxNum = rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return maxNum;
	}
	
	//Poll Insert
	public boolean insertPoll(PollListBean plBean, PollItemBean piBean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "insert tblPollList(question,sdate,edate,wdate,type)"
					+ "values(?,?,?,now(),?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, plBean.getQuestion());
			pstmt.setString(2, plBean.getSdate());
			pstmt.setString(3, plBean.getEdate());
			pstmt.setInt(4, plBean.getType());
			int cnt = pstmt.executeUpdate();
			pstmt.close();
			//아이템 저장
			if(cnt==1) {
				sql = "insert tblPollItem values (?,?,?,0)";
				pstmt = con.prepareStatement(sql);
				int listNum = getMaxNum();//방금 저장한 설문리스트의 num값
				String item[] = piBean.getItem();
				for (int i = 0; i < item.length; i++) {
					if(item[i]==null||item[i].trim().equals(""))
						break;
					pstmt.setInt(1, listNum);
					pstmt.setInt(2, i);//(5,0)(5,1)(5,2)(5,3)
					pstmt.setString(3, item[i]);
					if(pstmt.executeUpdate()==1)
						flag = true;
				}//---for
			}//--if
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	
	//Poll List
	public Vector<PollListBean> getPollList(){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<PollListBean> vlist = new Vector<PollListBean>();
		try {
			con = pool.getConnection();
			sql = "select * from tblPollList order by num desc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				PollListBean plBean = new PollListBean();
				plBean.setNum(rs.getInt("num"));
				plBean.setQuestion(rs.getString("question"));
				//모든 db에 타입은 String으로 리턴 가능(int 가능)
				plBean.setSdate(rs.getString("sdate"));//DB에 type date이지만 String 가능
				plBean.setEdate(rs.getString("edate"));
				vlist.addElement(plBean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist ;
	}
	
	//Poll Read : 설문 한개 가져오기
	public PollListBean getPoll(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		PollListBean plBean = new PollListBean();
		try {
			con = pool.getConnection();
			sql = "select num, question, type, active from tblPollList where num=?";
			pstmt = con.prepareStatement(sql);
			if(num==0)
				num = getMaxNum();//num값이 넘어오지 않을때는 jsp에서 0으로 세팅. 가장 최신의 설문
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				plBean.setNum(rs.getInt("num"));
				plBean.setQuestion(rs.getString("question"));
				plBean.setType(rs.getInt("type"));
				plBean.setActive(rs.getInt("active"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return plBean;
	}
	
	//Poll Item List
	public Vector<String> getItemList(int listNum){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<String> vlist = new Vector<String>();
		try {
			con = pool.getConnection();
			sql = "select item from tblPollItem where listNum=?";
			pstmt = con.prepareStatement(sql);
			if(listNum==0)
				listNum = getMaxNum();
			pstmt.setInt(1, listNum);
			rs = pstmt.executeQuery();
			while(rs.next())
				vlist.addElement(rs.getString(1));
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
	//Sum Count : 총투표수
	public int sumCount(int listNum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int sum = 0;
		try {
			con = pool.getConnection();
			sql = "select sum(count) from tblPollItem where listNum=?";
			pstmt = con.prepareStatement(sql);
			if(listNum==0)
				listNum = getMaxNum();
			pstmt.setInt(1, listNum);
			rs = pstmt.executeQuery();
			if(rs.next()) sum = rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return sum;
	}
	
	//Poll Update : 투표실행
	public boolean updatePoll(int listNum, String itemNum[]) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "update tblPollItem set count=count+1 "
					+ "where listNum=? and itemNum=?";
			pstmt = con.prepareStatement(sql);
			if(listNum==0)
				listNum = getMaxNum();
			for (int i = 0; i < itemNum.length; i++) {
				pstmt.setInt(1, listNum);
				pstmt.setInt(2, Integer.parseInt(itemNum[i]));
				if(pstmt.executeUpdate()==1) flag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	
	//Poll View : 투표결과
	public Vector<PollItemBean> getView(int listNum){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<PollItemBean> vlist = new Vector<PollItemBean>();
		try {
			con = pool.getConnection();
			sql = "select item, count from tblPollItem where listNum=?";
			pstmt = con.prepareStatement(sql);
			if(listNum==0)
				listNum = getMaxNum();
			pstmt.setInt(1, listNum);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				PollItemBean piBean = new PollItemBean();
				/*String item[] = new String[1];
				item[0] = rs.getString(1);
				piBean.setItem(item);*/
				piBean.setItem1(rs.getString(1));
				piBean.setCount(rs.getInt(2));
				vlist.addElement(piBean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}

	//Max Item Count : 아이템 중에 가장 높은값
	public int getMaxCount(int listNum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int maxCnt = 0;
		try {
			con = pool.getConnection();
			sql = "select max(count) from tblPollItem where listNum=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, listNum==0?getMaxNum():listNum);
			rs = pstmt.executeQuery();
			if(rs.next()) maxCnt = rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return maxCnt;
	}
}









