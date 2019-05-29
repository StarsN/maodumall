package com.a409.maodumall.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.a409.maodumall.web.mapper.UserInfoMapper;
import com.a409.maodumall.web.pojo.UserInfo;

@Controller
public class UserInfoController {

	@Autowired
	private UserInfoMapper userInfoMapper;
	
	@RequestMapping("/listUserInfo")
	public String listUserInfo(Model m) {
		List<UserInfo> us = userInfoMapper.findAll();
		m.addAttribute("us", us);
		return "listUserInfo";
	}
}
