package semidemo.handOutAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semidemo.dao.Handout_commDAO;

public class commDeleteAction {
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		
		int currentPage = Integer.parseInt(req.getParameter("pageNum"));
		
		int comm_num = Integer.parseInt(req.getParameter("handout_comm_num"));
		//int post_num = Integer.parseInt(req.getParameter("handout_post_num"));
		
		Handout_commDAO dao = Handout_commDAO.getInstance();
		
		req.setAttribute("pageNum", currentPage);
		dao.comm_deleteMethod(comm_num);
	}//end execute()////////////////////////////////////////////////////
}