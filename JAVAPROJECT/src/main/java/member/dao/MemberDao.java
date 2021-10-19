package member.dao;

import javax.servlet.http.HttpSession;

import member.domain.MemberVO;

public interface MemberDao {
	//로그인 체크
	public boolean loginCheck(MemberVO vo);
	//로그인 정보
	public MemberVO infoMember(MemberVO vo);
	//로그아웃
	public void logout(HttpSession session);
}
