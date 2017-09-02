package mbts.mvcGuest.session;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import mbts.mvcGuest.model.Message;


public class MessageSessionRepository {

	String namespace = "mbts.mvcGuest.mapper.MessageMapper"; // 매퍼이름 변수로

	// SqlSession(Mybatis) = Connection(JDBC)
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

	public List<Message> select() {
		SqlSession sqlSess = getSqlSessionFactory().openSession();
		
		try{
			return sqlSess.selectList(namespace + ".listMessage");
		}finally{
			sqlSess.close();
		}
	}

	public int insert(Message msg) {
		SqlSession sqlSess = getSqlSessionFactory().openSession();
		
		try{
			int result = sqlSess.insert(namespace + ".saveMessage", msg);
			
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

	public int delete(int messageId, String password) {
		SqlSession sqlSess = getSqlSessionFactory().openSession();
		Message msg = new Message();
		msg.setMessageId(messageId);
		msg.setPassword(password);
		
		try{
			int result = sqlSess.delete(namespace + ".deleteMessage", msg);
			
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
