package test.users.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.controller.Action;
import test.controller.ActionForward;
import test.users.dao.UsersDao;
import test.users.dto.UsersDto;

public class UsersInsertAction extends Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		String id=request.getParameter("id");
		String name=request.getParameter("name");
		String pwd=request.getParameter("pwd");
		String email=request.getParameter("email");
		
		UsersDto dto=new UsersDto();
		dto.setId(id);
		dto.setPwd(pwd);
		dto.setEmail(email);
		dto.setName(name);
		
		UsersDao.getInstance().insert(dto);
		
		return new ActionForward("/views/users/insert.jsp");
	}
	
}
