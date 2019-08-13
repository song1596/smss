package board;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import board.dao.BoardDAO;
import board.dto.BoardCommentDTO;
import board.dto.BoardDTO;
import common.Constants;
import page.Pager;


//@WebServlet("/board_servlet/*") 어노테이션은 꼭 지워야 함(web.xml에서 매핑 사용시)
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, 
	IOException {
		String url=request.getRequestURL().toString();
		String contextPath=request.getContextPath();
		BoardDAO dao=new BoardDAO();
		
		if(url.indexOf("search.do") != -1) {
			String searchkey=request.getParameter("searchkey");
			String search=request.getParameter("search");
			if(searchkey==null) searchkey="writer";
			if(search==null) search="";
			
			System.out.println("searchkey"+searchkey);
			System.out.println("search"+search);
			
			List<BoardDTO> items=dao.getList(searchkey,search);//방명록 리스트
			request.setAttribute("list", items);
			request.setAttribute("count", items.size());//레코드 갯수
			
			request.setAttribute("searchkey", searchkey);
			request.setAttribute("search", search);
			
			//방명록이 list.jsp에 출력
			String page="/audtjq/villa/villa/list.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}
		
		if(url.indexOf("list.do") != -1) {
			
			int count=dao.boardCount(); //레코드 갯수 계산
			int curPage=1; //null일때는 기본값 1을 줌
			if(request.getParameter("curPage") != null) {
				curPage=
						Integer.parseInt(request.getParameter("curPage"));
			}
			
			
			
			Pager pager=new Pager(count,curPage);
			int start=pager.getPageBegin();
			int end=pager.getPageEnd();
			
			
			List<BoardDTO> list=dao.list(start, end);
			
			request.setAttribute("list", list);
			request.setAttribute("page", pager);
			String page="/audtjq/villa/villa/list.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
			
			
		}else if(url.indexOf("insert.do") != -1) {
			
			File uploadDir=new File(Constants.UPLOAD_PATH);
			if(!uploadDir.exists()) {
				uploadDir.mkdir();
			}
					MultipartRequest multi=new MultipartRequest(
					request, Constants.UPLOAD_PATH, Constants.MAX_UPLOAD,
					"utf-8", new DefaultFileRenamePolicy());
			
			String writer=multi.getParameter("writer");
			String subject=multi.getParameter("subject");
			String content=multi.getParameter("content");
			String passwd=multi.getParameter("passwd");
			String ip=request.getRemoteAddr();
			String filename=" ";
			int filesize=0;
			try {
							Enumeration files=multi.getFileNames();
							while(files.hasMoreElements()) {
									String file1=(String)files.nextElement();
					filename=multi.getFilesystemName(file1);
					File f1=multi.getFile(file1);
					if(f1 != null) {
						filesize=(int)f1.length();
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			BoardDTO dto=new BoardDTO();
			dto.setWriter(writer);
			dto.setSubject(subject);
			dto.setContent(content);
			dto.setPasswd(passwd);
			dto.setIp(ip);
			
			if(filename == null || filename.trim().equals("")) {
				filename="-";
			}
			
			dto.setFilename(filename);
			dto.setFilesize(filesize);
			
			dao.insert(dto);
			String page="/board_servlet/list.do";
			response.sendRedirect(contextPath+page);
		}else if(url.indexOf("download.do") != -1) {
			int num=Integer.parseInt(request.getParameter("num"));
			String filename=dao.getFileName(num);
			System.out.println("첨부파일 이름:"+filename);
				String path=Constants.UPLOAD_PATH+filename;
			byte b[]=new byte[4096]; //바이트배열 생성
					FileInputStream fis=new FileInputStream(path);
						String mimeType=getServletContext().getMimeType(path);
			if(mimeType==null) {
				mimeType="application/octet-stream;charset=utf-8";
			}
					filename = 
					new String(filename.getBytes("utf-8"),"8859_1");
		
			response.setHeader("Content-Disposition", 
					"attachment;filename="+filename);
			
			ServletOutputStream out=response.getOutputStream();
			int numRead;
			while(true) {
				numRead = fis.read(b,0,b.length);//데이터 읽음
				if(numRead == -1) break;//더 이상 내용이 없으면
				out.write(b,0,numRead);//데이터 쓰기
			}
				out.flush();
			out.close();
			fis.close();
				dao.plusDown(num);
		}else if(url.indexOf("view.do") != -1) {
			int num=Integer.parseInt(request.getParameter("num"));
			HttpSession session=request.getSession();
			dao.plusReadCount(num,session); 
			BoardDTO dto=dao.viewReplace(num);
			//request 영역에 저장
			request.setAttribute("dto", dto);
			//화면 전환
			String page="/audtjq/villa/villa/view.jsp";
			RequestDispatcher rd
				=request.getRequestDispatcher(page);
			rd.forward(request, response);
			
		}else if(url.contains("commentList.do")) {
			int num=Integer.parseInt(request.getParameter("num"));
			List<BoardCommentDTO> list=dao.commentList(num);
			request.setAttribute("list", list);
			//출력 페이지로 이동
			String page="/audtjq/villa/villa/comment_list.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("comment_add.do") != -1) {
			BoardCommentDTO dto=new BoardCommentDTO();
			//게시물 번호
			int board_num=Integer.parseInt(
					request.getParameter("board_num"));
			String writer=request.getParameter("writer");
			String content=request.getParameter("content");
			dto.setBoard_num(board_num);
			dto.setWriter(writer);
			dto.setContent(content);
			dao.commentAdd(dto);
			//이곳은 백그라운드로 실행되기 때문에 어디로 page이동하든
			//소용없다.
		}else if(url.indexOf("reply.do") != -1) {
			int num=Integer.parseInt(request.getParameter("num"));
			BoardDTO dto=dao.view(num);
			dto.setContent("===게시물의 내용===\n"+dto.getContent());
			request.setAttribute("dto", dto);
			String page="/audtjq/villa/villa/reply.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("insertReply.do") != -1) {
			int num=Integer.parseInt(request.getParameter("num"));
			BoardDTO dto=dao.view(num);
			int ref=dto.getRef();//답변 그룹 번호
			int re_step=dto.getRe_step()+1;//출력순번
			int re_level=dto.getRe_level()+1;//답변 단계
			String writer=request.getParameter("writer");
			String subject=request.getParameter("subject");
			String content=request.getParameter("content");
			String passwd=request.getParameter("passwd");
			dto.setWriter(writer);
			dto.setSubject(subject);
			dto.setContent(content);
			dto.setPasswd(passwd);
			dto.setRef(ref);
			dto.setRe_level(re_level);
			dto.setRe_step(re_step);
			//첨부파일 관련 정보
			dto.setFilename("-");
			dto.setFilesize(0);
			dto.setDown(0);
			//답글 순서 조정
			dao.updateStep(ref, re_step);
			//답글 쓰기
			dao.reply(dto);
			//목록으로 이동
			String page="/board_servlet/list.do";
			response.sendRedirect(contextPath+page);
		}else if(url.indexOf("pass_check.do") != -1){
			//게시물 번호
			int num=Integer.parseInt(request.getParameter("num"));
			//입력한 비밀번호
			String passwd=request.getParameter("passwd");
			//비밀번호가 맞는지 확인
			String result=dao.passwdCheck(num, passwd);
			String page="";
			if(result != null){ //비밀번호가 맞으면
				page="/audtjq/villa/villa/edit.jsp";
				request.setAttribute("dto",  dao.view(num));
				RequestDispatcher rd
					=request.getRequestDispatcher(page);
				rd.forward(request, response);
			}else{ //비밀번호가 틀리면
				page=contextPath+"/board_servlet/view.do?num="
			+num+"&message=error";
				response.sendRedirect(page); 
			}//else
		}else if(url.indexOf("update.do") != -1) {
			//파일업로드 처리
			//디렉토리가 없으면 생성
			File uploadDir=new File(Constants.UPLOAD_PATH);
			if(!uploadDir.exists()){
				uploadDir.mkdir();
			}
			MultipartRequest multi=new MultipartRequest(
				request, Constants.UPLOAD_PATH, Constants.MAX_UPLOAD
				, "utf-8", new DefaultFileRenamePolicy() );
			
			int num=Integer.parseInt(multi.getParameter("num"));
			String writer=multi.getParameter("writer");
			String subject=multi.getParameter("subject");
			String content=multi.getParameter("content");
			String passwd=multi.getParameter("passwd");
			String ip=request.getRemoteAddr(); //클라이언트의 ip주소
			String filename=" "; //공백 1개
			int filesize=0;

			try {
				//첨부파일의 집합
				Enumeration files=multi.getFileNames();
				//다음 요소가 있으면
				while(files.hasMoreElements()){
					//첨부파일의 이름
					String file1=(String)files.nextElement();
					filename=multi.getFilesystemName(file1);
					File f1=multi.getFile(file1);
					if(f1 != null){
						filesize=(int)f1.length(); //파일 사이즈 저장
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			BoardDTO dto=new BoardDTO();
			dto.setNum(num); 
			dto.setWriter(writer);
			dto.setSubject(subject);
			dto.setContent(content);
			dto.setPasswd(passwd);
			dto.setIp(ip);

			if(filename == null || filename.trim().equals("")){
				//새로운 첨부파일이 없을 때(테이블의 기존정보를 가져옴)
				BoardDTO dto2=dao.view(num);
				String fName=dto2.getFilename();
				int fSize=dto2.getFilesize();
				int fDown=dto2.getDown();
				dto.setFilename(fName);
				dto.setFilesize(fSize);
				dto.setDown(fDown);
			}else{ 
				//새로운 첨부파일이 있을 때
				dto.setFilename(filename);
				dto.setFilesize(filesize);
			}
			
			//첨부파일 삭제 처리
			String fileDel=multi.getParameter("fileDel");
			//체크박스에 체크되었으면, value없이 썼기 때문에 on이 디폴트가됨
			if(fileDel != null && fileDel.equals("on")){
				String fileName=dao.getFileName(num);
				File f=new File(Constants.UPLOAD_PATH+fileName);
				f.delete(); //파일 삭제
				//첨부파일 정보를 지움
				dto.setFilename("-");
				dto.setFilesize(0);
				dto.setDown(0); 
			}
			//레코드 수정
			dao.update(dto);
			//페이지 이동
			String page="/board_servlet/list.do";
			response.sendRedirect(contextPath+page);
		}else if(url.indexOf("delete.do") != -1) {
			//파일업로드를 안쓰더라도 MultipartRequest 처리를 해야한다.
			MultipartRequest multi=new MultipartRequest(
					request, Constants.UPLOAD_PATH, Constants.MAX_UPLOAD
					, "utf-8", new DefaultFileRenamePolicy() );
			//삭제할 게시물 번호
			int num=Integer.parseInt(multi.getParameter("num"));
			dao.delete(num);
			//페이지이동
			String page="/board_servlet/list.do";
			response.sendRedirect(contextPath+page);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
