package com.zy.dmop.api.security.service;

import com.zy.dmop.model.User;

public interface UserService {

	User findByUsername(String username);

}
