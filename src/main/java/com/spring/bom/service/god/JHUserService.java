package com.spring.bom.service.god;

import java.util.List;

import com.spring.bom.model.god.JHBoard;
import com.spring.bom.model.god.JHUser_info;

public interface JHUserService {

	String getReserveNum(int ucode);

	List<JHBoard> getReserveList(int ucode);

	List<JHBoard> getSaveList(int ucode);

	String getSaveNum(int ucode);

	List<JHUser_info> getFollowerList(int bcode);

	List<JHUser_info> getSearchList(String search_value);
	
}
