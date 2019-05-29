package com.a409.maodumall.web.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.a409.maodumall.web.pojo.UserInfo;

/**
 * 用户操作持久层
 * @author Administrator
 *
 */
@Mapper
public interface UserInfoMapper {
	
	//查询所有用户
	@Select("select * from user_info")
	List<UserInfo> findAll();
	
	//插入用户
	@Insert("insert into user_info(username,password) value(#{userName},#{password})")
	public int save(UserInfo userInfo);
	
	//删除用户
	@Delete("delete from user_info where uid = #{uid}")
	public int delete(int uid);
	
	//根据用户id寻找用户
	@Select("select * from user_info where uid = #{uid}")
	public UserInfo get(int uid);
	
	//更改用户
	@Update("update user_info set username = #{userName} where uid = #{uid}")
	public int update(UserInfo userInfo);
}
	
	
	
	
	
	
	
	
	
	
	
	
	
	 
