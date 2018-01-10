package test.controller;

import test.users.action.UsersInsertAction;
import test.users.action.UsersInsertFormAction;

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
     }
      return action;
   }
   
}