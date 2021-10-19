package member.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import member.dao.MemberDao;
import member.domain.MemberVO;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	MemberDao memberDao;
	
	//로그인 정보
		@Override
		public MemberVO infoMember(MemberVO vo) {
			return memberDao.infoMember(vo);
		}
		
	//로그인 체크
	@Override
	public boolean loginCheck(MemberVO vo, HttpSession session) {
		boolean result = memberDao.loginCheck(vo);
		if(result) { //true면 세션 등록
			MemberVO vo2 = infoMember(vo);
			session.setAttribute("memberNum", vo2.getMemberNum());
			session.setAttribute("id", vo2.getId());
			session.setAttribute("name", vo2.getName());
		}
		return result;
	}
	
	@Override
	public void logout(HttpSession session) {
		session.invalidate();
	}
}
