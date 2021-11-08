package ch07;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class FileloadMgr {
	
	private DBConnectionMgr pool;
	public final static String savaFolder = 
			"C:/Jsp/eclipse-workspace/myapp/src/main/webapp/ch07/upload/";
	public final static String encoding = "EUC-KR";
	public final static int maxSize = 1024*1024*10;//10mb
	
	//생성자
	public FileloadMgr() {
		pool = DBConnectionMgr.getInstance();
	}
	
	//파일 업로드
	public void uploadFile(HttpServletRequest req) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			///////파일업로드///////////////////////////////////////
			MultipartRequest multi = 
					new MultipartRequest(req,savaFolder,maxSize,encoding,
							new DefaultFileRenamePolicy());
			//업로드 파일명 가져오기
			String upFile = multi.getFilesystemName("upFile");
			File f = multi.getFile("upFile");
			int size = (int)f.length();
			////////////////////////////////////////////////////
			con = pool.getConnection();
			sql = "insert tblFileload(upFile,size)values(?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, upFile);
			pstmt.setInt(2, size);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
	
	//파일 리스트
	public Vector<FileloadBean> listFile(){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<FileloadBean> vlist = new Vector<FileloadBean>();
		try {
			con = pool.getConnection();
			sql = "select * from tblFileload";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				FileloadBean bean = new FileloadBean();
				bean.setNum(rs.getInt("num"));
				bean.setUpFile(rs.getString("upFile"));
				bean.setSize(rs.getInt("size"));
				vlist.addElement(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
	//파일 삭제 : 업로된 실제 파일도 삭제하고 테이블에 레코드 삭제
	public void deleteFile(int num[]) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			for (int i = 0; i < num.length; i++) {
				//파일명을 가져온다.
				String upFile = getFileName(num[i]);
				//저장된 폴더 + 파일명
				File f = new File(savaFolder+upFile);
				if(f.exists()/*파일이 존재한다면*/) f.delete();//파일삭제 
				//레코드에서 삭제
				sql = "delete from tblFileload where num=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num[i]);
				pstmt.executeUpdate();
			}//---for
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
	
	
	//파일명 가져오기
	public String getFileName(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		String upFile = null;
		try {
			con = pool.getConnection();
			sql = "select upFile from tblFileload where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) upFile = rs.getString(1);//rs.getString("upFile");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return upFile;
	}
	
}
















