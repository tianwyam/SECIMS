package com.cuit.secims.mw.ws;

import java.util.ArrayList;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;

import com.cuit.secims.mw.service.LearningForumSV;
import com.google.common.reflect.TypeToken;
import com.google.gson.Gson;




public class MyWebSocketHandler implements WebSocketHandler{

	
	private static final Logger log = Logger.getLogger(MyWebSocketHandler.class);
	
	// 保存所有的用户session
	private static final ArrayList<WebSocketSession> users = new ArrayList<WebSocketSession>();
	
	// 保存内容
	private static StringBuffer content ;

	
	// 连接 就绪时 
	@Override
	public void afterConnectionEstablished(WebSocketSession session)
			throws Exception {
		
		log.info("connect websocket success.......");
		
		users.add(session);
		
		// 定义内容
		content = new StringBuffer();
		
	}


	
	@SuppressWarnings("serial")
	@Override
	public void handleMessage(WebSocketSession session,
			WebSocketMessage<?> message) throws Exception {
		
		Gson gson = new Gson();
		boolean flag = false;
		
		// message.getPayload() 发送的信息
		Map<String, Object> msg = gson.fromJson(message.getPayload().toString(), 
				new TypeToken<Map<String, Object>>() {}.getType());
		
		log.info("handleMessage......."+message.getPayload()+"..........."+msg);
		
		
		// 帖子ID
		Double postsId = Double.parseDouble(msg.get("postsId").toString());
		// 当前片段
		Double currentIndex = Double.parseDouble((String)msg.get("msgCurrent"));
		// 总片段
		Double msgCount = Double.parseDouble(msg.get("msgCount").toString());
		// 内容
		String msgContent = msg.get("msgContent").toString();
		
		// 判断是否是最后一部分
		if (currentIndex + 1 == msgCount) {
			flag = true;
		}
		
		
		// 内容追加
		content.append(msgContent);

		if (flag) {
			
			// 获取userID
			Map<String, Object> attr = session.getHandshakeAttributes();
			int userId = (Integer)attr.get("userId");
			// 最后一片 // 存信息
			collectMsgContent(content.toString(), postsId.intValue(), userId, postsId.intValue());
			// 重新创建一下新的
			content = new StringBuffer();
		}
		
//		session.sendMessage(message);
		TextMessage textMessage = new TextMessage(msgContent, flag);
		sendMsgToAllUsers(textMessage);
	}


	@Override
	public void handleTransportError(WebSocketSession session,
			Throwable exception) throws Exception {
		// TODO Auto-generated method stub
		log.info(" ...... handleTransportError ......... ");
	}


	
	// 关闭 连接时
	@Override
	public void afterConnectionClosed(WebSocketSession session,
			CloseStatus closeStatus) throws Exception {

		log.info("connect websocket closed.......");
		
		users.remove(session);
		
		// 清空内容
		content = null;
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
	
	
	// 收集 内容
	public void collectMsgContent(String msgContent, int postsId, int userid, int parentId){
		
		
		
		this.forumSV.addForumChatMsg( msgContent,  postsId,  userid,  parentId);
		
		log.info("添加 聊天信息成功 ！ ....... ");
	}
	
	
	
	// 学习论坛聊天服务
	@Autowired
	private LearningForumSV forumSV;
	
}
