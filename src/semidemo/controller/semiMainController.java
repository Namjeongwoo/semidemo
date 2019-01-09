package semidemo.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import semidemo.handOutAction.DeleteAction;
import semidemo.handOutAction.ListAction;
import semidemo.handOutAction.UpdateFormAction;
import semidemo.handOutAction.UpdateProAction;
import semidemo.handOutAction.ViewAction;
import semidemo.handOutAction.WriteAction;

//시작하는 곳 (메인 페이지)
@WebServlet("/mammaMain/*")
public class semiMainController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);

	}// end doGet()//////////////////////////////////////////

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}// end doPost()/////////////////////////////////////////

	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// uri 가져오기
		String uri = req.getRequestURI();

		// uri에서 필요한 부분만 가지고 오기
		String action = uri.substring(uri.lastIndexOf("/"));

		// forward 경로지정할 변수
		String path = "";

		if (action.equals("/*")) {
			// 메인 페이지로 이동 (페이지지정 및 이동)
			path = "/semiview/main/semimain.jsp";

		} else if (action.equals("/login.do")) {
			// 로그인 페이지로 이동
			path = "/semiview/login/login.jsp";

		} else if (action.equals("/signup.do")) {
			// 회원가입 페이지로 이동
			path = "/semiview/login/signup.jsp";

		} else if (action.equals("/find.do")) {
			// 아이디,비번찾기 페이지로 이동
			path = "/semiview/login/find.jsp";

		} else if (action.equals("/recipe.do")) {
			// 레시피 페이지로 이동
			path = "/semiview/menu/recipe/RecipePage.jsp";

		} else if (action.equals("/momTalk.do")) {
			// 맘톡 페이지로 이동
			path = "/semiview/menu/momTalk/momTalkPage.jsp";
			
		} else if (action.equals("/info.do")) {
			// 육아정보 페이지로 이동
			path = "/semiview/menu/information/informationPage.jsp";

		} else if (action.equals("/question.do")) {
			// Q&A 페이지로 이동
			path = "/semiview/menu/QnA/questionPage.jsp";
//-------------------------------------------------------------------------------------------------------------------------
			
		} else if (action.equals("/handOut.do")) {
			//상품 리스트 페이지
			ListAction list = new ListAction();
			list.execute(req, resp);
			path = "/semiview/menu/handOut/handOutPage.jsp";
			
		} else if (action.equals("/handOutWrite.do")) {
			// 글쓰기 페이지로 이동
			path = "/semiview/menu/handOut/handOutWrite.jsp";

		} else if (action.equals("/handOutWriteForm.do")) {
			// 무료나눔 글 쓰고 나서 list 로 돌아가기
			WriteAction write = new WriteAction();
			MultipartRequest multi = write.excute(req, resp);

			/* 특정 페이지에서 답변쓰고 난 후 상품 페이지로 돌아오기. */
			resp.sendRedirect("handOut.do");
			

		} else if (action.equals("/handOutView.do")) {
			//상세 페이지로 이동.
			//상세 페이지 이동시 DB에 있는 내용 테이블에 불러와서 보여준다.
			ViewAction view = new ViewAction();
			view.execute(req, resp);
			path = "/semiview/menu/handOut/handOutView.jsp";

		} else if (action.equals("/handOutUpdateWrite.do")) {
			//수정페이지로 이동
			//수정페이지 이동시 DB 내용 가지고 와서 수정페이지에 띄워준다.
			UpdateFormAction updateForm = new UpdateFormAction();
			updateForm.execute(req, resp);
			path = "/semiview/menu/handOut/handOutUpdate.jsp";

		} else if (action.equals("/handOutUpdatePro.do")) {
			//수정페이지에서 수정하기.
			UpdateProAction updatePro = new UpdateProAction();
			MultipartRequest multi = updatePro.excute(req, resp);
			//수정 후에 상품리스트로 돌아가기.
			resp.sendRedirect("handOut.do");
		
		} else if (action.equals("/handOutDelete.do")) {
			DeleteAction delete = new DeleteAction();
			delete.execute(req, resp);
			
			//현재 페이지값을 넘겨주면서, 상품 리스트로 이동.
			resp.sendRedirect("handOut.do?pageNum="+req.getParameter("pageNum"));
		}

		
		
		if (path != "") { // 기본값이 아닐때, path가 설정되어 있을때, sendRedirect방식을 사용할때, forward방식을 사용하지 않을때
			RequestDispatcher dis = req.getRequestDispatcher(path);
			dis.forward(req, resp);
		}

	}// end doProcess()//////////////////////////////////////
}// end class
