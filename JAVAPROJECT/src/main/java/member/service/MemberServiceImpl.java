package member.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import member.dao.MemberDao;
import member.domain.MemberVO;

@Service
public class MemberServiceImpl implements MemberService{
	

	@Autowired
	MemberDao memberDao;
	

	@Override
	public void register(MemberVO vo) throws Exception{
		memberDao.register(vo);
	}
	
	@Override
	public MemberVO login(MemberVO vo) throws Exception{
		return memberDao.login(vo);
	}
	
	@Override
	public void memberUpdate(MemberVO vo) throws Exception{
		memberDao.memberUpdate(vo);
	}
	
	@Override
	public void memberDelete(MemberVO vo) throws Exception{
		memberDao.memberDelete(vo);
	}
	
	@Override
	public int idChk(MemberVO vo) throws Exception{
		int result = memberDao.idChk(vo);
		return result;
	}
	
	@Override
	public int pwChk(MemberVO vo) throws Exception{
		int result = memberDao.pwChk(vo);
		return result;
	}
	
	@Override 
	public MemberVO findId(MemberVO vo) throws Exception{
		return memberDao.findId(vo);
	}
}
