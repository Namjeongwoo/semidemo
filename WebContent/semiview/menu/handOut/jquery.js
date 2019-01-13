function listView() {
	var handout_post_num = $('#handout_post_num').val();

	$.ajax({
		type : 'POST',
		dataType : 'text',
		url : 'handOutCommentList',
		data : {
			handout_post_num : handout_post_num
		},
		success : show,
		error : function() {
			alert("퇴각하라!!!");
		}

	});

}

function show(comment) {
/*
	//댓글 리스트 응답.
	function viewMessage(res){
		//CommentListController 의 out.print(arr); 값을 res 로 받는다.
		//alert(res); //확인할때는 위에 dataType을 text로 변경해서 확인해본다.
		for (index in res){
			var div = $('<div></div>'); //div 생성.
			$('#commentList').append(div); //새로 만든 div 추가
			var p1 = $('<p>'+res[index].col+'</p>');
			$(div).append(p1);
			var p2 = $('<p>'+res[index].content+'</p>');
			$(div).append(p2);
			var inputupdate = $('<input type="button" value="수정"/>');
			$(div).append(inputupdate);
			var inputdelete = $('<input type="button" value="삭제"/>');
			$(div).append(inputdelete);
		}
	};//end viewMessage()///////
	*/	
	
	

	for (index in comment) {
		var div = $('<div style="float: left;"></div>');
		$('#commContent').append(div);
		
		var img = $('<img style="width:50px; height: 50px;" src="../semiview/images/handout/'+(comment[index].image)+'"/>');
		$(div).append(img);
	}

}







//  심해 입장.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////


/*var titleNum; //다른 리스트에서 참조되어야 하기 때문에 전역변수로 선언.

$(document).ready(function(){
	//댓글입력
	$('#btnInput').on('click',function(){
		$.ajax({
			type:'POST',
			dataType:'text',
			url:'commentInput',
			//전역 변수 titleNum 을 넘겨준다.
			data:'handout_post_num='+titleNum+'&content='+$('#textInput').val(),
			success: inputMessage
		});
	});//댓글입력 끝//////////
	
	//수정버튼에 동적 이벤트 등록
	$(document).on('click','[value="수정"]',function(){
		//댓글 입력을 화면에서 감추고 댓글 수정을 화면에 보여줘야 한다.
		$('#divUpdate').css({'display':'block'});
		$('#commentAdd').css({'display':'none'});
		var selEle = $(this).parent(); //현재 이벤트가 발생된 곳에 부모요소를 가지고 온다.
		$('#textCol').val(selEle.children('p:nth-child(1)').text());//div요소에 자식 요소 중 첫번째 p 요소의 text 값을 가지고 온다.
		$('#textUpdate').val(selEle.children('p:nth-child(2)').text());//div요소에 자식 요소 중 두번째 p 요소의 content 가져와서 넣기.
	});//end 수정버튼//////////////////
	
	//댓글수정버튼
	$('#btnUpdate').on('click',function(){
		$.ajax({
			type:'POST',
			dataType:'text',
			url:'commentUpdate',
			data:'col='+$('#textCol').val()+'&content='+$('#textUpdate').val()+'&handout_post_num='+titleNum,
			success: updateMessage
		});
	});
	
	$(document).on('click','[value="삭제"]',function(){
		var selEle = $(this).parent();//div
		$('#textCol').val(selEle.children('p:nth-child(1)').text());//div요소에 자식 요소 중 첫번째 p 요소의 text 값을 가지고 온다.
		
		$.ajax({
			type:'GET',
			dataType:'text',
			url:'commentDelete?col='+$('#textCol').val()+'&handout_post_num='+titleNum,
			success: deleteMessage
		});
	});//end 삭제버튼//////////////////
	
}); //end ready()////////////////////

//댓글 삭제 응답
function deleteMessage(res){
	$('#commentList').empty();
	listView(res); //listView 재호출
};////////////////



//댓글 수정 응답
function updateMessage(res){
	$('#commentList').empty();
	listView(res); //listView 재호출
	//댓글 수정이 안료 되었으면 수정창은 안보이게 하고 댓글 입력 창을 다시 띄워준다.
	$('#divUpdate').css({'display':'none'});
	$('#commentAdd').css({'display':'block'});
};////////////////

//댓글 삽입 응답
function inputMessage(res){ //res: num 에 해당된다.
	$('#commentList').empty(); //commentList 의 자식 삭제. (객체는 남아있고 자식 요소만 삭제 된다.)
	listView(res); //listView 재호출
	
};///////////////


//댓글 리스트 요청
function listView(num){
	titleNum = num;
	$.ajax({
		type: 'GET',
		dataType: 'json',
		url:'commentList?handout_post_num='+num,
		success: viewMessage
	});
};//end listView()////////////////

//댓글 리스트 응답.
function viewMessage(res){
	//CommentListController 의 out.print(arr); 값을 res 로 받는다.
	//alert(res); //확인할때는 위에 dataType을 text로 변경해서 확인해본다.
	for (index in res){
		var div = $('<div></div>'); //div 생성.
		$('#commentList').append(div); //새로 만든 div 추가
		var p1 = $('<p>'+res[index].col+'</p>');
		$(div).append(p1);
		var p2 = $('<p>'+res[index].content+'</p>');
		$(div).append(p2);
		var inputupdate = $('<input type="button" value="수정"/>');
		$(div).append(inputupdate);
		var inputdelete = $('<input type="button" value="삭제"/>');
		$(div).append(inputdelete);
	}
};//end viewMessage()///////
*/
