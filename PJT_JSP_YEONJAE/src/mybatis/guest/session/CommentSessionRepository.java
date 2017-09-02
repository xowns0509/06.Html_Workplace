package mybatis.guest.session;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import mybatis.guest.model.Comment;

public class CommentSessionRepository {

		String namespace = "mybatis.mapper.CommentMapper"; // 매퍼이름 변수로
		
		// SqlSession(Mybatis) = Connection(JDBC	)
		private SqlSessionFactory getSqlSessionFactory(){
			String resource = "mybatis-config.xml";
			InputStream inputStream = null;
			
			try{
				inputStream = Resources.getResourceAsStream(resource);
			}catch(Exception ex){
				System.out.println("mybatis-config.xml 읽어서 실행 실패: " + ex.getMessage());
			}
			
			return new SqlSessionFactoryBuilder().build(inputStream);
		}
		
		// 연결객체를 얻어 "select"하는 태그를 호출
		public List<Comment> select(){
			SqlSession sqlSess = getSqlSessionFactory().openSession();
			
			try{
				return sqlSess.selectList(namespace + ".listComment");
			}finally{
				sqlSess.close();
			}			
		}
		
		// 입력하기 위한 vo 객체를 받아서 insert 태그 호출
		public Integer insert(Comment c){
			SqlSession sqlSess = getSqlSessionFactory().openSession();
			
			try{
				int result = sqlSess.insert(namespace + ".insertComment", c);
				
				// **********************************
				// JDBC : auto-commit
				// Mybatis : auto-commit이 아님
				if(result == 0){
					sqlSess.rollback();
				}else{
					sqlSess.commit();
				}
				
				return result;
			}finally{
				sqlSess.close();
			}
		}
		
		// id에 의한 검색
		public Comment select(long commentNo){
			SqlSession sqlSess = getSqlSessionFactory().openSession();
			
			try{
				return sqlSess.selectOne(namespace + ".viewComment", commentNo);
			}finally{
				sqlSess.close();
			}
		}
		
		// 삭제하기
		public Integer delete(long commentNo){
			SqlSession sqlSess = getSqlSessionFactory().openSession();
			
			try{
				int result = sqlSess.delete(namespace + ".deleteComment", commentNo);
				
				// **********************************
				// JDBC : auto-commit
				// Mybatis : auto-commit이 아님
				if(result == 0){
					sqlSess.rollback();
				}else{
					sqlSess.commit();
				}
				
				return result;
			}finally{
				sqlSess.close();
			}
		}
		
		// 수정하기
		public Integer modify(Comment c){
			SqlSession sqlSess = getSqlSessionFactory().openSession();
			
			try{
				int result = sqlSess.update(namespace + ".modifyComment", c);
				 
				// **********************************
				// JDBC : auto-commit
				// Mybatis : auto-commit이 아님
				if(result == 0){
					sqlSess.rollback();
				}else{
					sqlSess.commit();
				}
				
				return result;
			}finally{
				sqlSess.close();
			}
		}
}
