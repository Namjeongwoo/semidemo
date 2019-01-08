package semidemo.handOutAction;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semidemo.dao.Handout_postDAO;
import semidemo.dto.Handout_postDTO;



public class ListAction {
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
				
		Handout_postDAO dao = Handout_postDAO.getInstance();
		
		List<Handout_postDTO> aList = dao.listMethod();
		req.setAttribute("aList", aList);
		System.out.println(req.getParameter("aList"));
		
	}//end execute()///////
}
