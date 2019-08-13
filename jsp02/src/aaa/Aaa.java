package aaa;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import aaa.AaaDAO;
import aaa.AaaDTO;


@WebServlet("/aaa/*")
public class Aaa extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, 
	HttpServletResponse response) throws ServletException, IOException {
				String uri=request.getRequestURI();
				String context=request.getContextPath();
				AaaDAO dao = new AaaDAO();
				if(uri.indexOf("list.do") != -1) {
					System.out.println("list.do호출..");
					System.out.println(request.getRequestURI());
					System.out.println(uri.indexOf("list.do"));
					Map<String,Object> map=new HashMap<>();
					List<AaaDTO> list=dao.memberList();
					map.put("list", list);
					map.put("count", list.size());
					request.setAttribute("map", map);
					String page="/audtjq/villa/villa/memberlist2s.jsp";
					RequestDispatcher rd=request.getRequestDispatcher(page);
					rd.forward(request, response);
				}else if(uri.indexOf("join.do") != -1) {
					String userid=request.getParameter("userid");
					String passwd=request.getParameter("passwd");
					String name=request.getParameter("name");
					String email=request.getParameter("email");
					String hp=request.getParameter("hp");
					AaaDTO dto=new AaaDTO();//MemberDTO생성
					dto.setUserid(userid);
					dto.setPasswd(passwd);
					dto.setName(name);
					dto.setEmail(email);
					dto.setHp(hp);
					dao.insert(dto);//추가
					
					String page="/audtjq/villa/villa/index.jsp";
					response.sendRedirect(context+page);
				}else if(uri.indexOf("view.do") != -1) {
					String userid=request.getParameter("userid");
					//System.out.println("클릭한 아이디:"+userid);
					AaaDTO dto=dao.memberDetail(userid);
					request.setAttribute("dto", dto);
					String page="/audtjq/villa/villa/member_view2.jsp";
					RequestDispatcher rd=request.getRequestDispatcher(page);
					rd.forward(request, response);
				}else if(uri.indexOf("update.do") != -1) {
					String userid=request.getParameter("userid");
					String passwd=request.getParameter("passwd");
					String name=request.getParameter("name");
					String email=request.getParameter("email");
					String hp=request.getParameter("hp");
					AaaDTO dto=new AaaDTO();
					dto.setUserid(userid);
					dto.setPasswd(passwd);
					dto.setName(name);
					dto.setEmail(email);
					dto.setHp(hp);
					dao.update(dto);
					response.sendRedirect(context+"/audtjq/villa/villa/join.jsp");
				}else if(uri.indexOf("delete.do") != -1) {
					String userid=request.getParameter("userid");
					dao.delete(userid);
					
					response.sendRedirect(context+"/audtjq/villa/villa/member2.jsps");
				}else if(uri.indexOf("login.do") != -1) {
					String userid=request.getParameter("userid");
					String passwd=request.getParameter("passwd");
					System.out.println("아이디:"+userid);
					System.out.println("패스워드:"+passwd);
					AaaDTO dto=new AaaDTO();
					dto.setUserid(userid);
					dto.setPasswd(passwd);
					String result=dao.loginCheck(dto);
					System.out.println(result);
					request.setAttribute("result", result);
					String page="/audtjq/villa/villa/aaa_result.jsp";
					RequestDispatcher rd=request.getRequestDispatcher(page);
					rd.forward(request, response); 
				}else if(uri.indexOf("join_bcrypt.do") != -1) {
					String userid=request.getParameter("userid");
					String passwd=request.getParameter("passwd");
					String name=request.getParameter("name");
					String email=request.getParameter("email");
					String hp=request.getParameter("hp");
					AaaDTO dto=new AaaDTO();
					dto.setUserid(userid);
					dto.setPasswd(passwd);
					dto.setName(name);
					dto.setEmail(email);
					dto.setHp(hp);
					dao.insertBcrypt(dto);
				}else if(uri.indexOf("login_bcrypt.do") != -1) {
					String userid=request.getParameter("userid");
					String passwd=request.getParameter("passwd");
					System.out.println("아이디:"+userid);
					System.out.println("패스워드:"+passwd);
					AaaDTO dto=new AaaDTO();
					dto.setUserid(userid);
					dto.setPasswd(passwd);
					String result=dao.loginCheckBcrypt(dto);
					System.out.println(result);
					request.setAttribute("result", result);
					String page="/audtjq/villa/villa/aaa_result.jsp";
					RequestDispatcher rd=request.getRequestDispatcher(page);
					rd.forward(request, response);
				
				
				}
				
			}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}