package com.cuit.secims.mw.ws;

import java.util.ArrayList;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;

import com.google.common.reflect.TypeToken;
import com.google.gson.Gson;




public class MyWebSocketHandler implements WebSocketHandler{

	
	private static final Logger log = Logger.getLogger(MyWebSocketHandler.class);
	
	// 保存所有的用户session
	private static final ArrayList<WebSocketSession> users = new ArrayList<WebSocketSession>();

	
	// 连接 就绪时 
	@Override
	public void afterConnectionEstablished(WebSocketSession session)
			throws Exception {
		
		log.info("connect websocket success.......");
		
		users.add(session);
		
	}


	
	@Override
	public void handleMessage(WebSocketSession session,
			WebSocketMessage<?> message) throws Exception {
		
		Gson gson = new Gson();
		
		Map<String, Object> msg = gson.fromJson(message.getPayload().toString(), 
				new TypeToken<Map<String, Object>>() {}.getType());
		
		log.info("handleMessage......."+message.getPayload()+"..........."+msg);
		
//		session.sendMessage(message);
		TextMessage textMessage = new TextMessage(msg.get("msgContent").toString(), true);
		sendMsgToAllUsers(textMessage);
		
		
	}


	@Override
	public void handleTransportError(WebSocketSession session,
			Throwable exception) throws Exception {
		// TODO Auto-generated method stub
		
	}


	
	// 关闭 连接时
	@Override
	public void afterConnectionClosed(WebSocketSession session,
			CloseStatus closeStatus) throws Exception {

		log.info("connect websocket closed.......");
		
		users.remove(session);
		
	}


	
	@Override
	public boolean supportsPartialMessages() {
		// TODO Auto-generated method stub
		return false;
	}
	
	
	
	// 给所有用户发送 信息
	public void sendMsgToAllUsers(WebSocketMessage<?> message) throws Exception{
		
		for (WebSocketSession user : users) {
			user.sendMessage(message);
		}
		
	}
	
}
