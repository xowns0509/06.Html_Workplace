package common.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JavaUtiles {
	
	public static void close(ResultSet rs){
		if(rs != null){
			try {
				rs.close();
			} catch (Exception ex) {
				
			}
		}
	}
	
	public static void close(Statement st){
		if(st != null){
			try {
				st.close();
			} catch (Exception ex) {
				
			}
		}
	}

	public static void close(PreparedStatement ps){
		if(ps != null){
			try {
				ps.close();
			} catch (Exception ex) {
				
			}
		}
	}

	public static void close(Connection con){
		if(con != null){
			try {
				con.close();
			} catch (Exception ex) {
				
			}
		}
	}
	
}
