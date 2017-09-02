package algo.session;

import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import algo.model.Algo;
import learn.model.Learn;
import learn.session.LearnSessionRepository;

public class AlgoSessionRepository {

	private static AlgoSessionRepository instance=null;
	private String namespace="mybaits.mapper.AlgoMapper"; 

	public static AlgoSessionRepository getInstance(){
		if(instance!=null)
			return instance;
		instance=new AlgoSessionRepository();
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

	//모두의 글쓰기
	public int insert(Algo dao){
		//connection 얻어오기
		SqlSession sqlSess=getSqlSessionFactory().openSession();
		try{

			int result=sqlSess.insert(namespace+".insertAlgo",dao);
			if(result==0)
				sqlSess.rollback();
			else
				sqlSess.commit();

			return result;
		}finally{
			sqlSess.close();
		}
	}//end of insert


}
