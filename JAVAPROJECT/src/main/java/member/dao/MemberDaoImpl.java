package member.dao;



import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import member.domain.MemberVO;

@Repository
public class MemberDaoImpl implements MemberDao{
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	//회원 가입
	@Override
	public void register(MemberVO vo) throws Exception{
		sqlSessionTemplate.insert("/member/register", vo);
	}
	
	
}
