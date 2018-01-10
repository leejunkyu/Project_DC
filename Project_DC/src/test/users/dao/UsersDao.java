package test.users.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import test.mybatis.SqlMapConfig;
import test.users.dto.UsersDto;

public class UsersDao {
	private static UsersDao dao;
	private static SqlSessionFactory factory;
	private UsersDao(){}
	public static UsersDao getInstance(){
		if(dao==null){
			dao=new UsersDao();
			factory=SqlMapConfig.getSqlSession();
		}
		return dao;
	}
	
	public boolean isValid(UsersDto dto) {
		SqlSession session=null;
		String id=null;
		try {
			session=factory.openSession();
			id=session.selectOne("users.isValid", dto);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		if(id == null) {
			return false;
		}else {
			return true;
		}
	}
	
	public boolean check(String msg) {
		SqlSession session=null;
		String id=null;
		try {
			session=factory.openSession();
			id=session.selectOne("check", msg);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		if(id==null) {
			return false;
		}else {
			return true;
		}
	}
	
	public void insert(UsersDto dto) {
		SqlSession session=null;
		try {
			session=factory.openSession(true);
			session.insert("users.insert", dto);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
	}
}
