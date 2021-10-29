package member.service;


import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import member.dao.MemberDao;
import member.domain.MemberVO;

@Service
public class MemberServiceImpl implements MemberService{
	

	@Autowired
	MemberDao memberDao;
	
	//회원가입
	@Override
	public void register(MemberVO vo) throws Exception{
		memberDao.register(vo);
	}
	//로그인
	@Override
	public MemberVO login(MemberVO vo) throws Exception{
		return memberDao.login(vo);
	}
	//정보 수정
	@Override
	public void memberUpdate(MemberVO vo) throws Exception{
		memberDao.memberUpdate(vo);
	}
	//회원 탈퇴
	@Override
	public void memberDelete(MemberVO vo) throws Exception{
		memberDao.memberDelete(vo);
	}
	//아이디 체크
	@Override
	public int idChk(MemberVO vo) throws Exception{
		int result = memberDao.idChk(vo);
		return result;
	}
	//비번 체크
	@Override
	public int pwChk(MemberVO vo) throws Exception{
		int result = memberDao.pwChk(vo);
		return result;
	}
	//아이디 찾기
	@Override 
	public MemberVO findId(MemberVO vo) throws Exception{
		return memberDao.findId(vo);
	}

}
