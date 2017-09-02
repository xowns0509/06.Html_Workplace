//Repository 에 해당하는 놈
package hire.session;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import hire.model.Rate;
import hire.model.Review;

public class RateReviewSession {

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
	 * 해당 회사의 모든 review 갖고 오는거
	 * @param cId
	 * @return
	 */
	public List<Review> selectReview(String companyId) {
		// getSqlSessionFactory를 이용
		SqlSession sqlSess = getSqlSessionFactory().openSession();
		try {
			return sqlSess.selectList(namespace + ".listReview", companyId);

		} finally {
			sqlSess.close();
		}
	}

	/**
	 * 해당 회사의 모든 rate 갖고 오는거
	 * @param cId
	 * @return
	 */
	public List<Rate> selectRate(String companyId) {
		// getSqlSessionFactory를 이용
		SqlSession sqlSess = getSqlSessionFactory().openSession();
		try {
			return sqlSess.selectList(namespace + ".listRate", companyId);

		} finally {
			sqlSess.close();
		}
	}

	/**
	 * 입력하기 위한 Review VO객체를 받아 insert 태그 호출
	 * @param cId
	 * @return
	 */
	public Integer insert(Review c) {

		// 커넥션 필요
		SqlSession sqlSess = getSqlSessionFactory().openSession();

		try {
			int result = sqlSess.insert(namespace + ".insertReview", c);
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
	
	/**
	 * 입력하기 위한 Rate VO객체를 받아 insert 태그 호출
	 * @param cId
	 * @return
	 */
	public Integer insert(Rate c) {

		// 커넥션 필요
		SqlSession sqlSess = getSqlSessionFactory().openSession();

		try {
			int result = sqlSess.insert(namespace + ".insertRate", c);
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

	/**
	 * 삭제하기 위한 위한 Rate VO객체를 받아 Rate 태그 호출
	 * @param cId
	 * @return
	 */
	public Integer delete(Rate c) {

		// 커넥션 필요
		SqlSession sqlSess = getSqlSessionFactory().openSession();

		try {
			int result = sqlSess.delete(namespace + ".deleteRate", c);
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

	/**
	 * 삭제하기 위한 위한 Rate VO객체를 받아 Review 태그 호출
	 * @param cId
	 * @return
	 */
	public Integer delete(Review c) {

		// 커넥션 필요
		SqlSession sqlSess = getSqlSessionFactory().openSession();

		try {
			int result = sqlSess.delete(namespace + ".deleteReview", c);
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
