package com.practice.bbs.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.practice.bbs.model.BbsDAO;
import com.practice.bbs.model.BbsVO;

public class GetListServiceImpl implements BbsService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		BbsDAO dao = BbsDAO.getInstance();
		ArrayList<BbsVO> list = dao.getList();
		
		request.setAttribute("list", list);
	}

}
