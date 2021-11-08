package shop;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import board.DBConnectionMgr;

public class ProductMgr {

	private DBConnectionMgr pool;
	public static final String SAVEDIRECTORY = 
			"C:/Jsp/eclipse-workspace/myapp/src/main/webapp/shop/data/";
	public static final String ENCODING = "EUC-KR";
	public static final int MAXPOSTSIZE = 10*1024*1024;//10mb
	private static final String UPLOAD = null;
	private static final int MAXSIZE = 0;
	private static final String ENCTYPE = null;
	
	public ProductMgr() {
		pool = DBConnectionMgr.getInstance();
	}
	
	//Product List
	public Vector<ProductBean> getProductList(){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<ProductBean> vlist = new Vector<ProductBean>();
		try {
			con = pool.getConnection();
			sql = "select no, name, price, date, stock from tblProduct "
					+ "order by no desc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ProductBean bean = new ProductBean();
				bean.setNo(rs.getInt(1));
				bean.setName(rs.getString(2));
				bean.setPrice(rs.getInt(3));
				bean.setDate(rs.getString(4));
				bean.setStock(rs.getInt(5));
				vlist.addElement(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
	//Product Detail
	//select no, name, price, detail, date, stock, image
	//from tblProduct where no=?
	public ProductBean getProduct(int no) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		ProductBean bean = new ProductBean();
		try {
			con = pool.getConnection();
			sql = "select no, name, price, detail, date, stock, image "
					+ "from tblProduct where no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bean.setNo(rs.getInt(1));
				bean.setName(rs.getString(2));
				bean.setPrice(rs.getInt(3));
				bean.setDetail(rs.getString(4));
				bean.setDate(rs.getString(5));
				bean.setStock(rs.getInt(6));
				bean.setImage(rs.getString(7));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return bean;
	}
	
	//Product Stock Reduce(구매 -> 재고수정)
	//update tblProduct set stock = stock-? where no=?
	public void reduceProduct(OrderBean order) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "update tblProduct set stock = stock-? where no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, order.getQuantity());//주문개수
			pstmt.setInt(2, order.getProductNo());//상품번호
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
	
	///admin mode////
	
	//Product Insert
	//이미지 파일업로드 아닌경우는 이미지명 : ready.gif
	public boolean insertProduct(HttpServletRequest req) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag=false;
		try {
			MultipartRequest multi = new MultipartRequest(req, UPLOAD, MAXSIZE, ENCTYPE, new DefaultFileRenamePolicy());
			con = pool.getConnection();
			sql = "insert tblProduct(name,price,detail,date,stock,image)"+
					  "values(?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, multi.getParameter("name"));
			pstmt.setInt(2, Integer.parseInt(multi.getParameter("price")));
			pstmt.setString(3, multi.getParameter("detail"));
			pstmt.setString(4, UtilMgr.getDay());
			pstmt.setInt(5, Integer.parseInt(multi.getParameter("stock")));
			//만약 이미지가 있을경우, 없을경우 생각해야함
			if(multi.getFilesystemName("image")!=null)
				pstmt.setString(6, multi.getFilesystemName("image"));
			else
				pstmt.setString(6, "ready.gif");
			if(pstmt.executeUpdate()==1) flag=true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	
	//Product Update : 이미지 파일 수정 유무.
	 public boolean updateProduct(HttpServletRequest req) {
		 Connection con = null;
			PreparedStatement pstmt = null;
			String sql = null;
			boolean flag = false;
			try {
				MultipartRequest multi = new MultipartRequest(req,UPLOAD, MAXSIZE, ENCTYPE, new DefaultFileRenamePolicy());
				con = pool.getConnection();
				if(multi.getFilesystemName("image")!=null) {//파일까지 수정한다는 말
					//파일까지 수정한다는 말, 이미지도 수정
					sql = "update tblProduct set name=?, price=?, "
							+ "detail=?, stock=?, image=? where no=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, multi.getParameter("name"));
					pstmt.setInt(2, Integer.parseInt(multi.getParameter("price")));
					pstmt.setString(3, multi.getParameter("detail"));
					pstmt.setInt(4, Integer.parseInt(multi.getParameter("stock")));
					pstmt.setString(5, multi.getFilesystemName("image"));
					pstmt.setInt(6, Integer.parseInt(multi.getParameter("no")));
				}else {//이미지는 수정하지 않음
					sql = "update tblProduct set name=?, price=?, "
							+ "detail=?, stock=? where no=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, multi.getParameter("name"));
					pstmt.setInt(2, Integer.parseInt(multi.getParameter("price")));
					pstmt.setString(3, multi.getParameter("detail"));
					pstmt.setInt(4, Integer.parseInt(multi.getParameter("stock")));
					pstmt.setInt(5, Integer.parseInt(multi.getParameter("no")));
				}
				if(pstmt.executeUpdate()==1) flag = true;
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt);
			}
			return flag;
	 }
	
	//Product Delete : 상품 이미지는 삭제하지 않
	public boolean deleteProduct(int no) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "delete from tblProduct where no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			if(pstmt.executeUpdate()==1)
				flag = true;

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	
}







