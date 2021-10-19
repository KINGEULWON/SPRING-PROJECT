package member.service;

import javax.servlet.http.HttpSession;

import member.domain.MemberVO;

public interface MemberService {
	//로그인 체크
	public boolean loginCheck(MemberVO vo, HttpSession session);
	//로그인 정보
	public MemberVO infoMember(MemberVO vo);
	//회원 로그아웃
	public void logout(HttpSession session);
} 
