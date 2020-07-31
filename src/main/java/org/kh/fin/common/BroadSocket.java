package org.kh.fin.common;


import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;



@ServerEndpoint("/broadcasting/{userId}")
public class BroadSocket {
    private static Set<Session> clients = Collections.synchronizedSet(new HashSet<Session>());
    private static ArrayList<String> list= new ArrayList<String>();
    @OnMessage
    public void onMessage(String message, Session session) throws IOException {
        System.out.println(message);
        synchronized(clients) {
            for(Session client : clients) {
                if(!client.equals(session)) {
                    client.getBasicRemote().sendText(message);
                    client.getBasicRemote().sendText("@list:"+list.toString());
                                   
					
                }
            }
        }
    }
    
    @OnOpen
    public void onOpen(Session session, @PathParam("userId")String userId) throws IOException{
        System.out.println(session);
        clients.add(session);
        list.add(userId);
    	System.out.println("현재 사용자 목록"+list);
        onMessage(userId+"님이 접속했습니다",session);
        
       
        	
       
    }
    @OnClose
    public void onClose(Session session,@PathParam("userId")String userId) throws IOException {
    	list.remove(list.indexOf(userId));
    	onMessage(userId+"님이 나갔습니다",session);
    	System.out.println("소켓 연결 해제");
    	
    		
    	System.out.println("현재 사용자 목록"+list);
    	clients.remove(session);
     
    }
}
