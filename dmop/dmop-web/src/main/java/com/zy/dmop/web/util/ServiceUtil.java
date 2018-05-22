package com.zy.dmop.web.util;

import com.czwlyk.util.sms.test.SerialTool;

import net.sf.json.JSONObject;

public class ServiceUtil {
	
	public static void main(String[] args) {
		sendSMS("COM1", "18201215592", "您好", null);
	}
	
	private static int splitLen = 63;
	private static int retryTimes = 3;
	
	/**
	 * 
	 * @param com 串口
	 * @param phone 接收手机号，多个用;链接
	 * @param content 内容，超过63会被切分成多个短信
	 * @param center 中心号码，传null默认使用8613800519500，常州中心号码
	 * @return {success:false,ture只有全部成功才会返回true,部分成功同样会返回false。
	 * 			message:成功时返回“success”，失败时返回错误说明}
	 */
	public static JSONObject sendSMS(String com, String phone, String content, String center){
		JSONObject jo = new JSONObject();
		jo.put("success", false);
		if(com == null || com.length() == 0) {
			jo.put("message", "串口不可为空");
			return jo;
		}
		if(phone == null || phone.length() == 0) {
			jo.put("message", "接收电话不可为空");
			return jo;
		}
		StringBuffer sb = new StringBuffer();
		if(content != null && content.length() > 0) {
			//短信拆分
			int rLen = content.length();
			int loop = 1;
			int temp = (int)(Math.ceil(rLen / (splitLen + 0.0d)));
			if(temp > 0){
				loop = temp;
			}
			sb.append("短信总长");
			sb.append(rLen);
			sb.append(",共拆分为");
			sb.append(loop);
			sb.append("条发送:");
			int failNum = 0;
			for (int i = 1; i <= loop; i++) {
				int start = (i - 1) * splitLen;
				int end = i * splitLen;
				if(end > rLen){
					end = rLen;
				}
				String index = content.substring(start,end);
				sb.append("第" + i + "条,内容=" + index);
				int count = 0;
				boolean iRetrySuccess = false;
				for (count = 0; count < retryTimes; count++) {
					String revt = SerialTool.sendMsg(com, phone, index, center, 0, 0, 0);
					sb.append(",第" + (count + 1) + "次发送结果=" + revt);
					iRetrySuccess = "success".equals(revt); 
					if(iRetrySuccess){
						break;
					}
				}
				if(!iRetrySuccess) {
					failNum ++;
				}
			}
			//全部成功才返回ture和success
			if(failNum > 0) {
				jo.put("message", sb.toString());
			}else {
				jo.put("message", "success");
				jo.put("success", true);
			}
		}else {
			jo.put("message", "内容不可为空");
			return jo;
		}
		return jo;
	}
}
