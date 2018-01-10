package test.controller;

import test.action.HomeAction;
import test.users.action.UsersInsertAction;
import test.users.action.UsersInsertFormAction;
import test.users.action.UsersLoginAction;
import test.users.action.UsersLoginFormAction;
import test.users.action.UsersLogoutAction;
import test.users.action.UsersSearchFormAction;

public class UserActionFactory {
   

   private static UserActionFactory factory;
   private UserActionFactory(){}
   //자신의 참조값을 리턴해주는 메소드
   public static UserActionFactory getInstance(){
      if(factory==null){
         factory=new UserActionFactory();
      }
      return factory;
   }
   
   //요청처리를 할 Action객체를 리턴해주는 메소드
   public Action action(String command) {
      
      Action action=null;
     if(command.equals("/users/insertform")) {
    	 action=new UsersInsertFormAction();
     }else if(command.equals("/users/insert")) {
    	 action=new UsersInsertAction();
     }else if(command.equals("/users/loginform")) {
    	 action=new UsersLoginFormAction();
     }else if(command.equals("/users/login")) {
    	 action=new UsersLoginAction();
     }else if(command.equals("/home")) {
   	  action=new HomeAction();
     }else if(command.equals("/users/searchform")) {
    	 action=new UsersSearchFormAction();
     }else if(command.equals("/users/logout")) {
    	 action=new UsersLogoutAction();
     }
      return action;
   }
   
}