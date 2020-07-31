<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!------ Include the above in your HEAD tag ---------->
<% String id = request.getParameter("id"); %>

<html>
	<head>
		<title>Chat</title>
		<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
		<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.css">
		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.js"></script>
        
        <style>
       	body,html{
			height: 100%;
			margin: 0;
			background: #7F7FD5;
	       background: -webkit-linear-gradient(to right, #91EAE4, #86A8E7, #7F7FD5);
	        background: linear-gradient(to right, #91EAE4, #86A8E7, #7F7FD5);
		}

		.chat{
			margin-top: auto;
			margin-bottom: auto;
		}
		.card{
			height: 500px;
			border-radius: 15px !important;
			background-color: rgba(0,0,0,0.4) !important;
		}
		.contacts_body{
			padding:  0.75rem 0 !important;
			overflow-y: auto;
			white-space: nowrap;
		}
		.msg_card_body{
			overflow-y: auto;
		}
		.card-header{
			border-radius: 15px 15px 0 0 !important;
			border-bottom: 0 !important;
		}
	 .card-footer{
		border-radius: 0 0 15px 15px !important;
			border-top: 0 !important;
	}
		.container{
			align-content: center;
		}
		.search{
			border-radius: 15px 0 0 15px !important;
			background-color: rgba(0,0,0,0.3) !important;
			border:0 !important;
			color:white !important;
		}
		.search:focus{
		     box-shadow:none !important;
           outline:0px !important;
		}
		.type_msg{
			background-color: rgba(0,0,0,0.3) !important;
			border:0 !important;
			color:white !important;
			height: 60px !important;
			overflow-y: auto;
		}
			.type_msg:focus{
		     box-shadow:none !important;
           outline:0px !important;
		}
		.attach_btn{
	border-radius: 15px 0 0 15px !important;
	background-color: rgba(0,0,0,0.3) !important;
			border:0 !important;
			color: white !important;
			cursor: pointer;
		}
		.send_btn{
	border-radius: 0 15px 15px 0 !important;
	background-color: rgba(0,0,0,0.3) !important;
			border:0 !important;
			color: white !important;
			cursor: pointer;
		}
		.search_btn{
			border-radius: 0 15px 15px 0 !important;
			background-color: rgba(0,0,0,0.3) !important;
			border:0 !important;
			color: white !important;
			cursor: pointer;
		}
		.contacts{
			list-style: none;
			padding: 0;
		}
		.contacts li{
			width: 100% !important;
			padding: 5px 10px;
			margin-bottom: 15px !important;
		}
	.active{
			background-color: rgba(0,0,0,0.3);
	}
		.user_img{
			height: 70px;
			width: 70px;
			border:1.5px solid #f5f6fa;
		
		}
		.user_img_msg{
			height: 40px;
			width: 40px;
			border:1.5px solid #f5f6fa;
		
		}
	.img_cont{
			position: relative;
			height: 70px;
			width: 70px;
	}
	.img_cont_msg{
			height: 40px;
			width: 40px;
	}
	.online_icon{
		position: absolute;
		height: 15px;
		width:15px;
		background-color: #4cd137;
		border-radius: 50%;
		bottom: 0.2em;
		right: 0.4em;
		border:1.5px solid white;
	}
	.offline{
		background-color: #c23616 !important;
	}
	.user_info{
		margin-top: auto;
		margin-bottom: auto;
		margin-left: 15px;
	}
	.user_info span{
		font-size: 20px;
		color: white;
	}
	.user_info p{
	font-size: 10px;
	color: rgba(255,255,255,0.6);
	}
	.video_cam{
		margin-left: 50px;
		margin-top: 5px;
	}
	.video_cam span{
		color: white;
		font-size: 20px;
		cursor: pointer;
		margin-right: 20px;
	}
	.msg_cotainer{
		margin-top: auto;
		margin-bottom: auto;
		margin-left: 10px;
		border-radius: 25px;
		background-color: #82ccdd;
		padding: 10px;
		position: relative;
	}
	.msg_cotainer_send{
		margin-top: auto;
		margin-bottom: auto;
		margin-right: 10px;
		border-radius: 25px;
		background-color: #78e08f;
		padding: 10px;
		position: relative;
	}
	.msg_time{
		position: absolute;
		left: 0;
		bottom: -15px;
		color: rgba(255,255,255,0.5);
		font-size: 10px;
	}
	.msg_time_send{
		position: absolute;
		right:0;
		bottom: -15px;
		color: rgba(255,255,255,0.5);
		font-size: 10px;
	}
	.msg_head{
		position: relative;
	}
	#action_menu_btn{
		position: absolute;
		right: 10px;
		top: 10px;
		color: white;
		cursor: pointer;
		font-size: 20px;
	}
	.action_menu{
		z-index: 1;
		position: absolute;
		padding: 15px 0;
		background-color: rgba(0,0,0,0.5);
		color: white;
		border-radius: 15px;
		top: 30px;
		right: 15px;
		display: none;
	}
	.action_menu ul{
		list-style: none;
		padding: 0;
	margin: 0;
	}
	.action_menu ul li{
		width: 100%;
		padding: 10px 15px;
		margin-bottom: 5px;
	}
	.action_menu ul li i{
		padding-right: 10px;
	
	}
	.action_menu ul li:hover{
		cursor: pointer;
		background-color: rgba(0,0,0,0.2);
	}
	@media(max-width: 576px){
	.contacts_card{
		margin-bottom: 15px !important;
	}
	}


        </style>
	</head>
	<body>
	
	 <!-- 로그인한 상태일 경우와 비로그인 상태일 경우의 chat_id설정 -->
	<c:set var = "id" value='<%=id%>'/>
    <c:if test="${(id ne '') and !(empty id)}">
        <input type="hidden" value='${id }' id='chat_id' />
    </c:if>
    <c:if test="${(id eq '') or (empty id)}">
        <input type="hidden" value='<%=session.getId().substring(0, 6)%>'id='chat_id' />
    </c:if>
 
    	<div class="container-fluid h-100">
			<div class="row justify-content-center h-100">
				<div class="col-md-4 col-xl-3 chat"><div class="card mb-sm-3 mb-md-0 contacts_card">
					<div class="card-header">
						<div class="input-group">
							<span>접속자 목록</span>
							<div class="input-group-prepend">
							</div>
						</div>
					</div>
					<div class="card-body contacts_body">
						<ui class="contacts" id="idList">
						
						</ui>
					</div>
					<div class="card-footer"></div>
				</div></div>
				<div class="col-md-8 col-xl-6 chat">
					<div class="card">
						<div class="card-header msg_head">
							
							
						</div>
						<div class="card-body msg_card_body" id="messageWindow">	
							
							
						</div>
						<div class="card-footer">
							<div class="input-group">
								<div class="input-group-append">
									<span class="input-group-text attach_btn"></span>
								</div>
								<input type="text" id="inputMessage" class="form-control type_msg" placeholder="Type your message..." onkeyup="enterkey()"/>
								<div class="input-group-append">
									<span class="input-group-text send_btn" onclick="send()"><i class="fas fa-location-arrow"></i></span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
	<script type="text/javascript">
	
				var textarea = document.getElementById("messageWindow");
				var url = document.getElementById("chat_id").value;
				console.log("내아이디:"+url);
				var webSocket = new WebSocket('ws://192.168.40.33:8888/broadcasting/'+url);
				var inputMessage= document.getElementById("inputMessage");
				
				  var day = new Date();
				  var time= (day.getHours()<=12 ? 'AM':'PM') +" "+ (day.getHours())+":"+(day.getMinutes());
				
		   
	 			webSocket.onerror = function(event) {
			        onError(event)
			    };
			    webSocket.onopen = function(event) {
			        onOpen(event)
			        
			        
			    };
			    webSocket.onmessage = function(event) {
			        onMessage(event)
			        document.getElementById('messageWindow').scrollTop = document.getElementById('messageWindow').scrollHeight;
			    };
			    
			    
			    
			    webSocket.onclose = function(event) {
		            
		        }
 
		

 
    function onMessage(event) {
        var message = event.data.split("|");
        
        var sender = message[0];
        var content = message[1];
        
       
    	if(content==null && sender.indexOf("@list:")==-1){
    		   $("#messageWindow").html($("#messageWindow").html()+"<p class='chat_content'>"+sender+"</p>");
    	}
    	else if(content==null && sender.indexOf("@list:")==0){
    		$("#idList").html("");
    		var myId=document.getElementById("chat_id").value;
    		
    		//사용자 목록 text로 받아 아이디값만 추출
    		var idList=sender.substring((sender.indexOf("[")+1),(sender.indexOf("]")));
    		
    		idList=idList.split(",");
    	
    		console.log(idList);
    		
    		for(var i in idList){
    			if(idList[i].trim()!=myId){
    				$("#idList").html($("#idList").html()+"<li><div class='d-flex bd-highlight'><div class='user_info'><span>"+idList[i]+"</span></div></div></li>");
    			}
    			
    		}
    		
    		
    	}
      	//서버 메시지일 경우
      	else if (content == "") {
            
        } else {
            if (content.match("/")) {
                if (content.match(("/" + $("#chat_id").val()))) {
                    var temp = content.replace("/" + $("#chat_id").val(), "(귓속말) :").split(":");
                    if (temp[1].trim() == "") {
                    } else {
                        $("#messageWindow").html($("#messageWindow").html() + "<p class='whisper'>"
                            + sender + content.replace("/" + $("#chat_id").val(), "(귓속말) :") + "</p>");
                    }
                } else {
                }
            } else {
  
                    $("#messageWindow").html($("#messageWindow").html()
                        + "<div class='d-flex justify-content-start mb-4'><div class='msg_cotainer'>" + content +"<span class='msg_time'>"+time+"</span></div></div>");
                    
           
                
            }
        }
    }
    function onOpen(event,chatId) {
    	
    	console.log("소켓연결성공");
        $("#messageWindow").html("<p class='chat_content'>채팅에 참여하였습니다.</p>");
        
        
    }
    function onError(event) {
        alert(event.data);
    }


    function send() {
    	console.log(inputMessage.value);
        if (inputMessage.value =="") {
        	
        } else {
        	
            $("#messageWindow").html($("#messageWindow").html()
                + "<div class='d-flex justify-content-end mb-4'><div class='msg_cotainer_send'>"+ inputMessage.value +"<span class='msg_time_send'>"+time+"</span></div></div>");
        }
        
        
        webSocket.send($("#chat_id").val() + "|" + inputMessage.value);
        inputMessage.value = "";
        document.getElementById('messageWindow').scrollTop = document.getElementById('messageWindow').scrollHeight;
    }
    //     엔터키를 통해 send함
    function enterkey() {
        if (window.event.keyCode == 13) {
            send();
            
        
    }
	}
    //     채팅이 많아져 스크롤바가 넘어가더라도 자동적으로 스크롤바가 내려가게함
  /*   window.setInterval(function() {
        var elem = document.getElementById('messageWindow');
        elem.scrollTop = elem.scrollHeight;
    },0);  */
</script>
	</body>
</html>
