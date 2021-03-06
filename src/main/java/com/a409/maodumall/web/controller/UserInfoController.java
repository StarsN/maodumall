package com.a409.maodumall.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.a409.maodumall.web.mapper.UserInfoMapper;
import com.a409.maodumall.web.pojo.UserInfo;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

/**
 * 用户处理器
 * @author Administrator
 *
 */
@Controller
public class UserInfoController {

	@Autowired
	private UserInfoMapper userInfoMapper;
	
	//查询所有用户
	@RequestMapping("/listUserInfo")
	public String listUserInfo(Model m,@RequestParam(value="start",defaultValue="0")int start,@RequestParam(value="size",defaultValue="5")int size) {
		//在参数接收当前是第几页start,以及每页显示多少条数据size，默认值
		//根据start,size,并设置uid倒序排序
		//注意！！！这里uid对应数据库里的uid
		PageHelper.startPage(start,size,"uid desc");
		//因为PageHelper作用，这里会返回当前分页集合
		List<UserInfo> us = userInfoMapper.findAll();
		//根据返回集合，创建PageInfo对象
		PageInfo<UserInfo> page = new PageInfo<>(us);
		//把PageInfo对象扔进model
		m.addAttribute("page",page);
		//跳转到listUserInfo.jsp
		return "listUserInfo";
	}
	
	//增加用户
	@RequestMapping("/addUserInfo")
	public String addUserInfo(UserInfo userInfo) {
		userInfoMapper.save(userInfo);
		return "redirect:listUserInfo";
	}
	//删除用户
	@RequestMapping("/deleteUserInfo")
	public String deleteUserInfo(UserInfo userInfo) {
		int uid = userInfo.getUid();
		userInfoMapper.delete(uid);
		return "redirect:listUserInfo";
	}
	//更新用户
	@RequestMapping("/updateUserInfo")
	public String updateUserInfo(UserInfo userInfo) {
		userInfoMapper.update(userInfo);
		return "redirect:listUserInfo";
	}
	//编辑用户
	@RequestMapping("/editUserInfo")
	public String editUserInfo(int uid,Model m) {
		UserInfo u = userInfoMapper.get(uid);
		m.addAttribute("u", u);
		return "editUserInfo";
	}
	
	//登录页面跳转
	@RequestMapping("/preLogin")
	public String preLogin() {
		return "login";
	}
	//简单登录
	@ResponseBody
	@RequestMapping("/userLogin")
	public String login(UserInfo userInfo) {
		//如果userInfo不为空
		if(userInfo != null && userInfo.getUserName() != null) {
			//根据输入名字查找数据库
			UserInfo dbUserInfo = userInfoMapper.getByUserName(userInfo.getUserName());
			//得到数据库中用户的密码
			String dbpassword = dbUserInfo.getPassword();
			//如果输入密码与数据库中的密码一致，显示登录成功
			if(userInfo.getPassword().equals(dbpassword)) {
				return "登录成功";
			}
			return "登录失败";
		}
		return "登录失败";
	}
	
	//跳转注册页面
	@RequestMapping("/preRegister")
	public String preRegister() {
		return "register";
	}
	//简单注册
	@ResponseBody
	@RequestMapping("/userRegister")
	public String register(UserInfo userInfo) {
		//判断用户不为空，用户名不为空
		if(userInfo != null && userInfo.getUserName() != null) {
			//根据用户名查找数据库
			UserInfo dbUserInfo = userInfoMapper.getByUserName(userInfo.getUserName());
			//用户存在，显示注册失败
			if(dbUserInfo != null) {
				return "注册失败";
			}
			userInfoMapper.save(userInfo);
			System.out.println("注册成功\n  userName:" + userInfo.getUserName() + ", password:" + userInfo.getPassword());
			return "注册成功";
		}
		//否则，显示注册失败
		return "注册失败";
	}
}
