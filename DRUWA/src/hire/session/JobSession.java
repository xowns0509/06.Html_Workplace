//Repository 에 해당하는 놈
package hire.session;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import hire.model.Job;

public class JobSession {

	// 연결할 mapper이름을 변수로.
	String namespace = "mybatis.mapper.HireMapper";

	private SqlSessionFactory getSqlSessionFactory() {
		// Sql 세션이 필요? - 세션 = 커넥트
		// SqlSession(마이바티즈의...) == Connection(JDBC)
		String resource = "mybatis-config.xml";

		InputStream inputStream = null;
		try {
			inputStream = Resources.getResourceAsStream(resource);
		} catch (Exception ex) {
			System.out.println("mybatis-config.xml 읽어서 실행 실패: " + ex.getMessage());
		}
		return new SqlSessionFactoryBuilder().build(inputStream);
	}

	/**
	 * 모든 Job 갖고 오는거
	 * @param cId
	 * @return
	 */
	public List<Job> select(){
		// getSqlSessionFactory를 이용
		SqlSession sqlSess = getSqlSessionFactory().openSession();
		try {
			return sqlSess.selectList(namespace + ".listJob" );

		} finally {
			sqlSess.close();
		}
	}

	/**
	 * 하나의 Job 갖고 오는거
	 * @param cId
	 * @return
	 */
	public Job select(String jobName) {
		// getSqlSessionFactory를 이용
		SqlSession sqlSess = getSqlSessionFactory().openSession();
		try {
			return sqlSess.selectOne(namespace + ".viewJob", jobName);

		} finally {
			sqlSess.close();
		}
	}


}
