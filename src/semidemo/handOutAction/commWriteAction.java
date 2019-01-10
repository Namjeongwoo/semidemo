package semidemo.handOutAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semidemo.dao.Handout_commDAO;
import semidemo.dto.Handout_commDTO;

public class commWriteAction {
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		int num = Integer.parseInt(req.getParameter("handout_post_num"));
		
		Handout_commDAO dao = Handout_commDAO.getInstance();
		Handout_commDTO dto = new Handout_commDTO();
		
		
	}
}
