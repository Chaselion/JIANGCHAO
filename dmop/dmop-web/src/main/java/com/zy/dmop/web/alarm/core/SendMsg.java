package com.zy.dmop.web.alarm.core;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import com.zy.dmop.api.alarm.service.AlarmLogService;
import com.zy.dmop.api.web.service.TerminalService;
import com.zy.dmop.model.vo.TerOrzCusVo;
import com.zy.dmop.web.util.ServiceUtil;

import net.sf.json.JSONObject;

@Component("sendMsg")
public class SendMsg {
	
	private static Logger log = Logger.getLogger(SendMsg.class);
	@Autowired
	private TerminalService terminalService;
	@Autowired
	private AlarmLogService alarmLogService;
	
	public void sendAlarmMsg(String terminalId, String name) {
		List<TerOrzCusVo> listInfo = terminalService.getInfo(terminalId);
		String _number = "";
		String _content = "";
		if(listInfo != null && listInfo.size() > 0 && listInfo.get(0) != null) {
			_content = "尊敬的" + listInfo.get(0).getLinkManName() + 
					"用户，编号为：" + terminalId + "设备" + 
					name + "发生异常，请及时维护，谢谢。";
			_number = listInfo.get(0).getLinkManPhone();
		}
		sendMsg(terminalId, _content, _number);
	}
	
	private void sendMsg(String tID ,String content, String phone) {
		if(content == null || content.length() == 0) {
			log.error("短信内容为空");
			return;
		}
		if(phone == null || phone.length() == 0) {
			log.error("电话号码为空");
			return;
		}
		log.info("_content==" + content);
		JSONObject rev = new JSONObject();
		try {
			//这里暂时使用默认的短信中心号码，即使用null参数，正常应该从配置中读取
			rev = ServiceUtil.sendSMS("/dev/ttyUSB0", phone, content, null);
			if(rev.getBoolean("success")) {			
				log.info("消息发送成功！");
			}else {
				log.error("消息发送失败:"+rev.getString("message"));
			}
		} catch (Exception e1) {
			log.error("消息发送失败！"+e1);
		}
		int count=1;
		try {
			alarmLogService.updateDataNum(count,tID);
		} catch (Exception e) {
			log.error("更新data_num失败！");
		}
	}
	
	public void sendSolveMsg(String terminalId,String name) {
		List<TerOrzCusVo> listInfo = terminalService.getInfo(terminalId);
		String _number = "";
		String _content = "";
		if(listInfo != null && listInfo.size() > 0 && listInfo.get(0) != null) {
			_content = "尊敬的" + listInfo.get(0).getLinkManName() + 
					"用户，编号为：" + terminalId + "设备" + name + 
					"已恢复正常，谢谢使用。";
			_number = listInfo.get(0).getLinkManPhone();
		}
		sendMsg(terminalId, _content, _number);
	}
}
