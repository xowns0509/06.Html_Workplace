package learn.session;

import java.io.InputStream;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import learn.model.Learn;

public class LearnSessionRepository {
	//매퍼 이름을 변수로 잡기
	private static LearnSessionRepository instance=null;
	private String namespace="mybaits.mapper.LearnMapper"; 

	public static LearnSessionRepository getInstance(){
		if(instance!=null)
			return instance;
		instance=new LearnSessionRepository();
		return instance;
	}


	private SqlSessionFactory getSqlSessionFactory(){
		//SqlSession(Mybatis) = Connection (JDBC)
		String resource="mybatis-config.xml";
		InputStream inputStream=null;
		try{
			inputStream=Resources.getResourceAsStream(resource);
		}catch(Exception e){
			System.out.println("마이바티즈(mybatis-config.xml) 실행 실패: "+e.getMessage());
		}
		return new SqlSessionFactoryBuilder().build(inputStream);
	}//end of sqlSession Factory

	//목록 보여주기
	public List<Learn> select(){
		//connetion 얻어옴
		//.openSession() 을 통해서 mybatis는 connection POOL을 사용하고 있다는 것을 알 수 있음
		SqlSession sqlSess=getSqlSessionFactory().openSession();
		try{
			return sqlSess.selectList(namespace+".listComment");
		}finally{
			sqlSess.close();
		}
	}//end of select

	//모두의 글쓰기
	public int insert(Learn dao){
		//connection 얻어오기
		SqlSession sqlSess=getSqlSessionFactory().openSession();
		try{
			//JDBC: auto-commit 
			//Mybatis: manual-commit 
			int result=sqlSess.insert(namespace+".insertComment",dao);
			if(result==0)
				sqlSess.rollback();
			else
				sqlSess.commit();

			return result;
		}finally{
			sqlSess.close();
		}
	}//end of insert

	public int increaseCount(int leNum){
		//conection 얻어오기
		SqlSession sqlSess=getSqlSessionFactory().openSession();
		try{
			int result=sqlSess.update(namespace+".increaseCount",leNum);
			if(result==0)
				sqlSess.rollback();
			else
				sqlSess.commit();

			return result;

		}finally{
			sqlSess.close();
		}

	}

	//모두의 글 상세보기
	public Learn selctById(int ln){
		//connection 얻어오기
		SqlSession sqlSess=getSqlSessionFactory().openSession();
		try{
			return sqlSess.selectOne(namespace+".viewComment",ln);

		}finally{
			sqlSess.close();
		}
	}//end of selectById


	//모두의 글 비밀번호를 일치 여부 후 상세보기
	public Learn selctByPass(Learn dao){
		//connection 얻어오기
		SqlSession sqlSess=getSqlSessionFactory().openSession();
		try{
			return sqlSess.selectOne(namespace+".viewPassComment",dao);

		}finally{
			sqlSess.close();
		}
	}//end of selectById


	//게시글 수정
	public Integer modify(Learn dao){
		//connection 얻어오기
		SqlSession sqlSess=getSqlSessionFactory().openSession();
		try{
			int result=sqlSess.update(namespace+".updateComment", dao);
			if(result==0)
				sqlSess.rollback();
			else
				sqlSess.commit();

			return result;
		}finally{
			sqlSess.close();
		}
	}

	//게시글 삭제
	public Integer delete(Learn dao){
		//connection 얻어오기
		SqlSession sqlSess=getSqlSessionFactory().openSession();
		try{
			int result=sqlSess.delete(namespace+".deleteComment", dao);
			if(result==0)
				sqlSess.rollback();
			else
				sqlSess.commit();

			return result;
		}finally{
			sqlSess.close();
		}
	}


	public List<Learn> selectLearn(String id) {
		//connetion 얻어옴
		//.openSession() 을 통해서 mybatis는 connection POOL을 사용하고 있다는 것을 알 수 있음
		SqlSession sqlSess=getSqlSessionFactory().openSession();
		try{
			return sqlSess.selectList(namespace+".listMainView");
		}finally{
			sqlSess.close();
		}
	}
}
