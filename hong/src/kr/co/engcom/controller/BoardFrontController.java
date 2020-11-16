package kr.co.engcom.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.engcom.action.Action;
import kr.co.engcom.action.ActionForward;
import kr.co.engcom.service.board.BoardAddService;
import kr.co.engcom.service.board.BoardCommentService;
import kr.co.engcom.service.board.BoardDeleteService;
import kr.co.engcom.service.board.BoardDetailService;
import kr.co.engcom.service.board.BoardListService;
import kr.co.engcom.service.board.BoardModifyService;
import kr.co.engcom.service.board.BoardModifyView;
import kr.co.engcom.service.board.BoardReplyService;
import kr.co.engcom.service.board.BoardReplyView;


@WebServlet("*.bo")
public class BoardFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public BoardFrontController() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Process(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Process(request, response);
	}
	
	private void Process(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String RequestURI = request.getRequestURI();
		String ContextPath = request.getContextPath();

		String Command = RequestURI.substring(ContextPath.length());

		System.out.println("RequestURI : " + RequestURI);
		System.out.println("ContextPath : " + ContextPath);
		System.out.println("Command : " + Command);

		// 변수 2개
		ActionForward forward = null;
		Action action = null;

		if (Command.equals("/BoardList.bo")) {
			System.out.println("boardlist Display");
			action = new BoardListService(); // 다형성 (BoardListAction 이 action 구현)
			try {
				forward = action.execute(request, response);
				// BoardListActon.java 설정한 (request)정보 :
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (Command.equals("/BoardWrite.bo")) {
			// 로직 처리(x) 화면만 Display
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./WEB-INF/views/board/BoardWrite.jsp");

		} else if (Command.equals("/BoardAddService.bo")) {
			System.out.println("게시판 글쓰기");
			action = new BoardAddService(); // 다형성
			try {
				forward = action.execute(request, response);
				System.out.println("게시판 처리 완료");
			} catch (Exception e) {

				e.printStackTrace();
			}
		} else if (Command.equals("/BoardDetailService.bo")) { // /BoardDetailAction.do
			System.out.println("게시판 상세");
			action = new BoardDetailService(); // 다형성
			try {
				forward = action.execute(request, response);
				System.out.println("게시판 상세보기 처리 완료");
			} catch (Exception e) {

				e.printStackTrace();
			}

		} else if (Command.equals("/BoardDelete.bo")) {
			System.out.println("삭제 비밀번호 입력하기");
			forward = new ActionForward();
			forward.setRedirect(false); // 주의하기
			forward.setPath("qna_board_delete.jsp");

		} else if (Command.equals("/BoardDeleteService.bo")) {
			System.out.println("게시판 삭제");
			// request.getParameter("num")
			action = new BoardDeleteService(); // 다형성
			try {
				forward = action.execute(request, response);
				System.out.println("게시판 삭제 처리 완료");
			} catch (Exception e) {

				e.printStackTrace();
			}

		} else if (Command.equals("/BoardModify.bo")) {
			System.out.println("게시판 수정화면");

			action = new BoardModifyView(); // 다형성
			try {
				forward = action.execute(request, response);
				System.out.println("게시판 수정 페이지 처리 완료");
			} catch (Exception e) {

				e.printStackTrace();
			}
		} else if (Command.equals("/BoardModifyService.bo")) {
			// 실제 업데이트 처리
			System.out.println("게시판 수정 처리");

			action = new BoardModifyService(); // 다형성
			try {
				forward = action.execute(request, response);
				System.out.println("게시판 업데이트 완료");
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (Command.equals("/BoardReplyView.bo")) {
			System.out.println("게시판 답글 화면");

			action = new BoardReplyView(); // 다형성
			try {
				forward = action.execute(request, response);
				System.out.println("게시판 답글 완료");
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(Command.equals("/BoardReplyService.bo")){
			System.out.println("게시판 답글 처리");

			action = new BoardReplyService(); // 다형성
			try {
				forward = action.execute(request, response);
				System.out.println("게시판 답글처리 완료");
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(Command.equals("/BoardCommentService.bo")){
			System.out.println("게시판 댓글 처리");

			action = new BoardCommentService(); // 다형성
			try {
				forward = action.execute(request, response);
				System.out.println("게시판 댓글처리 완료");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		// 전체 설정
		if (forward != null) {
			if (forward.isRedirect()) { // true (isRedirect)
				System.out.println("forward.isRedirect : "
						+ forward.isRedirect());
				// 결론: 그냥 UI를 가지는 페이지를 재요청 하도록
				response.sendRedirect(forward.getPath());
			} else {
				// 결론 : view 단에서 처리할 데이터가 있다
				System.out.println("forward.getPath() : " + forward.getPath());
				RequestDispatcher dispatcher = request
						.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}

		}

	}

}
