<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>주문 목록</title>
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
   <style>
      /* 추가적인 CSS 스타일링 */
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
   <!-- 게시판 목록 섹션 -->
   <div class="container mt-4">
      <h2>주문 목록</h2>
      <table class="table table-striped mt-4">
         <thead>
            <tr>
               <th scope="col">#</th>
               <th scope="col">날짜</th>
               <th scope="col">품목</th>
               <th scope="col">수량</th>
               <th scope="col">단가</th>
               <th scope="col">총금액</th>
               <th scope="col">비고</th>
            </tr>
         </thead>
         <tbody>
              
            <tr>
               <th scope="row">1</th>
               <td>신영희</td>
               <td>HTML5</td>
               <td>10</td>
               <td>20,000</td>
               <td>100,000</td>
               <td>비고</td>
            </tr>
           
            
            <!-- 추가적인 게시물 행은 이곳에 추가할 수 있습니다 -->
         </tbody>
      </table>
      
       <div class="text-right">
         <a href="boardpost.jsp" class="btn btn-primary">글쓰기</a>
      </div>
      <!-- bookadd.jsp 폼을 수정해서 boardpost.jsp 추가 -->
      <!-- 작성자, 제목, 내용 (나머지는 기본값) 등록 후 게시판 목록으로 이동-->
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
</body>
</html>
    