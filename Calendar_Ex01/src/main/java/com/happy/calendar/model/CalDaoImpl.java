package com.happy.calendar.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;


import com.happy.calendar.dtos.CalDto;


public class CalDaoImpl{

private final String NS = "com.happy.calendar.";
		
	public SqlSessionTemplate sqlSession;
		
	public List<CalDto> selectAllCal() {
		//System.out.println("빈이 미치게 합니다 -_-"+sqlSession);
		List<CalDto> list = sqlSession.selectList(NS+"selectAllCal");		
		return list;
	}
}
