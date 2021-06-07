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
	function submitFunction(){
		var chatName = $('#chatName').val();
		var chatContent = $('#chatContent').val();
	 	$.ajax({
	 		type: "POST",
	 		url: "./chatSubmitServlet",
	 		data: {
	 			chatName : chatName,
	 			chatContent : chatContent
	 		},
	 		success: function(result){
	 			if(result==1){
	 				alert('초성을 남겼습니다.');
	 			}else if(result == 0){
	 				alert('초성을 남기지 못했습니다.');
	 			}else{
	 				alert('오류가 발생했습니다.');
	 			}
	 		}
	 	});
	 	$('#chatContent').val('');
	}
</script>
</head>
<body>
	<div class="container">
		<div class="container_bootstrap_snippet">
			<div class="row">
				<div class="col-xs-12">
					<div class="portlet portlet-default">
						<div class="portlet-heading">
							<div calss="portlet-title">
								<h4>
									<i class="fa fa-circle text-green"></i>Are you there?
								</h4>
							</div>
							<div class="clearfix"></div>
						</div>
						<div id="chat" class="panel-collapse collapse in">
							<div class="portlet-body chat-widget"
								style="overflow-y: auto; width: auto; height: 300px;">
								<div class="row">
									<div class="col-lg-12">
										<p class="text-center text-muted small">날짜</p>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-12">
										<div class="media">
											<a class="pull-left" href="#"> <img
												class="media-object img-circle" src="images/m.png">
											</a>
											<div class="media-body">
												<h4 class="media=heading">
													닉네임 <span class="small pull-right">작성 시간</span>
												</h4>
											</div>
											<p>입력 메시지</p>
										</div>
									</div>
								</div>
								<hr>
								<div class="row">
									<div class="col-lg-12">
										<div class="media">
											<a class="pull-left" href="#"> <img
												class="media-object img-circle" src="images/w.png">
											</a>
											<div class="media-body">
												<h4 class="media=heading">
													닉네임 <span class="small pull-right">작성 시간</span>
												</h4>
											</div>
											<p>입력 메시지</p>
										</div>
									</div>
								</div>

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
										<button type="button" class="btn btn-default pull-right" onclick="submitFunction();">남기기</button>
										<div class="clearfix"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>