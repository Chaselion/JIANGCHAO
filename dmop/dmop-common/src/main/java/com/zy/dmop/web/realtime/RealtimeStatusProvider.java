package com.zy.dmop.web.realtime;

import java.util.List;
import java.util.Set;

import com.zy.dmop.model.StatusCounter;
import com.zy.dmop.model.User;



public interface RealtimeStatusProvider {
	List<StatusCounter> fetchCurrent(User loginUser, Set<Integer> statusCodes);
}
