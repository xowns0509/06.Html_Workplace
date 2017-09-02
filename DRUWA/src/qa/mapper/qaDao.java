package qa.mapper;

import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import qa.model.Mw;
import qa.model.Qa;
import qa.model.RepleVo;
import qa.model.Sh;
import qa.model.Sh2;

public class qaDao {
	private static qaDao instance = null;
	private static String namespace = "mybatis.mapper.QaMapper";
	private static SqlSessionFactory sqlSessionFactory;

	private qaDao() {
		sqlSessionFactory = getSqlSessionFactory();
	}

	public static qaDao getInstance() {
		if (instance != null)
			return instance;
		instance = new qaDao();
		return instance;
	}

	// SqlSession(Mybatis) = Connection (JDBC)
	private SqlSessionFactory getSqlSessionFactory() {
		String resource = "mybatis-config.xml";
		InputStream inputStream = null;
		try {
			inputStream = Resources.getResourceAsStream(resource);
		} catch (Exception ex) {
			System.out.println("mybatis-config.xml 읽어서 실행 실패:" + ex.getMessage());
		}
		return new SqlSessionFactoryBuilder().build(inputStream);
	}

	public int insertQa(Qa qa) {
		System.out.println("qa : " + qa.toString());
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		try {
			return sqlSession.insert(namespace + ".insert", qa);
		} finally {
			sqlSession.close();
		}
	}

	public void deleteQa(int qaNum) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		sqlSession.delete(namespace + ".deleteReple", qaNum);
		sqlSession.delete(namespace + ".delete", qaNum);
	}

	public void updateQa(Qa qa) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		sqlSession.update(namespace + ".update", qa);
	}

	public List<Qa> selectQaList(String job, String search) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("job", job);
		param.put("search", search);

		try {
			return sqlSession.selectList(namespace + ".selectList", param);
		} finally {
			sqlSession.close();
		}

	}

	public int selectQaCount(String job, String search) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("job", job);
		param.put("search", search);

		try {
			return sqlSession.selectOne(namespace + ".selectQaCount", param);
		} finally {
			sqlSession.close();
		}

	}

	public Qa selectQaList(int num) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		try {
			return sqlSession.selectOne(namespace + ".selectByQaNum", num);
		} finally {
			sqlSession.close();
		}

	}

	public List<Sh> selectShList() {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		try {
			return sqlSession.selectList(namespace + ".selectShList");
		} finally {
			sqlSession.close();
		}
	}

	// 댓글
	public List<RepleVo> selectRepleList(int qaNum) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		try {
			return sqlSession.selectList(namespace + ".selectRepleList", qaNum);
		} finally {
			sqlSession.close();
		}

	}

	// 댓글
	public void insertReple(RepleVo rv) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		try {
			System.out.println("리플 인서트 디비 실행 전 : " + rv.toString());
			sqlSession.insert(namespace + ".insertReple", rv);
			System.out.println("리플 인서트 디비 실행 후 : ");

		} finally {
			sqlSession.close();
		}
	}

	// sh
	public void insertSh(Sh sh) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		try {
			sqlSession.insert(namespace + ".insertsh", sh);// 매퍼랑 똑같이 해준다
															// insertsh
		} finally {
			sqlSession.close();
		}

	}

	public void insertUp(Sh2 shUp) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		try {
			// 추천테이블에 추천글, 추천인 정보를 인서트
			sqlSession.insert(namespace + ".insertup", shUp);

			// 그 추천글에 대한 추천을 모두 카운팅( 이 정보가 추천수가 됨)
			int upCount = sqlSession.selectOne(namespace + ".upCount", shUp.getShseq());

			// 위에서 받은 추천수를 shUp객체에 넣어줌
			shUp.setUpCount(upCount);

			// 추천수를 그 글의 추천수 컬럼에 업데이트
			sqlSession.update(namespace + ".upUpdate", shUp);

		} finally {
			sqlSession.close();
		}
	}

	public int increaseCount(int qaNum) {
		// conection 얻어오기
		SqlSession sqlSess = getSqlSessionFactory().openSession();
		try {
			int result = sqlSess.update(namespace + ".increaseCount", qaNum);
			if (result == 0)
				sqlSess.rollback();
			else
				sqlSess.commit();

			return result;

		} finally {
			sqlSess.close();
		}

	}

	public int upCheck(Sh2 sh) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		try {
			return sqlSession.selectOne(namespace + ".upCheck", sh);
		} finally {
			sqlSession.close();
		}
	}

	public List<Qa> mainQa() {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		try {
			List<Qa> list = sqlSession.selectList(namespace + ".mainQa");
			return list;
		} finally {
			sqlSession.close();
		}

	}

	public List<Sh> mainSh() {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		try {
			List<Sh> list = sqlSession.selectList(namespace + ".mainSh");
			return list;
		} finally {
			sqlSession.close();
		}

	}
	
	public List<Mw> myWrite(String id) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		try {
			List<Mw> list = sqlSession.selectList(namespace + ".myWrite",id);
			return list;
		} finally {
			sqlSession.close();
		}

	}
	 

}