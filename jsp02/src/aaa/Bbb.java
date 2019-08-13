package aaa;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import aaa.AaaDAO;
import aaa.AaaDTO;


@WebServlet("/bbb/*")
public class Bbb extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
	HttpServletResponse response) throws ServletException, IOException {
		String uri=request.getRequestURI();
		System.out.println(uri);
		AaaDAO dao=new AaaDAO();
		if(uri.indexOf("login.do") != -1){//로그인 처리
			String userid=request.getParameter("userid");
			String passwd=request.getParameter("passwd");
			AaaDTO dto=new AaaDTO();
			dto.setUserid(userid);
			dto.setPasswd(passwd);
			String result=dao.loginCheck(dto);
			/* String name=dao.getname(userid); */
			System.out.println(dto.getName());
			System.out.println(result);
			String page="/audtjq/villa/villa/login.jsp"; 
			if(!result.equals("로그인 실패")) {
				HttpSession session=request.getSession();
				session.setAttribute("userid", userid);
				session.setAttribute("message", result);
				page="/audtjq/villa/villa/index.jsp";
				response.sendRedirect(request.getContextPath()+page);
			}else {
				response.sendRedirect(
						request.getContextPath()+
						page+"?message=error");
			      }
			}else if(uri.indexOf("logout.do") != -1) {
				HttpSession session=request.getSession();
				session.invalidate();
				String page=request.getContextPath()
						+"/audtjq/villa/villa/index.jsp?message=logout";
				response.sendRedirect(page);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
