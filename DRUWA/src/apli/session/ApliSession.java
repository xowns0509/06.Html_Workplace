//Repository 에 해당하는 놈
package apli.session;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import apli.model.Apli;
import apli.model.ApliName;
import hire.model.Hire;

public class ApliSession {

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
	 * 공고 별 지원자 정보 갖고 오는 거.
	 * 
	 * @param cId
	 * @return
	 */
	public List<ApliName> select(int hireNum) {
		// getSqlSessionFactory를 이용
		SqlSession sqlSess = getSqlSessionFactory().openSession();
		try {
			return sqlSess.selectList(namespace + ".listApliNameByHireNum", hireNum);

		} finally {
			sqlSess.close();
		}
	}

	/**
	 * 공고 1개 갖고 오는거
	 * 
	 * @param cId
	 * @return
	 */
	// 연결객체를 얻고 싶다면 "Select" 하는 태그를 호출
	public Hire Select(int hireNum) {
		// getSqlSessionFactory를 이용
		SqlSession sqlSess = getSqlSessionFactory().openSession();
		try {
			return sqlSess.selectOne(namespace + ".viewHire", hireNum);

		} finally {
			sqlSess.close();
		}
	}

	// 입력하기 위한 VO객체를 받아 insert 태그 호출
	public Integer insert(Apli c) {

		// 커넥션 필요
		SqlSession sqlSess = getSqlSessionFactory().openSession();

		try {
			int result = sqlSess.insert(namespace + ".insertApli", c);
			// jdbc: auto-Commit;
			// mybatis는 auto-commit이 아니므로.... 커밋 해줘야 함.

			if (result == 0) {// 리절트가 0이면 입력 실패이므로 롤백
				sqlSess.rollback();

			} else {
				sqlSess.commit();
			}

			return result;
		} finally {
			sqlSess.close();
		}
	}

	// 입력하기 위한 VO객체를 받아 insert 태그 호출
	public Integer delete(Apli c) {

		// 커넥션 필요
		SqlSession sqlSess = getSqlSessionFactory().openSession();

		try {
			int result = sqlSess.delete(namespace + ".deleteHire", c);
			// jdbc: auto-Commit;
			// mybatis는 auto-commit이 아니므로.... 커밋 해줘야 함.

			if (result == 0) {// 리절트가 0이면 입력 실패이므로 롤백
				sqlSess.rollback();

			} else {
				sqlSess.commit();
			}

			return result;
		} finally {
			sqlSess.close();
		}
	}

	// 입력하기 위한 VO객체를 받아 insert 태그 호출
	public Integer update(Apli c) {

		// 커넥션 필요
		SqlSession sqlSess = getSqlSessionFactory().openSession();

		try {
			int result = sqlSess.update(namespace + ".updateHire", c);
			// jdbc: auto-Commit;
			// mybatis는 auto-commit이 아니므로.... 커밋 해줘야 함.

			if (result == 0) {// 리절트가 0이면 입력 실패이므로 롤백
				sqlSess.rollback();

			} else {
				sqlSess.commit();
			}

			return result;
		} finally {
			sqlSess.close();
		}
	}
	
	// 연결객체를 얻고 싶다면 "Select" 하는 태그를 호출
	public int confirmApliCount(int hireNum) {
		// getSqlSessionFactory를 이용
		SqlSession sqlSess = getSqlSessionFactory().openSession();
		try {
			return sqlSess.selectOne(namespace + ".viewApliCount", hireNum);

		} finally {
			sqlSess.close();
		}
	}

}