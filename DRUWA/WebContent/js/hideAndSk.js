$(function() {

	var forDelete = $('.forDelete');

	var pwField = $('.pwField');
	
	pwField.hide();
	pwField.next().hide();
//	reviewPwField.siblings().not('.reviewTime').hide();//자기 제외한 형제들 다.

	forDelete.find("input.deleteBtn").click(function() {
		if ($(this).val()=="취소") {
			$(this).val("삭제");
		} else {
			$(this).val("취소");
		}

		$(this).parent().prev().children().toggle(10);

		//$(this).val("삭제").toggle(10);
	});

	//research.find("tr").not('.trheader').hide();
	//	if(<%=personId%>)

	//	rateReview.find("tr > td > input.Pass").hide();
	//	rateReview.find("input.Pass").parent().next().hide();
	//
	//	rateReview.find("tr > td").click(function() {
	//		rateReview.find("tr > td > input.Pass").toggle(10);
	//	});

});

//anchors.click(function (evt){
////a태그의 기능을 막아줘야 해. 그래서 a태그의 evt를 받어
//evt.preventDefault(); //그 태그의 기존 고유의 기능을 막는 놈.
//
//var currentAnchor = $(this);
//var currentPanel = $(currentAnchor.attr('href'));//지금 현재 클릭한 놈의 속성값 찾기

//원본
//$(function() {
//    var $research = $('.research');
//    $research.find("tr").not('.accordion').hide();
//    $research.find("tr").eq(0).show();
//
//    $research.find(".accordion").click(function(){
//        $research.find('.accordion').not(this).siblings().fadeOut(500);
//        $(this).siblings().fadeToggle(500);
//    }).eq(0).trigger('click');
//});

// $(function() {
//
// $('.accordion').each(function() {
//
// var table = $(this);
// var allA = table.find('a'); //dt를 전부 다 찾아내는거야. 다수니까 배열로 자동으로 자료형 설정되고
// var allDd = table.find('dd');
//
// allDd.hide();
// allA.click(function(){
// //전부 다 닫고
// allDd.slideUp();
//			
// //클릭한 놈의 바로 다음 놈(dd)을 열어
// $(this).next().slideDown();
// $(this).css('cursor', 'default');
//
//			
// });
//		
// });
//
// });

