package test.file.action;

import java.io.File;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.controller.Action;
import test.controller.ActionForward;
import test.file.dao.FileDao;
import test.file.dto.FileDto;

public class FileDeleteAction extends Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		int num=Integer.parseInt(request.getParameter("num"));
		//1. 삭제할 파일의 저장된 파일명을 읽어온다.
		FileDto dto=FileDao.getInstance().getData(num);
		String saveFileName=dto.getSaveFileName();
		//2. DB 에서 파일 정보 삭제
		FileDao.getInstance().delete(num);
		//3. 파일 시스템에서 삭제 
		ServletContext application=request.getServletContext();
		//삭제할 파일의 절대 경로 구성하기 
	 	String path=application.getRealPath("/upload")+
	 		File.separator+saveFileName;
	 	//File 객체생성해서 삭제하기 
	 	new File(path).delete();
	 	System.out.println("test!");
	 	//파일 목록 보기로 리다일렉트 이동 
	 	ActionForward af=new ActionForward("/file/list.do");
	 	af.setRedirect(true);
	 	return af;
	}

}
