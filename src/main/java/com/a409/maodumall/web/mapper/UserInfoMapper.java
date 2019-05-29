package com.a409.maodumall.web.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.a409.maodumall.web.pojo.UserInfo;

@Mapper
public interface UserInfoMapper {
	
	@Select("select * from user_info")
	List<UserInfo> findAll();
}
	
	
	
	
	
	
	
	
	
	
	
	
	
	 
