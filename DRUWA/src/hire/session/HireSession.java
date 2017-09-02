//Repository 에 해당하는 놈
package hire.session;

import java.io.InputStream;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import hire.model.Hire;

public class HireSession {

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
	 * 분야 별 지원자수 상위 10 채용공고 갖고 오는 거.
	 * 
	 * @param cId
	 * @return
	 */
	public List<Hire> SelectHireJob10(String hireJob) {
		// getSqlSessionFactory를 이용
		SqlSession sqlSess = getSqlSessionFactory().openSession();
		try {
			return sqlSess.selectList(namespace + ".listHireJob10", hireJob);
			// 리스트 목록 뽑아지는데... 그거 바로 리턴한다고.
		} finally {
			sqlSess.close();
		}
	}

	/**
	 * 분야 별 모든 공고 갖고 오는거
	 * 
	 * @param cId
	 * @return
	 */
	public List<Hire> SelectHireJob(String hireJob) {
		// getSqlSessionFactory를 이용
		SqlSession sqlSess = getSqlSessionFactory().openSession();
		try {
			return sqlSess.selectList(namespace + ".listHireJob", hireJob);

		} finally {
			sqlSess.close();
		}
	}

	/**
	 * 해당 회사의 모든 공고 갖고 오는거
	 * 
	 * @param cId
	 * @return
	 */
	public List<Hire> Select(String companyId) {
		// getSqlSessionFactory를 이용
		SqlSession sqlSess = getSqlSessionFactory().openSession();
		try {
			return sqlSess.selectList(namespace + ".viewCompanyHire", companyId);

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
	public Hire select(int hireNum) {
		// getSqlSessionFactory를 이용
		SqlSession sqlSess = getSqlSessionFactory().openSession();
		try {
			return sqlSess.selectOne(namespace + ".viewSingleHire", hireNum);

		} finally {
			sqlSess.close();
		}
	}

	// 입력하기 위한 VO객체를 받아 insert 태그 호출
	public Integer insert(Hire c) {

		// 커넥션 필요
		SqlSession sqlSess = getSqlSessionFactory().openSession();

		try {
			int result = sqlSess.insert(namespace + ".insertHire", c);
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
	public Integer delete(Hire c) {

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

	// 카운트 넣기
	public Integer updateHireCount(Hire c) {

		// 커넥션 필요
		SqlSession sqlSess = getSqlSessionFactory().openSession();

		try {
			int result = sqlSess.update(namespace + ".updateHireCount", c);
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

}