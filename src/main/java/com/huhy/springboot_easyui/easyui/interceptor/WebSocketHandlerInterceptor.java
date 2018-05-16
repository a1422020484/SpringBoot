package com.huhy.springboot_easyui.easyui.interceptor;


import com.huhy.springboot_easyui.easyui.common.Constants;
import com.huhy.springboot_easyui.easyui.common.ImUser;
import com.huhy.springboot_easyui.easyui.model.domain.Member;
import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

import javax.servlet.http.HttpSession;
import java.util.Map;


public class WebSocketHandlerInterceptor extends HttpSessionHandshakeInterceptor {

    @Override
    public boolean beforeHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler,
                                   Map<String, Object> attributes) throws Exception {
        if (request instanceof ServletServerHttpRequest) {
            ServletServerHttpRequest servletRequest = (ServletServerHttpRequest) request;
            HttpSession session = servletRequest.getServletRequest().getSession();
            if (session != null) {
                Member member = (Member) session.getAttribute(Constants.SESSION_MEMBER_KEY);
                attributes.put(Constants.WEB_SOCKET_USERNAME, new ImUser(member.getId(), member.getRealName()));
            }
        }
        return super.beforeHandshake(request, response, wsHandler, attributes);
    }
}
