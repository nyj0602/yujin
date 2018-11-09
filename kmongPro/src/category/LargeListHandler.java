package category;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;

import com.util.ConnectionProvider;
import com.util.DBConn;
import com.util.JdbcUtil;

import command.CommandHandler;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class LargeListHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("aaaaa");
		String category = request.getParameter("category");
		String page = request.getParameter("page") == null ? "1" : request.getParameter("page");
		String grade =  request.getParameter("grade");
			
		String sort = request.getParameter("sort")==null? "recommendation":request.getParameter("sort");
		
		Connection conn = null;
		
		
		try {
			conn = ConnectionProvider.getConnection();
			PreparedStatement  pstmt = null;
			ArrayList<TalentDTO> talentList = new ArrayList<>();
			ArrayList<CategoryDTO> categoryName = new ArrayList<>();
			ArrayList<CategoryDTO> categoryList = new ArrayList<>();
			JSONObject star = new JSONObject();
			JSONArray starArray = new JSONArray();
			JSONObject starobj = new JSONObject();
			ResultSet rs = null;
			  try {
				  
				  String[] grades = { "아직 없당" };
					if (request.getParameterValues("grades") != null) {
						grades = request.getParameterValues("grades");
						grade = StringUtils.join(grades, "\',\'") ;
						System.out.println("grade : " + grade);
					}
				
				String sql =" select t_name,t.t_seq,image, t.m_email, t_ad ,m_name ,m_sep ,m_profile,op_price,gs_name,ts_name,t_date, gs_seq  from ";
				  sql	+=  " (select * from (select t_name,ca.t_seq,image,rank() over (PARTITION BY (i.t_seq)order by i_seq) main, t_date, ";
				  sql	+=	"	t.m_email, t_ad ,m_name ,m_sep ,m_profile, gs_name, ts_name,gs.gs_seq   from cat_arrange ca join image i on ca.T_SEQ = i.T_SEQ ";
				  sql	+=   "join talent t on t.t_seq=ca.t_seq join tal_state ts on ts.t_seq= t.t_seq join member m on m.m_email=t.m_email  join grade g on g.m_email=m.m_email join g_separate gs on gs.gs_seq=g.gs_seq ";
				  sql	+=   " where c_id in (select c_id from category where c_superid= ? ) and i_video=0 and ts_name='판매중' and m.M_WDRAING = 0 ) ";
				  sql	+=	 " where main=1	  ) t join t_option o on t.t_seq = o.t_seq   where op_sep ='standard'  ";
					if (request.getParameterValues("grades") != null) {
						sql += " and gs_name in ('" + grade + "') ";
					}
				 
				  if (sort.equals("ranking")) {	  sql += 	" order by gs_seq desc ";	}
				  else if (sort.equals("created_at")) {	sql += 	" order by t_ad, t_date ";	}
				  else {				sql += 	" order by t_ad ";			}
				 pstmt = conn.prepareStatement(sql);
				 pstmt.setInt(1, Integer.parseInt(category) );
				rs =  pstmt.executeQuery();
				  
				   String t_name;
				  int t_seq;
				  String image;
				 String m_email;
				 String t_ad;
				 String m_name;
				 String m_sep;
				 String m_profile;
				 int op_price;
				 String gs_name;
				 String ts_name;

			         while (rs.next()) {
			            TalentDTO dto = new TalentDTO();
			            t_name = rs.getString("t_name");
			            t_seq = rs.getInt("t_seq");
			            image = rs.getString("image");
			            m_email = rs.getString("m_email");
			            t_ad = rs.getString("t_ad");
			            m_name = rs.getString("m_name");
			            m_sep = rs.getString("m_sep");
			            m_profile = rs.getString("m_profile");
			            op_price =  rs.getInt("op_price");
			            gs_name = rs.getString("gs_name");
			            ts_name = rs.getString("ts_name");

			            dto.setT_name(t_name);
			            dto.setT_seq(t_seq);
			            dto.setImage(image);
			            dto.setM_email(m_email);
			            dto.setT_ad(t_ad);
			            dto.setM_name(m_name);
			            dto.setM_sep(m_sep);
			            dto.setM_profile(m_profile);
			            dto.setOp_price(op_price);
			            dto.setGs_name(gs_name);
			            dto.setTs_name(ts_name);

			            talentList.add(dto);
			         } // while 재능 뿌리기
			    
		 			   sql =" select  c_id, c_superid,c_level, c_group from category where c_id= ?";
			 			  pstmt = conn.prepareStatement(sql);
			 			 pstmt.setInt(1, Integer.parseInt(category) );
			 			rs =  pstmt.executeQuery();
			 			  
			 			 int c_id;       
			 			 int c_superid;  
			 			 int c_level;    
			 			 String c_group; 

			 	         while (rs.next()) {
			 	        	 CategoryDTO dto = new CategoryDTO();
			 	        	c_id= rs.getInt("c_id");
			 	        	 c_superid = rs.getInt("c_superid");
			 	        	c_level = rs.getInt("c_level");
			 	        	c_group = rs.getString("c_group");
			 	        	
			 	            dto.setC_id(c_id);
			 	            dto.setC_superid(c_superid);
			 	            dto.setC_level(c_level);
			 	            dto.setC_group(c_group);

			 	           categoryName.add(dto);
			 	         } // while 카테고리명
			 	         
			 			   sql = " select c_id, c_superid, c_level, c_group  from category where c_superid= ?";
			 			   pstmt = conn.prepareStatement(sql);
			 			   pstmt.setInt(1, Integer.parseInt(category) );
			 			  rs =  pstmt.executeQuery();
			 			  
			 	         while (rs.next()) {
			 	        	 CategoryDTO dto2 = new CategoryDTO();
			 	        	c_id= rs.getInt("c_id");
			 	        	 c_superid = rs.getInt("c_superid");
			 	        	c_level = rs.getInt("c_level");
			 	        	c_group = rs.getString("c_group");
			 	        	
			 	            dto2.setC_id(c_id);
			 	            dto2.setC_superid(c_superid);
			 	            dto2.setC_level(c_level);
			 	            dto2.setC_group(c_group);

			 	           categoryList.add(dto2);
			 	         } // while 카테고리 중분류
			 	         
			 	        sql = " select t_seq, avg(e_star) avg, count(t_seq) num from ( select pl.t_seq, e_star, rank() over (partition by t_seq order by op_seq) rank 	";
			 	        sql +=	" from evaluation e join t_order od on e.order_num=od.order_num join payment p on p.p_seq=od.p_seq join payment_list pl on pl.p_seq=p.p_seq where p.p_sep='서비스 구매' ";
			 	        sql +=	") where rank=1 group by t_seq ";
			 			   pstmt = conn.prepareStatement(sql);
			 			  rs =  pstmt.executeQuery();
			 			  
			 	         while (rs.next()) {
			 	        	starobj.put("t_seq", rs.getInt(1));
			 	        	starobj.put("avg", rs.getDouble(2));
			 	        	starobj.put("num", rs.getInt(3));
			 		      
			 	        	starArray.add(starobj);
			 	        	star.put("st", starArray);
			 	         } //평가
			      } catch (SQLException e) {
			         System.out.println(e.toString());
			      } catch (Exception e) {
			         System.out.println(e.toString());
			      } finally {
			         if (rs != null) 		 try {  rs.close();     } catch (Exception e) {	            }
			         if (pstmt != null)   try {   pstmt.close(); } catch (Exception e) {	            }
			         //if (conn != null)   try {    conn.close();} catch (Exception e) {	            }
			      } // finally
			  System.out.println("largeListHandler 호출");
			  int size = talentList.size();
			  
			  //System.out.println(sql);
			  request.setAttribute("TalentList", talentList);
			  request.setAttribute("categoryName", categoryName);
			  request.setAttribute("categoryList", categoryList);
			  request.setAttribute("size", size);
			  request.setAttribute("page", page);
			  request.setAttribute("category", category);
			  request.setAttribute("sort", sort);
			  request.setAttribute("grade", grade);
			  request.setAttribute("star", star);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
		}

	
		return "/WEB-INF/view/category/LargeList.jsp";
	}//process

}
