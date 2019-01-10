package semidemo.handOutAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semidemo.dao.Handout_commDAO;



public class commViewAction {
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		int num = Integer.parseInt(req.getParameter("handout_post_num"));		

		Handout_commDAO dao = Handout_commDAO.getInstance();
		req.setAttribute("comm_dto", dao.comm_viewMethod(num));
			
		
	}
}
