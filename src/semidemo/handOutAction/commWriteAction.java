package semidemo.handOutAction;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semidemo.dao.Handout_commDAO;
import semidemo.dto.Handout_commDTO;

public class commWriteAction {
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		
		
		int num = Integer.parseInt(req.getParameter("handout_post_num"));
		String nickname = req.getParameter("nickname");
		String textInput = req.getParameter("textInput");
		String callImage = req.getParameter("callImage");
		
		System.out.println("commWriteAction num: "+num);
		System.out.println("commWriteAction nickname: "+nickname);
		System.out.println("commWriteAction textInput: "+textInput);
		System.out.println("commWriteAction callImage: "+callImage);
		
		Handout_commDAO dao = Handout_commDAO.getInstance();
		Handout_commDTO dto = new Handout_commDTO();
		
		dto.setHandout_post_num(num);
		dto.setNickname(nickname);
		dto.setContent(textInput);
		dto.setImage(callImage);
		dao.comm_insertMethod(dto);
			
		
	}//end execute()///////////////////////////////////
}
