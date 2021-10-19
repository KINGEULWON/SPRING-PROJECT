package member.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDaoImpl implements MemberDao{
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public MemberVO infoMember(MemberVO vo) {
		String name = sqlSessionTemplate.selectOne("member.loginCheck", vo);
	}
}
