<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="member.model.Member" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>하노이탑</title>
<link href="/DRUWA/css/TableButtonStyle.css" rel="stylesheet" type="text/css" media="all" />
<link rel="stylesheet" href="/DRUWA/css/algoStyle.css">
<style>
@import url(http://fonts.googleapis.com/earlyaccess/hanna.css);
</style>
<script type="text/javascript" src="/DRUWA/js/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	$('#answerbutton').click(function(){
		var answer=$('#quizanswer');
		
		if(answer.css('display')=='none'){
			answer.fadeIn();
			$('#algoAnswer').attr("readonly",true);
		}else{
			answer.fadeOut();
			$('#algoAnswer').attr("readonly",false);
		}
	});
});
</script>
</head>
<body style="overflow-X:hidden">
	<div class="Algohead">
		<div class="head_article">
			넥슨 입사 기출
		</div>
	</div>
	<h4>문제>></h4>
	
	<!-- 문제 부분 -->
	<div class="quiz">
		<div class="article">
		<p>
			어떤 자연수 n이 있을 때, d(n)을 n의 각 자릿수 숫자들과 n 자신을 더한 숫자라고 정의하자.<br/>
			예를 들어  d(91) = 9 + 1 + 91 = 101 이 때, n을 d(n)의 제네레이터(generator)라고 한다. 위의 예에서 91은 101의 제네레이터이다.<br/>
			어떤 숫자들은 하나 이상의 제네레이터를 가지고 있는데, 101의 제네레이터는 91 뿐 아니라 100도 있다.<br/> 
			그런데 반대로, 제네레이터가 없는 숫자들도 있으며, 이런 숫자를 인도의 수학자 Kaprekar가 셀프 넘버(self-number)라 이름 붙였다.<br/>
			예를 들어 1,3,5,7,9,20,31 은 셀프 넘버 들이다.
			<strong>1 이상이고 5000 보다 작은 모든 셀프 넘버들의 합을 구하라.</strong></p>
		
		</div>
	</div>
	<br/>
	<% 
	Object obj=session.getAttribute("loginView"); 
	if(obj==null){%>
	<script>
		eval(alert('로그인해주세요'));
		window.close();
	</script>
	<% }else{
		Member dao=(Member)obj;
	%>
	<!-- 답 입력 부분 -->
	<div class="submitquiz" >
	<form id="frm" name="frm" method="post" action="/DRUWA/AlgoControl?cmd=algo-write">
		<input type="hidden" name="id" value="<%= dao.getId()%>"/>
		<input type="hidden" name="algoNum" value="5"/>
		<div class="submitwrite">
			<textarea id="algoAnswer" name="algoAnswer" cols="30" rows="10" placeholder="답을 입력하세요"></textarea>
		</div>
	</div>
	<br/>
	<center>
		<h3 style="color:red;">**답을 보면 수정을 못합니다.**</h3>
		<input type="submit" id="quizbutton" name="quizbutton" value="제출하기"/>
		<input type="button" id="answerbutton" name="answerbutton" value="답보기"/>
	</center>
	</form>
	<div class="quizanswer" id="quizanswer" style="display:none;">
		정답>>
		<div id="answerJAVA" style="width:300px; height:auto; ">
			<h4>JAVA로 푼답</h4>
			<p>public static void main(String[] args)<br/>
			    {<br/>
			        calculateNumbersHasGenerator();<br/>
			        int sum = 0;<br/>
			        for (int i = 0; i < 5001; i++)<br/>
			            if (!hasGenerator(i))<br/>
			                sum += i;<br/>
			        System.out.println("합 : "+sum);<br/>
			    }<br/>
			
			    private static boolean hasGenerator(int num)<br/>
			    {<br/>
			        return numbersHasGenerator.contains(num);<br/>
			    }<br/><br/>
			
			    private static ArrayList<Integer> numbersHasGenerator;<br/><br/>
			
			    private static void calculateNumbersHasGenerator()<br/>
			    {<br/>
			        numbersHasGenerator = new ArrayList<Integer>();<br/>
			        for (int i = 0; i < 5000; i++)<br/>
			        {<br/>
			            String num = String.valueOf(i);<br/>
			            int no = 0;<br/>
			            for (int n = 0; n < num.length(); n++)<br/>
			                no += Integer.parseInt(num.substring(n, n + 1));<br/>
			            numbersHasGenerator.add(no + i);<br/>
			        }<br/>
			    }<br/>
  		  </p>
		</div>
		<div id="answerC" style="width:350px; height:auto; margin-top:-750px; margin-left:350px;">
			<h4>c로 푼 답</h4>
			<p>#include <stdio.h><br/>
				int getValueByGenerator(int);<br/><br/>
				
				int main(){<br/>
				    int num[5000];<br/>
				    int haveGenerator[5000] = {0,};<br/>
				    int i =0;<br/>
				    int result = 0;<br/><br/>
				
				    for(i=1; i<=5000; i++)<br/>
				        num[i-1]= getValueByGenerator(i);<br/>
				
				    for(i=0; i<5000; i++){<br/>
				        if(num[i] <= 5000)<br/>
				            haveGenerator[(num[i] -1)] = 1;<br/>
				    }<br/>
				
				    for(i=0; i<5000; i++){<br/>
				        if(haveGenerator[i] == 0){<br/>
				            result += (i+1);<br/>
				            printf("%d ", i+1);<br/>
				        }<br/>
				    }<br/>
				
				    printf("\n\nresult : %d\n", result);<br/>
				    return 0;<br/>
				}<br/>
				
				int getValueByGenerator(int x){<br/>
				    return (x + x/1000 + (x%1000)/100 + (x%100)/10 + x%10);<br/>
				}<br/>
			</p>
		</div>
		
	</div>
	
	<%}%>
</body>
</html>