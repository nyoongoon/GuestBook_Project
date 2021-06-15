<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>Are you there?</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>
<script type="text/javascript">
	var lastID = 0;
	
	function submitFunction() {
		var chatName = $('#chatName').val();
		var chatContent = $('#chatContent').val();
		$.ajax({
			type : "POST",
			url : "./chatSubmitServlet",
			data : {
				chatName : chatName,
				chatContent : chatContent
			},
			success : function(result) {
				if (result == 1) {
					autoClosingAlert('#successMessage', 2000);
				} else if (result == 0) {
					autoClosingAlert('#dangerMessage', 2000);
				} else {
					autoClosingAlert('#warningMessage', 2000);
				}
			}
		});
		$('#chatContent').val('');
	}
	function autoClosingAlert(selector, delay) {
		var alert = $(selector).alert();
		alert.show();
		window.setTimeout(function() {
			alert.hide()
		}, delay);
	
	}
	function chatListFunction(type){
		$.ajax({
			type : "POST",
			url : "./chatListServlet",
			data : {
				listType: type,
				//ajax 데이터 추가
				//lastID: lastID
			},
			success: function(data) {
				var parsed = JSON.parse(data);
				var result = parsed.result;
				
				for(var i = 0; i < result.length; i++){
					addChat(result[i][0].value, result[i][1].value, result[i][2].value);
					
				}
				lastID = Number(parsed.last);
				 
			}
		});
	}
	function addChat(chatName, chatContent, chatTime){
		$('#chatList').append('<div class="row"' +
		 					'<div class="col-lg-12">' +
		 					'<div class="media">' + 
		 					'<a class="pull-left" href="#">' +
		 					'<img class="media-object" src="images/w.png" alt="">'+
		 					'</a>' + 
		 					'<div class="media-body">'+
		 					'<h4 class="media-heading">'+
		 					chatName +
		 					'<span class="small pull-right">' +
		 					chatTime + 
		 					'</span>' +
		 					'</h4>' +
		 					'<p>' +
		 					chatContent +
		 					'</p>' +
		 					'</div>' +
		 					'</div>' +
		 					'</div>' +
		 					'</div>' +
		 					'<hr>');
		
			
					$('#chatList').scrollTop($('#chatList')[0].clientHeight);
			
		
	}
	
	
	
	//스크롤을 맨 아래로	
	//$('#chatList').scrollTop($('#chatList')[0].scrollHeight);
	
	//스크롤을 올려서 데이터 가져오기
	
	//페이지가 로딩이 완료됐을 경우 실행하라고 알려줌
	$(document).ready(function(){
        $('#chatList').scroll(function(){
        var scrollT = $(this).scrollTop(); //스크롤바의 상단위치
      	
        if(scrollT < 1) { // 스크롤바가 아래 쪽에 위치할 때
        	//chatListFunction('ID'); lastID 매개변수로 보내야 함
        	chatListFunction('ten');
        }
    });
});

	
	$(document).ready(function(){
		chatListFunction('ten');
		
	});



	
</script>

</head>
<body>
	<div class="container">
		<div class="container_bootstrap_snippet">
			<div class="row">
				<div class="col-xs-12">
					<div class="portlet portlet-default">
						<div class="portlet-heading">
							<div class="portlet-title">
								<h4>
								
									<i class="fa fa-circle text-green"></i>Are you there?
								</h4>
							</div>
							<div class="clearfix"></div>
						</div>
						<div id="chat" class="panel-collapse collapse in">
							
							
							<div id="chatList" class="portlet-body chat-widget"
								style="overflow-y: scroll; width: auto; height: 500px;">
							</div>		
							
										
						<div class="portlet-footer">
							<div class="row">
								<div class="form-group col-xs-4">
									<input style="height: 40px;" type="text" id="chatName"
										class="form-control" placeholder="이름" maxlength="20">
								</div>
							</div>
							<div class="row" style="height: 90px">
								<div class="form-group col-xs-10">
									<textarea style="height: 80px;" id="chatContent"
										class="form-control" placeholder="초성을 입력하세요." maxlength="100"></textarea>
								</div>
								<div class="form-group col-xs-2">
									<button type="button" class="btn btn-default pull-right"
										onclick="submitFunction();">남기기</button>
									<div class="clearfix"></div>
								</div>
							</div>
						</div>
					</div>
					
				</div>
			</div>
		</div>
	</div>
	<div class="alert alert-success" id="successMessage"
		style="display: none;">
		<strong>초성을 남겼습니다.</strong>
	</div>
	<div class="alert alert-danger" id="dangerMessage"
		style="display: none;">
		<strong>초성을 남기지 못했습니다.</strong>
	</div>
	<div class="alert alert-warning" id="warningMessage"
		style="display: none;">
		<strong>오류가 발생했습니다.</strong>
	</div>
	</div>
	
	

</body>
</html>