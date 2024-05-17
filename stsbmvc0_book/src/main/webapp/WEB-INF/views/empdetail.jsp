<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>관리자 정보 수정</title>
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
   <style>
      /* 초기 스타일 */

      .banner-img {
         height: 200px;
         width: 100%;
         background-image: url('images/banner1_clouds.jpg');
         background-size: cover;
         background-position: center;
      }

      footer {
         background-color: #333;
         color: white;
         padding: 20px;
         margin-top: 50px;
      }
      footer p {
         color: white;
      }
   </style>
</head>
<body>
  <!-- 네비게이션 바 -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <div class="container">
      <a class="navbar-brand" href="#">서적 관리 시스템 Ver2.0</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
    
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item active">
            <a class="nav-link" href="#">홈</a>
          </li>
          
          
          <li class="nav-item">
            <a class="nav-link" href="booklist">도서 관리</a>        
         </li>

          <li class="nav-item">
            <a class="nav-link" href="orderlist">주문 관리</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="boardlist">게시판 관리</a>
          </li>
          
          <!-- 관리자정보 -->
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            관리자
            </a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
               <a class="dropdown-item" href="empdetail">관리자 정보</a>
               <a class="dropdown-item" href="empchangepw">비밀번호 변경</a>
               <a class="dropdown-item" href="logout">로그 아웃</a>
            </div>
         </li>
          <!-- 추가적인 네비게이션 항목을 이곳에 추가할 수 있습니다 -->
        </ul>
      </div>
      
      
    </div>
  </nav>
  
  <!-- 배너 이미지 -->
  <div class="banner-img"></div>
  <!-- 관리자 정보 수정 섹션 -->

   <!-- 관리자 정보 수정 섹션 -->
  
   <div class="container mt-4">
    <h2>관리자 정보 수정</h2>
    <!-- enctype='multipart/form-data' -->
    <form id="updateFrm" action="empmodpro" method="post" enctype='multipart/form-data'> 
    <!-- 파일전송시 method=POST -->
    
        <div class="form-group">
            <label for="name">이름:</label>
            <input type="text" class="form-control" id="name" name="name" 
                   value="${empinfo.name }" required>
        </div>
        
        <div class="form-group">
            <label for="phone">전화번호:</label>
            <input type="tel" class="form-control" id="phone" name="phone" 
                   value="${empinfo.phone }">
        </div>

        <div class="form-group">
            <label for="designation">업무:</label>
            <input type="text" class="form-control" id="designation" name="designation" 
                   value="${empinfo.designation }" required>
        </div>
        
        <div class="form-group">
          <label for="profile-image">프로필 사진:</label>
          <input type="file" class="form-control-file" id="imgfile" name="imgfile">

          <img id="preview-image" src="upload/${empinfo.photo }" alt="프로필 사진 미리보기" style="display: block; max-width: 200px; margin-top: 10px;">
        </div>

        <button type="submit" class="btn btn-primary" id="updateBtn">수정</button>
        <button type="button" class="btn btn-primary">취소</button>
    </form>
    </div>
   
    
   <!-- 푸터 -->
   <footer class="text-muted text-center py-4">
      <div class="container">
         <p class="mb-0">&copy; 2024 기업 관리 시스템. All rights reserved.</p>
      </div>
   </footer>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
   
   <script>
   		$(document).ready(function(){   	
   			
   			// Bootstrap의 모달 함수 호출하여 모달 열기
   		    $('#exampleModal').modal('show');
   			
   			$('#updateBtn').click(function(event){
   				
   				event.preventDefault();
   				
   				if($('#name').val()=="") {
   					alert("이름을 입력하세요");
   					return;
   				}
   				if($('#designation').val()=="") {
   					alert("하는 일을 입력하세요");
   					return;
   				}
   				
   				// emp_modpro.jsp로 전송
   				ok = confirm("수정하시겠습니까?");
   				if(ok==true) {
   					
   					var newAction = "empmodpro"+"/admin"; // 변경할 action URL
   			        $('#updateFrm').attr('action', newAction);   			   
   			        $('#updateFrm').unbind('submit').submit();
   			        $('#updateFrm').submit();
   			        
   				}else{
   					return;
   				}
   				
   			});
   		});
   </script>
   
   <!-- 메시지 팝업 모달 -->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <!-- 모달 헤더 -->
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">메시지 팝업</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <!-- 모달 내용 -->
                <div class="modal-body">
                    <!-- 메시지 내용 -->
                    <p>메시지 팝업 예제입니다.</p>
                </div>
                <!-- 모달 푸터 -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
