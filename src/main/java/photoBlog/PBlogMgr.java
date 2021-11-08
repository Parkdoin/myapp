package photoBlog;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class PBlogMgr {

	private DBConnectionMgr pool;
	private static final String  SAVEFOLDER = 
	"C:/Jsp/eclipse-workspace/myapp/src/main/webapp/photoBlog/photo/";
	private static final String ENCTYPE = "EUC-KR";
	private static int MAXSIZE = 5*1024*1024;
	
	public PBlogMgr() {
		pool = DBConnectionMgr.getInstance();
	}
	
	//PMember Login : 로그인
	public boolean loginPMember(String id, String pwd) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "select id from tblPMember where id=? and pwd=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery();
			flag = rs.next();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return flag;
	}
	
	//PMember Get : 회원 정보 리턴
	public PMemberBean getPMember(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		PMemberBean bean = new PMemberBean();
		try {
			con = pool.getConnection();
			sql = "select name, profile from tblPMember where id=? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bean.setId(id);
				bean.setName(rs.getString(1));
				bean.setProfile(rs.getString(2));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return bean;
	}
	
	//PMember Random : 본인을 제외하고 5명의 랜덤한 리스트
	public Vector<PMemberBean> listPMember(String id){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<PMemberBean> vlist = new Vector<PMemberBean>();
		try {
			con = pool.getConnection();
			sql = "select id, name, profile from tblPMember where id!=? "
					+ "order by rand() limit 5";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				PMemberBean bean = new PMemberBean();
				bean.setId(rs.getString(1));
				bean.setName(rs.getString(2));
				bean.setProfile(rs.getString(3));
				vlist.addElement(bean);
			}	
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
	//PBlog List : 본인의 리스트
	public Vector<PBlogBean> listPBlog(String id){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<PBlogBean> vlist = new Vector<PBlogBean>();
		try {
			con = pool.getConnection();
			sql = "select * from tblPBlog where id=? order by num desc";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				PBlogBean bean = new PBlogBean();
				bean.setNum(rs.getInt(1));
				bean.setMessage(rs.getString(2));
				bean.setId(rs.getString(3));
				bean.setPdate(rs.getString(4));
				bean.setPhoto(rs.getString(5));
				bean.setHcnt(rs.getInt(6));
				vlist.addElement(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
	//PBlog Insert : MultipartRequest 사용
	public void insertPBlog(HttpServletRequest req) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			MultipartRequest multi = new MultipartRequest(req, SAVEFOLDER, 
					MAXSIZE, ENCTYPE, new DefaultFileRenamePolicy());
			String photo = null;
			if(multi.getFilesystemName("photo")!=null) {
				photo = multi.getFilesystemName("photo");
			}
			sql = "insert tblPBlog(message,id,pdate,photo)values(?,?,now(),?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, multi.getParameter("message"));
			pstmt.setString(2, multi.getParameter("id"));
			pstmt.setString(3, photo);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
	
	//PBlog Delete : 업로드된 파일까지 삭제
	public void deletePBlog(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			String photo = getPhoto(num);
			if(photo!=null&&!photo.equals("")) {
				File file = new File(SAVEFOLDER+photo);
				if(file.exists()) {
					UtilMgr.delete(SAVEFOLDER+photo);
				}
			}
			con = pool.getConnection();
			sql = "delete from tblPBlog where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
	
	//PBlog Get Photo : 포토블로그 삭제시 파일까지 삭제하기 위해 파일명 필요
	public String getPhoto(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		String photo = null;
		try {
			con = pool.getConnection();
			sql = "select photo from tblPBlog where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) photo = rs.getString(1);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return photo;
	}
	
	//HCnt Up : '좋아요' 1씩 증가 
	public void upHCnt(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "update tblPBlog set hCnt=hCnt+1 where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
}

















