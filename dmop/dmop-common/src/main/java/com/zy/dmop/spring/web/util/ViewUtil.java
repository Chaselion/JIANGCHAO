package com.zy.dmop.spring.web.util;

import java.util.ArrayList;
import java.util.List;

import com.zy.dmop.model.User;
import com.zy.dmop.model.vo.OrganizationView;
import com.zy.dmop.model.vo.UserView;

public class ViewUtil {
	public static List<UserView> convertToUserViews(List<User> users, List<OrganizationView> orgTrees) {
    	List<UserView> userViews = new ArrayList<UserView>();
    	
    	for (User user : users) {
    		UserView userView = new UserView(user);
    		
			int orgId = user.getOrganizationId();
			OrganizationView orgOfUser = findInTree(orgTrees, orgId);
			userView.setOrganization(orgOfUser);
			
			userViews.add(userView);
		}
    	
    	return userViews;
    }
	
	private static OrganizationView findInTree(List<OrganizationView> orgTrees, int orgId) {
		for (OrganizationView orgView : orgTrees) {
			if (orgView.getOrganizationId() == orgId) {
				return orgView;
			} else {
				OrganizationView resultOfChild = findInTree(orgView.getChildren(), orgId);
				if (resultOfChild != null) {
					return resultOfChild;
				}
			}
		}
		
		return null;
	}
}
