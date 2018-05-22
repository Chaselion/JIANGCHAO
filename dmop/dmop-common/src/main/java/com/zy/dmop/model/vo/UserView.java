package com.zy.dmop.model.vo;

import java.util.Date;

import com.zy.dmop.model.User;

public class UserView {
	
	private OrganizationView organization;
	
	public UserView(User user) {
		this.user = user;
	}

	private User user;
	
	public String getUsername() {
        return user.getUsername();
    }
	public Integer getPermissionGroupId() {
        return user.getPermissionGroupId();
    }

    public String getPassword() {
        return user.getPassword();
    }

    public int getId() {
        return user.getUserId();
    }

    public long getOrganizationId() {
        return user.getOrganizationId();
    }

    public Date getCreatTime() {
        return user.getRegisterDateTime();
    }
    public Date getModifyTime() {
        return user.getModifyDateTime();
    }
	public String getRealname() {
		return user.getRealname();
	}
	public String getNote() {
		return user.getNote();
	}
	public int getAlarmLevelId() {
		return user.getAlarmLevelId();
	}

	public String getMobilePhone() {
		return user.getMobilePhone();
	}
	
	public String getEmail() {
		return user.getEmail();
	}
	
	public int getStatus() {
		return user.getState();
	}
	
	public String getOrganizationPath() {
		StringBuilder orgPath = new StringBuilder();
		OrganizationView org = organization;
		while (org != null) {
			
			orgPath.insert(0, " / " + org.getName());
			
//			opv.addFirst(org.getName(), "/organization/" + org.getId());
			
			org = org.getParent();
		}
		
		return orgPath.toString();
	}

	public void setOrganization(OrganizationView organization) {
		this.organization = organization;
	}
	
//	public OrganizationPathView getOrganizationPath() {
//		OrganizationPathView  opv = new OrganizationPathView();
//		Organization org = user.getOrganization();
//		while (org != null) {
//			opv.addFirst(org.getName(), "/organization/" + org.getId());
//			
//			org = org.getParent();
//		}
//		
//		return opv;
//	}


	public String getOrganizationName() {
		return organization.getName();
	}
}
