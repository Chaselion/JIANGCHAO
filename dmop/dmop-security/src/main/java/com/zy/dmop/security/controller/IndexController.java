package com.zy.dmop.security.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.zy.dmop.api.security.service.UserPermissionService;
import com.zy.dmop.api.security.util.SessionUtil;
import com.zy.dmop.model.Permission;
import com.zy.dmop.model.vo.PermissionVo;
import com.zy.dmop.model.vo.SplitedPermissionVo;
import com.zy.dmop.util.StringUtil;

@Controller
@RequestMapping("/index")
public class IndexController {
	private final static String[] COLORS = new String[]{"#252525","#f4b300","#78ba00","#2673ec","#ae113d","#632f00","#2e1700","#b01e00","#4e0000","#4e0038","#c1004f","#7200ac","#2d004e","#4617b4","#1f0068","#006ac1","#001e4e","#008287","#004d60","#199900","#004a00","#00c13f","#15992a","#ff981d","#e56c19","#ff2e12","#b81b1b","#ff1d77","#b81b6c","#aa40ff","#691bb8","#1faeff","#1b58b8","#56c5ff","#569ce3","#00d8cc","#00aaaa","#91d100","#b81b6c","#e1b700","#d39d09","#ff76bc","#e064b7","#00a4a4","#ff7d23","#696969"};
	private final static String INDEX ="NewFile1" ;
	private final static String WIN_10 ="first_page" ;
	@Autowired
	private UserPermissionService userPermissionService;

	@RequestMapping(value = "", method = RequestMethod.GET)
	public String index(ServletRequest request, Map<String, Object> map) {
		Subject subject = SecurityUtils.getSubject();
		List<PermissionVo> list = userPermissionService.getModuleTree();
		if(subject.isAuthenticated()){
			
			list = filterNotPermitted(list, subject);
		}
		//鍒嗗壊鎴恮in8椋庢牸
		List<SplitedPermissionVo> splitedlist=  new ArrayList<SplitedPermissionVo>();
		for(PermissionVo vo :list){
			List<PermissionVo> children = vo.getChildren();
			int blocks = 0;
			for(int i = 0;i<children.size();i++){
				if(isFat(children.get(i))){
					blocks+=2;
				}
				if(isTall(children.get(i))){
					blocks+=2;
				}
				if(isNormal(children.get(i))){
					blocks++;
				}
			}
			//鍧楅櫎浠ヤ笁鍙栨暣
			int row = (int) Math.ceil((double)blocks/3);
			List<SplitedPermissionVo[]> spliteList = new ArrayList<SplitedPermissionVo[]>();
			for(int i = 0;i<row;i++){
				spliteList.add(new SplitedPermissionVo[3]);
			}
			for(PermissionVo child:children){
				for(int i = 0;i<spliteList.size();i++){
					//濡傛灉褰撳墠鏁扮粍涓嶆弧
					if(!isArrayFull(spliteList.get(i))){				
						//濡傛灉鏄崰涓よ鐨勶紝鍔犵殑鏃跺�欏鍔犱竴涓亣鐨勶紝鍦╦sp涓垽鏂�
						if(isFat(child)){
							push(spliteList.get(i),new PermissionVo(),null,null);
							push(spliteList.get(i), child,true,false);
							break;
						}
						if(isTall(child)){
					//濡傛灉鏄崰涓ゅ垪鐨勶紝鍑忓皬涓嬩竴琛岀殑鏁扮粍鐨勯暱搴�
							int nextLength = spliteList.get(i+1).length-1;
							SplitedPermissionVo[] next = new SplitedPermissionVo[nextLength];
							spliteList.set(i+1, next);
							push(spliteList.get(i), child,false,true);
							break;
						}
						push(spliteList.get(i), child,false,false);
						break;
					}
				}
			}
			
			filterNull(spliteList);
			SplitedPermissionVo splitedPermissionVo = new SplitedPermissionVo(vo.getId(), vo.getIconcls(), vo.getText(), vo.getUrl(), spliteList,null,null,null);
			splitedlist.add(splitedPermissionVo);
		}
		
		map.put("login_user", SessionUtil.getCommonUserFromSession());
		map.put("menuModule", splitedlist);
		
		if(HttpRequestDeviceUtil.isMobileDevice((HttpServletRequest)request)){
			return "mobile/index";
		}
		return INDEX;
	}
	@RequestMapping(value = "/win10", method = RequestMethod.GET)
	public String index(ServletRequest request,ServletResponse response, Map<String, Object> map) {
		Subject subject = SecurityUtils.getSubject();
		List<PermissionVo> list = userPermissionService.getModuleTree();
		if(subject.isAuthenticated()){
			
			list = filterNotPermitted(list, subject);
		}
		//鍒嗗壊鎴恮in8椋庢牸
		List<SplitedPermissionVo> splitedlist=  new ArrayList<SplitedPermissionVo>();
		for(PermissionVo vo :list){
			List<PermissionVo> children = vo.getChildren();
			int blocks = 0;
			for(int i = 0;i<children.size();i++){
				if(isFat(children.get(i))){
					blocks+=2;
				}
				if(isTall(children.get(i))){
					blocks+=2;
				}
				if(isNormal(children.get(i))){
					blocks++;
				}
			}
			//鍧楅櫎浠ヤ笁鍙栨暣
			int row = (int) Math.ceil((double)blocks/3);
			List<SplitedPermissionVo[]> spliteList = new ArrayList<SplitedPermissionVo[]>();
			for(int i = 0;i<row;i++){
				spliteList.add(new SplitedPermissionVo[3]);
			}
			for(PermissionVo child:children){
				for(int i = 0;i<spliteList.size();i++){
					//濡傛灉褰撳墠鏁扮粍涓嶆弧
					if(!isArrayFull(spliteList.get(i))){				
						//濡傛灉鏄崰涓よ鐨勶紝鍔犵殑鏃跺�欏鍔犱竴涓亣鐨勶紝鍦╦sp涓垽鏂�
						if(isFat(child)){
							push(spliteList.get(i),new PermissionVo(),null,null);
							push(spliteList.get(i), child,true,false);
							break;
						}
						if(isTall(child)){
							//濡傛灉鏄崰涓ゅ垪鐨勶紝鍑忓皬涓嬩竴琛岀殑鏁扮粍鐨勯暱搴�
							int nextLength = spliteList.get(i+1).length-1;
							SplitedPermissionVo[] next = new SplitedPermissionVo[nextLength];
							spliteList.set(i+1, next);
							push(spliteList.get(i), child,false,true);
							break;
						}
						push(spliteList.get(i), child,false,false);
						break;
					}
				}
			}
			
			filterNull(spliteList);
			SplitedPermissionVo splitedPermissionVo = new SplitedPermissionVo(vo.getId(), vo.getIconcls(), vo.getText(), vo.getUrl(), spliteList,null,null,null);
			splitedlist.add(splitedPermissionVo);
		}
		
		map.put("login_user", SessionUtil.getCommonUserFromSession());
		map.put("menuModule", splitedlist);
		
		if(HttpRequestDeviceUtil.isMobileDevice((HttpServletRequest)request)){
			return "mobile/index";
		}
		return WIN_10;
	}

