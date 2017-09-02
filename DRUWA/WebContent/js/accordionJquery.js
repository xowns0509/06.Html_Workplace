$(function() {
	var research = $('.research');
	var rateReview = $('.rateReview');

	research.find("tr").not('.trheader').hide();
	research.find("tr.trheader").children().show();

	research.find("tr.trheader > td > input").click(function() {
		//		research.find("tr").not('.trheader').hide();
		$(this).parent().parent().nextUntil("tr.trheader").toggle(10);
	});

	rateReview.find("tr > td > input.Pass").hide();
	rateReview.find("input.Pass").parent().next().hide();

	rateReview.find("tr > td").click(function() {
		rateReview.find("tr > td > input.Pass").toggle(10);
	});
//
//	var fileTarget = $('.filebox .upload-hidden');
//
//	fileTarget.on('change', function() { // 값이 변경되면
//		if (window.FileReader) { // modern browser
//			var filename = $(this)[0].files[0].name;
//		} else { // old IE
//			var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출
//		}
//
//		// 추출한 파일명 삽입
//		$(this).siblings('.upload-name').val(filename);
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

