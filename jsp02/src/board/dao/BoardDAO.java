package board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import board.dto.BoardCommentDTO;
import board.dto.BoardDTO;
import page.EmpDTO;
import sqlmap.MybatisManager;

public class BoardDAO {

	public int boardCount() {
		SqlSession session=
				MybatisManager.getInstance().openSession();
		int count=session.selectOne("board.boardCount");
		session.close();
		return count;
	}

	
	//게시판 목록을 리턴, ArrayList를 쓰면 에러난다. List로 쓸것
		public List<BoardDTO> getList(String searchkey, String search){
			//mybatis 실행 객체
			SqlSession session=
					MybatisManager.getInstance().openSession();
			
			List<BoardDTO> list=null;
			if(searchkey.equals("writer_subject")) {//이름+내용
				list=session.selectList("ListAll", "%"+search+"%");
			}else {
				//mybatis의 method는 2개 이상의 parameter를 전달할 수 없음
				//따라서 dto객체나 HashMap등으로 값을 묶어서 보내야함.
				Map<String,String> map=new HashMap<>();
				map.put("searchkey", searchkey);
				map.put("search", "%"+search+"%");
				list=session.selectList("List", map);
			}
			//줄바꿈 및 특수문자 처리기능 추가
			for(BoardDTO dto : list) {
				String subject=dto.getSubject();
				subject=subject.replace("<", "&lt;");
				subject=subject.replace(">", "&gt;");
				//줄바꿈처리
				subject=subject.replace("\n", "<br>");
				//공백 2문자처리
				subject=subject.replace("  ", "&nbsp;&nbsp;");
				
				//키워드 색상 처리
				if(!searchkey.equals("writer")) {//이름으로만 검색시 제외
					subject=subject.replace(
						search, "<span style='color:red'>"+search+"</span>");
				}
				dto.setSubject(subject);
			}
			session.close(); //mybatis 세션 닫기
			return list;
		}
	
	public List<BoardDTO> list(int start,int end){
		List<BoardDTO> list=null;
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			Map<String,Object> map=new HashMap<>();
			map.put("start",start);
			map.put("end",end);
			list=session.selectList("board.list",map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return list; 
	}
	
	
		public List<BoardDTO> boardList(int start, int end){
			SqlSession session=
					MybatisManager.getInstance().openSession();
			Map<String,Object> map=new HashMap<>();
			map.put("start", start);
			map.put("end", end);
			System.out.println(map);
			
			List<BoardDTO> items=session.selectList("board.boardList", map);
			session.close();
			return items;
	
		}

	public void insert(BoardDTO dto) {
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			session.insert("board.insert", dto);
			session.commit();//auto commit이 아님
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) session.close();
		}
	}//insert()

	//첨부파일 이름 찾기
	public String getFileName(int num) {
		String result="";
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			result=session.selectOne("board.getFileName", num);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		return result;
	}//getFileName()

	//다운로드 횟수 증가 처리
	public void plusDown(int num) {
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			session.update("board.plusDown", num);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
	}//plusDown()

	public BoardDTO view(int num) {
		BoardDTO dto=null;
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			dto=session.selectOne("board.view", num);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if( session!= null ) session.close();
		}
		return dto;
	}//view()
	
	public BoardDTO viewReplace(int num) {
		BoardDTO dto=null;
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			dto=session.selectOne("board.view", num);
			//줄바꿈 처리
			String content=dto.getContent();
			content=content.replace("\n", "<br>");
			dto.setContent(content);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if( session!= null ) session.close();
		}
		return dto;
		
	}
	
	
	
	
	//조회수 증가 처리
	public void plusReadCount(int num, HttpSession count_session) {
		SqlSession session=null;
		try {
			long read_time=0;
			if(count_session.getAttribute("read_time_"+num)!=null) {
				read_time=(long)count_session.getAttribute("read_time_"+num);
			}
			long current_time=System.currentTimeMillis();//현재시각
			session=MybatisManager.getInstance().openSession();
			if(current_time-read_time>5*1000) {//현재시간-읽은시간>5초
				//24*60*60*1000 하루에 한번
				session.update("board.plusReadCount", num);
				session.commit();
				//최근 열람 시각 업데이트
				count_session.setAttribute(
						"read_time_"+num, current_time);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if( session!= null ) session.close();
		}
	}//plusReadCount()

	//댓글 목록을 구하는 코드
	public List<BoardCommentDTO> commentList(int board_num) {
		SqlSession session=MybatisManager.getInstance().openSession();
		List<BoardCommentDTO> 
		list=session.selectList("board.commentList", board_num);
					 session.close();
		
		return list;
	}

	//댓글 추가
	public void commentAdd(BoardCommentDTO dto) {
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			session.insert("board.commentAdd", dto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		
	}

	//답글의 순서 조정
	public void updateStep(int ref, int re_step) {
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			BoardDTO dto=new BoardDTO();
			dto.setRef(ref);
			dto.setRe_step(re_step);
			session.update("board.updateStep", dto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
	}//updateStep

	//답글 쓰기
	public void reply(BoardDTO dto) {
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			session.insert("board.reply", dto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
	}//reply()

	//비밀번호 체크
	public String passwdCheck(int num, String passwd) {
		String result=null;
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			Map<String,Object> map=new HashMap<>();
			map.put("num", num);
			map.put("passwd", passwd);
			result=session.selectOne("board.pass_check", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		
		return result;
	}

	//수정
	public void update(BoardDTO dto) {
		SqlSession session=null;
		try {
			session = MybatisManager.getInstance().openSession();
			session.update("board.update", dto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
	}//update()

	public void delete(int num) {
		SqlSession session=null;
		try {
			session = MybatisManager.getInstance().openSession();
			session.delete("board.delete", num);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		
	}
	
	}

