package com.huhy.springboot_easyui.easyui.controller.websocket;


import com.huhy.springboot_easyui.easyui.common.AjaxResult;
import com.huhy.springboot_easyui.easyui.common.SocketMessage;
import com.huhy.springboot_easyui.easyui.handler.WebSocketHandler;
import com.huhy.springboot_easyui.easyui.model.domain.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import java.util.HashMap;
import java.util.Map;


@Controller
public class ImController {

    @Autowired
    WebSocketHandler webSocketHandler;

    /**
     * 发送信息给指定用户
     *
     * @param uid
     * @param content
     * @param member
     */
    @RequestMapping("/im/send")
    @ResponseBody
    public void send(Long uid, String content, @SessionAttribute("s_member") Member member) {
        Map<String, Object> message = new HashMap<>();
        message.put("fromUid", member.getId());
        message.put("realName", member.getRealName());
        message.put("message", content);
        webSocketHandler.sendMessageToUser(uid, new SocketMessage("message", message).toTextMessage());
    }

    /**
     * 获取在线用户列表
     *
     * @return
     */
    @RequestMapping("/im/user/list")
    @ResponseBody
    public AjaxResult userList() {
        return new AjaxResult().setData(webSocketHandler.getUsers());
    }
}
