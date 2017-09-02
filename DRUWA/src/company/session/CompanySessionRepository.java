package company.session;

import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import company.model.Company;
import company.model.CompanyException;
import hire.model.Hire;

public class CompanySessionRepository {
	//매버 이름 변수로 잡기
	private static CompanySessionRepository instance=null;
	private String namespace="mybaits.mapper.CompanyMapper";
	
	//한번만 생성되기 위해서 static 사용
	public static CompanySessionRepository getInstance(){
		if(instance!=null)
			return instance;
		instance=new CompanySessionRepository();
		return instance;
	}//end of getInstance()

	//마이바티스 연결
	private SqlSessionFactory getSqlSessionFactory(){
		String resource="mybatis-config.xml";
		InputStream inputStream=null;
		try{
			inputStream=Resources.getResourceAsStream(resource);
		}catch(Exception e){
			System.out.println("마이바티스연결 오류(company):"+e.getMessage());
		}
		return new SqlSessionFactoryBuilder().build(inputStream);
	}
	
	//회원등록하기
	public int insert(Company dao)throws CompanyException{
		SqlSession sqlSess=getSqlSessionFactory().openSession();
		try{
			//JDBC: auto-commit 
			//Mybatis: manual-commit 
			int result=sqlSess.insert(namespace+".insertCompany",dao);
			if(result==0)
				sqlSess.rollback();
			else
				sqlSess.commit();
			
			return result;
			
		}finally{
			sqlSess.close();
		}
	}//end of insert
	
	public Company select(String companyId) {
		// getSqlSessionFactory를 이용
		SqlSession sqlSess = getSqlSessionFactory().openSession();
		try {
			return sqlSess.selectOne(namespace + ".viewCompany", companyId);

		} finally {
			sqlSess.close();
		}
	}

	public Company selectByLogin(Company dao){
		System.out.println("2:"+dao.getCompanyId());
		System.out.println("2:"+dao.getCompanyPw());
		//connection 얻어오기
		SqlSession sqlSess=getSqlSessionFactory().openSession();
		try{
			return sqlSess.selectOne(namespace+".loginCompany", dao);
		}finally{
			sqlSess.close();
		}
	}//end of selectByLogin
}
