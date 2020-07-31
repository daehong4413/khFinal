<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>지도</title>
	<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
	<style type="text/css">
		.link {
			cursor: pointer;
			color : blue;
			float: left;
			font-size: 8px;
   			font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
		}
		.wrap{
			display: flex;
			flex-direction: row;
		}
		pre{
			float: left;
			margin : 0 0 0 0;
		}
		p{
			margin : 0 0 0 0;
		}		
		.close {
			position: absolute;
			top: 8px;
			right: 8px;
			color: #888;
			width: 18px;
			height: 18px;
			background: url('/resources/images/common/close_icon.svg');
			background-size : cover;
			background-repeat : no-repeat;
			z-index: 1;
		    
		}
		.close:hover {
   			cursor: pointer;
		}
		.card-footer{
			position: relative;		
		}
		.weatherIcon {
		   	position: absolute;
		   	bottom: 5px;
		   	right: 5px;
		   	color: #888;
		   	width: 30px;
			height: 30px;
			background-size : cover;
			background-repeat : no-repeat;
		}
		.temperature{
			position : absolute;
			right : 40px;
			font-size: 8px;
   			font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
		}
	</style>
</head>
<body>
	<div id="map" style="width: 100%; height: 100vh;"></div>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6aef0f8cb3601f757909683f15e28741&libraries=services,clusterer"></script>
	<script>
		function load_data(place, url, pagination, num){
	        $.ajax({
	            url: 'search.do',
	            data : {url : url,
	            		lat : place.y,
            			lon : place.x},
	            type: 'GET',
	            
	        }).done(function(data) {
	        	if(data.hasOwnProperty("placeData")){
	        		displayMarker(place, data, pagination, num);
	        	}
	        });
	
	    } 
		
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
		        level: 14 // 지도의 확대 레벨
		    };  
		
		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		
		var clusterer = new kakao.maps.MarkerClusterer({
			map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체
		    averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정
		    minLevel: 10, // 클러스터 할 최소 지도 레벨
		});

	    // 마커 클러스터러에 클릭이벤트를 등록합니다
	    // 마커 클러스터러를 생성할 때 disableClickZoom을 true로 설정하지 않은 경우
	    // 이벤트 헨들러로 cluster 객체가 넘어오지 않을 수도 있습니다
	    kakao.maps.event.addListener(clusterer, 'clusterclick', function(cluster) {

	        // 현재 지도 레벨에서 1레벨 확대한 레벨
	        var level = map.getLevel()-1;

	        // 지도를 클릭된 클러스터의 마커의 위치를 기준으로 확대합니다
	        map.setLevel(level, {anchor: cluster.getCenter()});
	    });
		
		// 장소 검색 객체를 생성합니다
		var ps = new kakao.maps.services.Places(); 
		
		// 키워드로 장소를 검색합니다
		ps.keywordSearch('낚시', placesSearchCB); 
		
		// 키워드 검색 완료 시 호출되는 콜백함수 입니다
		function placesSearchCB (data, status, pagination) {
		    if (status === kakao.maps.services.Status.OK) {
				
		        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
		        // LatLngBounds 객체에 좌표를 추가합니다
		        var bounds = new kakao.maps.LatLngBounds();
		
		        for (var i=0; i<data.length; i++) {
		            if(data[i].place_url != null){
		            	load_data(data[i], data[i].place_url, pagination, i);
			            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));	
		            }
		        }       
		
		        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
		        //map.setBounds(bounds);
		        var currentPage = pagination.current+1;
		        if(currentPage<=pagination.last){
		        	pagination.gotoPage(currentPage);
		        	if(currentPage<=pagination.last){
		        		map.setBounds(bounds);
		        	}
		        }
		    } 
		}
		
		var overlays = new Map();	//오버레이 Map
		var overlay;
		var titles = new Map();	//제목 Map
		
		//팝업 Open 기능
		function open_pop(i) {
			
	        var lat = overlays.get(i).getPosition().Ga;
	        var lng = overlays.get(i).getPosition().Ha;
	        var width = 650, height = 650;
	        var popupX = (document.body.offsetWidth / 2) - (width / 2);
	        //&nbsp;만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음

	        var popupY= (window.screen.height / 2) - (height / 2);
	        //&nbsp;만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음
	           
	        var url = "https://map.kakao.com/link/to/"+titles.get(i)+"," + lng + ","+ lat;
	        var option    = "width = " + width + ", height = " + height +", "
	                    + "top = "+ popupY + ", left = " + popupX + ", location = no";
	        var title = "길찾기";
        	console.log(url);
        	window.open(url, title, option);
		}
		
		// 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
		function closeOverlay(i) {
			overlays.get(i).setMap(null);
		}
		// 각 마커(낚시터 별) 홈페이지 접근 함수
		function openInNewTab(url) {
			var win = window.open(url, '_blank');
			win.focus();
		}
		
		// 날씨 정보 접고 펴기
		function collapseBox(i) {
			if($("#weatherList"+i)[0].style["display"]=="block"){
				$(".collapse"+i).
		       	css({"background":"url('/resources/images/common/open.png')", 
		    	   	"background-repeat":"no-repeat",
		    	   	"background-size" : "cover",
					"position" : "absolute",
					"right" : "5px",
					"top" : "40%",
					"width" : "30px",
					"height" : "30px",
					"border" : "0",
					"outline" : "0"});
		       	$("#weatherList"+i).css({"display":"none"});
			}else{
				$(".collapse"+i).
		       	css({"background":"url('/resources/images/common/close.png')", 
		    	   	"background-repeat":"no-repeat",
		    	   	"background-size" : "cover",
					"position" : "absolute",
					"right" : "5px",
					"top" : "40%",
					"width" : "30px",
					"height" : "30px",
					"border" : "0",
					"outline" : "0"});
		       	$("#weatherList"+i).css({"display":"block"});
			}
		}
		
		// 지도에 마커를 표시하는 함수입니다
		function displayMarker(place, data, pagination, num) {
			var idx = ((pagination.current-1) * pagination.perPage) + num;
			//console.log(place);
			//console.log(data);
			var imageSrc = '/resources/images/common/icon.png', // 마커이미지의 주소입니다    
    		imageSize = new kakao.maps.Size(45, 50), // 마커이미지의 크기입니다
    		imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
      
			// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
			var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption)

		    // 마커를 생성하고 지도에 표시합니다
		    var marker = new kakao.maps.Marker({
		        //map: map,
		        position: new kakao.maps.LatLng(place.y, place.x),
		    	image: markerImage 
		    });
		 	
		    idx++;
		    marker.setTitle(place.place_name);
		    titles.set(idx, place.place_name);
		    
		 	// 클러스터러에 마커들을 추가합니다
	        clusterer.addMarker(marker);
		    
		    var homepage, phone, weather, temperature, photo;
		    if(data.placeData.basicInfo.hasOwnProperty("homepage")){
		    	homepage = '<div class="link" onclick="openInNewTab(\''+data.placeData.basicInfo.homepage+'\');">홈페이지</div><pre> </pre>';
		    }else{
		    	homepage = '';
		    }
		    
		    if(place.hasOwnProperty("phone") && place.phone != ''){
		    	phone = '						<small class="text-muted">' + ' (Tel) '+ place.phone +'</small><br>';
		    }else{
		    	phone='';
		    }
			
		    if(data.hasOwnProperty("weatherData")){
		    	weather = '			 <div class="weatherIcon"  title="날씨" style="background-image:url(\'http://openweathermap.org/img/w/'+data.weatherData.weather[0].icon+'.png\')"></div>'
		    	temperature = '			 <div class="temperature"  title="온도">최고 : ' + data.weatherData.main.temp_max.toFixed(2) + '/최저 : ' + data.weatherData.main.temp_min.toFixed(2) +'</div>'
		    	
		    }else{
		    	weather = '';
		    	temperature = '';
		    }
		    
		    if(data.placeData.basicInfo.hasOwnProperty("mainphotourl")){
		    	photo = data.placeData.basicInfo.mainphotourl
		    }else{
		    	photo = "/resources/images/common/thumbnail.svg"
		    }
		    var weatherList;
		    if(data.hasOwnProperty("weatherList")){
		    	if(data.weatherList.hasOwnProperty("daily")){
		    		var temp = '';
		    		for(var x = 0; x < data.weatherList.daily.length; x++){
		    			var date = new Date(data.weatherList.daily[x].dt * 1000);
		    			temp += 
		    		'			<tr>' +
					'				<th scope="row">'+ date.getFullYear() + "/" + ("0" +(date.getMonth()+1)).substr(-2) + "/" + ("0" + date.getDate()).substr(-2) + '</th>' +
					'				<td><img src="http://openweathermap.org/img/w/'+data.weatherList.daily[x].weather[0].icon+'.png"></td>' +
					'				<td>'+data.weatherList.daily[x].temp.max.toFixed(2)+'℃</td>' +
					'				<td>'+data.weatherList.daily[x].temp.min.toFixed(2)+'℃</td>' +
					'			</tr>';
			    	}
		    		
		    		weatherList =
		    		'<div class="bs-example" id="weatherList'+idx+'">' +
		    		'	<div class="container-fluid">' +
					'		<div class="row">' + 
					'			<table class = "table table-dark">' +
					'				<thead>' + 
					'					<tr>' +
					'						<th scope="col">날짜</th>' +
					'						<th scope="col">날씨</th>' +
					'						<th scope="col">최고</th>' +
					'						<th scope="col">최저</th>' +
					'					</tr>' +
					'				</thead>' +
					'				<tbody>' +temp
					'				</tbody>' +
					'			</table>' +
					'		</div>'+
					'	</div>' +
					'</div>';
		    	}else{
		    		weatherList
			    	='';
		    	}
		    }else{
		    	weatherList = '';
		    }

		    // 인포윈도우로 장소에 대한 설명을 표시합니다
		 	var content =
		 	'<div class="wrap">' +
			'<div class="bs-example" id = "body1">'	+
		 	'	<div class="close" onclick="closeOverlay('+idx+')" title="닫기"></div>' +
			'	<div class="container-fluid">' +
			'		<div class="row">' + 
			'			<div class="card-deck">' +
			'				<div class="card">' + 
			'					<img src="'+photo+'" class="card-img-top" alt="...">' + 
			'					<div class="card-body">'+
			'						<h5 class="card-title">' + place.place_name + '</h5>' +
			'						<small class="text-muted">' + place.category_name + '</small><br>' +  
			'						<small class="text-muted">' + place.address_name + '</small><br>' + phone +
			'						<input type="button" class="collapse'+idx+'" onclick="collapseBox('+idx+')">' +				
			'					</div>' + 
			'					<div class="card-footer">' +
			homepage +'					 	<div class="link" onclick = "open_pop('+idx+')"> 길찾기 </div>' + temperature + weather +
			'					</div>' +
			'				</div>' + 
			'			</div>' + 
			'		</div>' +
			'	</div>' +
			'</div>' + 
			weatherList +
			'</div>';	

            
         	// 마커 위에 커스텀오버레이를 표시합니다
         	// 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
		    overlay = new kakao.maps.CustomOverlay({
			    content: content,
			    map: map,
				position: marker.getPosition()       
			});
		    
         	overlays.set(idx, overlay);
         	
		    // 마커에 클릭이벤트를 등록합니다
		    kakao.maps.event.addListener(marker, 'click', function() {
		        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
		        
		    	overlays.get(idx).setMap(map);
		       	$(".collapse"+idx).
		       	css({"background":"url('/resources/images/common/open.png')", 
		    	   	"background-repeat":"no-repeat",
		    	   	"background-size" : "cover",
					"position" : "absolute",
					"right" : "5px",
					"top" : "40%",
					"width" : "30px",
					"height" : "30px",
					"border" : "0",
					"outline" : "0"});
		       	$("#weatherList"+idx).css({"display":"none"});
		    });
			
		    overlay.setMap(null);
		}
	</script>
</body>
</html>