	private List<PermissionVo> filterNotPermitted(List<PermissionVo> rootModules, Subject subject) {
		List<PermissionVo> permitted = new ArrayList<PermissionVo>();

		for (PermissionVo vo : rootModules) {
			// 鍙姞鍏ユ嫢鏈塻how鏉冮檺鐨凪odule
			String showPermission = vo.generatePermission("show");
			if (subject.isPermitted(vo.generatePermission("show"))) {
				List<PermissionVo> permittedChildren = filterNotPermitted(vo.getChildren(), subject);

				vo.setChildren(permittedChildren);
				permitted.add(vo);
			}
		}
		return permitted;
	}
	
	private boolean isTall(PermissionVo vo){
		String style = vo.getIconcls();
		if(style.indexOf("winTall")>=0){
			return true;
		}
		return false;
	}
	private boolean isFat(PermissionVo vo){
		String style = vo.getIconcls();
		if(style.indexOf("winFat")>=0){
			return true;
		}
		return false;
	}
	private boolean isNormal(PermissionVo vo){
		String style = vo.getIconcls();
		if(style.indexOf("winTall")<0&&style.indexOf("winFat")<0){
			return true;
		}
		return false;
	}
	private boolean isArrayFull(SplitedPermissionVo[] row){
		
		SplitedPermissionVo testFull = row[row.length-1];
		if(null!=testFull){
			return true;
		}
		return false;
	}
	/**
	 * 
	 * @param row  瑕佹彃鍏ョ殑鏁扮粍
	 * @param vo   鎻掑叆鐨勬暟鎹簮
	 * @param fatFlag  鏄笉鏄儢鏍囩
	 * @param tallFlag  鏄笉鏄珮鏍囩
	 */
	private void push(SplitedPermissionVo[] row,PermissionVo vo,Boolean fatFlag,Boolean tallFlag){
		for(int i = 0;i<row.length;i++){
			if(null==row[i]){
			//   fa fa-camera-retro fa-5x  winTall 2 #ffffff
				//	棰滆壊鏈変竷浣嶏紝鍦ㄦ湯灏撅紝鎶婂畠鎴彇鍑烘潵
				String color = null;
				if(!StringUtil.isNullOrEmpty(vo.getIconcls())){
					
					String icon = vo.getIconcls();
					color = icon.substring(icon.length()-8, icon.length());
				}
				row[i]=new SplitedPermissionVo(vo.getId(), vo.getIconcls(), vo.getText(), vo.getUrl(), null, color,fatFlag,tallFlag);
				return;
			}
		}
		//鐢变簬涓婇潰鍒ゆ柇浜嗘暟缁勬槸鍚︽弧锛屾墍浠ヤ笅鍒楁儏鍐靛嚭鐜板湪鏈�鍚庝竴浣嶆彃鑳栨爣绛剧殑鎯呭喌銆傜畝鍗曠殑鎶婅儢鏍囩鍙樹负鏅�氭爣绛�
		row[row.length-1]=new SplitedPermissionVo(vo.getId(), vo.getIconcls(), vo.getText(), vo.getUrl(), null, generateColor(COLORS.length-1),false,false);
	}
	
	private String generateColor(int i){
		int min =  0;
		int max = COLORS.length-1;
//		int colorcode = (int) (Math.random()*(max-min+1)+min);
//		return COLORS[colorcode];
		return COLORS[max-i];
			
	}
	
	private void filterNull(List<SplitedPermissionVo[]> spliteList){
		for(int i = 0;i<spliteList.size();i++){
			int count =0;
			for(SplitedPermissionVo vo:spliteList.get(i)){
				if(null!=vo){
					count++;
				}
			}
			if(count==0){
				spliteList.remove(i);
			}
		}
	}
}
