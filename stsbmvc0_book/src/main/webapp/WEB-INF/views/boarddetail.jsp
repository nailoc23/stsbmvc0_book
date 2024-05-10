<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>상품 관리 페이지</title>
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
            <a class="nav-link" href="#">주문 관리</a>
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
  <!-- 상품 목록 섹션 -->

   <!-- 상품 목록 섹션 -->
   <div class="container mt-4">
    <h2>글읽기</h2>
    <form action="boarddetailpro" method="GET" id="writeFrm">
    	<input type="hidden" name="num" id="num" value="${board.num }">
        <div class="form-group">
            <label for="title">제목:</label>
            <input type="text" class="form-control" id="subject" name="subject" value="${board.subject }" required>
        </div>
        <div class="form-group">
            <label for="isbn">작성자:</label>
            <input type="text" class="form-control" id="name" name="name" value="${board.num }" required>
        </div>
        <div class="form-group">
            <label for="content">내용:</label>
            <textarea class="form-control" name="content" id="content" cols="30" rows="10" required>${board.content }</textarea>
        </div>
       
        <button type="button" class="btn btn-primary" id="updateBtn">수정</button>
        <button type="button" class="btn btn-primary" id="deleteBtn">삭제</button>
        <button type="button" class="btn btn-primary" onclick="history.back()">목록</button>
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
   		$('#deleteBtn').click(function(){
   			
   			num = $('#num').val();
   			//sconsole.log(num);
   			ok=confirm("정말로 삭제하시겠습니까?");
   			if(ok==true) {
   				location.href="/boarddetaildel?num="+num;
   			}
   			
   		});
   </script>
   
</body>
</html>   