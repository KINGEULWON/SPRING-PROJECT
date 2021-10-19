package member.dao;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import member.domain.MemberVO;

@Repository
public class MemberDaoImpl implements MemberDao{
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	//로그인 정보
	@Override
	public MemberVO infoMember(MemberVO vo) {
		return sqlSessionTemplate.selectOne("member.infoMember", vo);  
	}
	
	//로그 아웃
	@Override
	public void logout(HttpSession session) {
	}
	
	//로그인체크
	@Override
	public boolean loginCheck(MemberVO vo) {
		String name = sqlSessionTemplate.selectOne("member.loginCheck", vo);
		return (name == null) ? false : true;
	}
}
