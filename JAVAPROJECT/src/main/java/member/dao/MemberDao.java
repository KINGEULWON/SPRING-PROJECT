package member.dao;

import member.domain.MemberVO;

public interface MemberDao {
	
	//회원가입
	public void register(MemberVO vo) throws Exception;
}
