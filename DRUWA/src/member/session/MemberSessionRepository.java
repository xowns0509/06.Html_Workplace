package member.session;

import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import member.model.Member;
import member.model.MemberException;

public class MemberSessionRepository {
	//매퍼 이름 변수로 잡기
	private static MemberSessionRepository instance=null;
	private String namespace="mybaits.mapper.MemberMapper";
	
	public static MemberSessionRepository getInstance(){
		if(instance!=null)
			return instance;
		instance=new MemberSessionRepository();
		return instance;
	}//end of getInstance()
	
	private SqlSessionFactory getSqlSessionFactory(){
		String resource="mybatis-config.xml";
		InputStream inputStream=null;
		try{
			inputStream=Resources.getResourceAsStream(resource);
		}catch(Exception e){
			System.out.println("마이바티즈(mybatis-config.xml) 실행 실패: "+e.getMessage());
		}
		return new SqlSessionFactoryBuilder().build(inputStream);
	}//end of sqlSession Factory
	
	//회원 등록하기
	public int insert(Member dao) throws MemberException{
		//connection얻어오기
		SqlSession sqlSess=getSqlSessionFactory().openSession();
		
		try{
			//JDBC: auto-commit 
			//Mybatis: manual-commit 
			int result=sqlSess.insert(namespace+".insertMember",dao);
			if(result==0)
				sqlSess.rollback();
			else
				sqlSess.commit();
			
			return result;
			
		}finally{
			sqlSess.close();
		}
	}//end of insert
	
	//로그인 확인
	public Member selectLogin(Member dao){
		//connection 얻어오기
		SqlSession sqlSess=getSqlSessionFactory().openSession();
		try{
			return sqlSess.selectOne(namespace+".loginMember",dao);
		}finally{
			sqlSess.close();
		}
	}//end of selectLogin
	

}
