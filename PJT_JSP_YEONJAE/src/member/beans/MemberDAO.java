package member.beans;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import common.jdbc.JavaUtiles;

public class MemberDAO {
	PreparedStatement ps;
	Connection con;
	
	private MemberDAO() throws ClassNotFoundException{
		// 1. 드라이버 로딩
		Class.forName("oracle.jdbc.driver.OracleDriver");
		System.out.println("한번만 실행");
	}
	
	static private MemberDAO dao = null;
	
	public static MemberDAO getInstance() throws Exception{
		if(dao == null){
			dao = new MemberDAO();
		}
		
		return dao;
	}
	
	// 아이디 중복검사 
	public boolean isDuplicatedId(String id) throws Exception{
		boolean checked = false;
		
		// 넘겨받은 아이디가 회원 테이블에 존재하는지 검색하여 checked=true 변경
		try{
			// 2. 연결 객체 얻어오기
			con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1522:orcl", "scott", "tiger");
			
			// 3. sql 문장만들기 
			String sql = "SELECT name FROM memberTemp WHERE id=?";
			
			// 4. sql 전송객체 얻어오기 
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			
			// 5. 전송 
			ResultSet rs = ps.executeQuery();
			if(rs.next()){
				checked = true;
			}
							
		}catch(Exception ex){
			new MemberException("중복검사시 오류: " + ex.getMessage());
		}finally{
			JavaUtiles.close(ps);
			JavaUtiles.close(con);
		}
		
		return checked;
	}
	
	// 회원가입시 회원정보 입력
	public int insertMember(Member m) throws Exception{
		int result = 0;
		
		try{
			// 2. 연결 객체 얻어오기
			con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1522:orcl", "scott", "tiger");
			
			// 3. sql 문장만들기 (insert)
			String sql = "INSERT INTO memberTemp (id, password, name, addr, tel) VALUES "
							+ "(?, ?, ?, ?, ?)";
			
			// 4. sql 전송객체 얻어오기 (PreparedStatement)
			ps = con.prepareStatement(sql);
			ps.setString(1, m.getId());
			ps.setString(2, m.getPass());
			ps.setString(3, m.getName());
			ps.setString(4, m.getAddr());
			ps.setString(5, m.getTel());
			
			// 5. 전송 (executeUpdate() 리턴값을 result 변수에 저장)
			result = ps.executeUpdate();				
		}catch(Exception ex){
			new MemberException("회원가입시 오류: " + ex.getMessage());
		}finally{
			JavaUtiles.close(ps);
			JavaUtiles.close(con);
		}
		
		return result;
	}
	
	// 로그인시 아이디와 패스워드에 해당하는 이름 가져오기
	public String login(Member m) throws Exception{
		String name = null;
		
		try{
			// 2. 연결 객체 얻어오기
			con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1522:orcl", "scott", "tiger");
					
			// 3. sql 문장만들기 
			String sql = "SELECT name FROM memberTemp WHERE id=? AND password=?";
					
			// 4. sql 전송객체 얻어오기 
			ps = con.prepareStatement(sql);
			ps.setString(1, m.getId());
			ps.setString(2, m.getPass());
			
			// 5. 전송 
			ResultSet rs = ps.executeQuery();		
			while(rs.next()){
				name = rs.getString("name");
			}
		}catch(Exception ex){
			new MemberException("로그인시 오류: " + ex.getMessage());
		}finally{
			// 닫기 
			JavaUtiles.close(ps);
			JavaUtiles.close(con);
		}
		return name;
	}
	
}
