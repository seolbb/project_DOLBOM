package com.bc.model.command.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bc.model.dao.member.MemberDAO;
import com.bc.model.vo.member.MemberVO;

public class MypInfoCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		MemberVO vo = null;
		if(session == null) {
			System.out.println("session값이 없습니다.");
		} else {
			String userId = (String)session.getAttribute("userId");
			vo = MemberDAO.infoView(userId);
		}
		
		session.setAttribute("vo", vo);
		
		return "mypInfo.jsp";
	}

}
