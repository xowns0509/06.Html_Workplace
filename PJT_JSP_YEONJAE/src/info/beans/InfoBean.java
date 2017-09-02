package info.beans;
/*
 	자바빈즈 클래스 : 멤버변수  + setter/getter
 */
public class InfoBean {
	// 멤버필드명이 폼 태그의 name과 동일해야 함
	String name;
	String id;
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	public String getGender(){
		String gender = "";
		char sung = id.charAt(7);
		
		if(sung == '1' || sung == '3' || sung == '9'){
			gender = "남자";
		}else{
			gender = "여자";
		}
		
		return gender;
	}
	
}
