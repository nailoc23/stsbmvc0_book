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
      <h2>도서 목록</h2>
      
      <!-- 검색창 -->
      <div class="input-group mb-3">
         <input type="text" class="form-control" placeholder="검색어 입력" value="" id="searchWord">
         <div class="input-group-append">
            <button class="btn btn-outline-secondary" type="button" id="searchBtn">검색</button>
         </div>
      </div>
      
      
      
      <table class="table table-striped mt-4">
         <thead>
            <tr>
               <th scope="col">#</th>
               <th scope="col">상품명</th>
               <th scope="col">가격</th>
               <th scope="col">재고</th>
               <th scope="col">조치</th>
            </tr>
         </thead>
         
         <tbody>
         
         
     		<c:forEach var="item" items="${booklist }">
            <tr>
               <th scope="row">${item.bkid }</th>
               <td>${item.title }</td>
               <td>${item.price }</td>
               <td>${item.stock }</td>
               <td>
                  <!-- <button type="button" class="btn btn-primary btn-sm" onclick="viewBook()">보기</button> -->
                  <button type="button" class="btn btn-primary btn-sm updateBtn">수정</button>
                  <button type="button" class="btn btn-danger btn-sm" onclick="delBook()">삭제</button>
               </td>
            </tr>
            </c:forEach>
        
            <!-- 추가적인 상품 행은 이곳에 추가할 수 있습니다 -->
         </tbody>
         
      </table>
      
      <div class="text-right">
         <a href="#" class="btn btn-primary regBtn">도서추가</a>
      </div>
      
   </div>
   <!-- 푸터 -->
   <footer class="text-muted text-center py-4">
      <div class="container">
         <p class="mb-0">&copy; 2024 기업 관리 시스템. All rights reserved.</p>
      </div>
   </footer>
   
   <!-- 수정 팝업창 -->
   <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
         <div class="modal-content">
            <div class="modal-header">
               <h5 class="modal-title" id="editModalLabel">상품 수정</h5>
               <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
               </button>
            </div>
            <div class="modal-body">
               <!-- 수정 내용을 입력하는 폼 -->
               <form>
               	  <!-- 도서번호 숨김처리 -->
               	  <input type="hidden" id="editBkid">
                  <div class="form-group">
                     <label for="editProductName">상품명:</label>
                     <input type="text" class="form-control" id="editTitle">
                  </div>
                  <div class="form-group">
                     <label for="editPrice">가격:</label>
                     <input type="text" class="form-control" id="editPrice">
                  </div>
                  <div class="form-group">
                     <label for="editStock">재고:</label>
                     <input type="number" class="form-control" id="editStock">
                  </div>
               </form>
            </div>
            <div class="modal-footer">
               <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
               <button type="button" class="btn btn-primary" id="saveBtn">저장</button>
            </div>
         </div>
      </div>
   </div>
   
   <!-- 추가 팝업 -->
   <div class="modal fade" id="regModal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true">
	   <div class="modal-dialog" role="document">
	      <div class="modal-content">
	         <div class="modal-header">
	            <h5 class="modal-title" id="editModalLabel">도서 등록</h5>
	            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	               <span aria-hidden="true">&times;</span>
	            </button>
	         </div>
	         <div class="modal-body">
	            <!-- 수정 내용을 입력하는 폼 -->
	            <form>
	               
	               <div class="form-row">
	                  <div class="form-group col-md-12">
	                     <label for="title">도서명:</label>
	                     <input type="text" class="form-control" id="title">
	                  </div>
	                  
	               </div>
	               <div class="form-row">
	                  
	                  <div class="form-group col-md-12">
	                     <label for="isbn">ISBN:</label>
	                     <input type="text" class="form-control" id="isbn">
	                  </div>
	               </div>
	               <div class="form-row">
	                  <div class="form-group col-md-6">
	                     <label for="author">저자:</label>
	                     <input type="text" class="form-control" id="author">
	                  </div>
	                  <div class="form-group col-md-6">
	                     <label for="publisher">출판사:</label>
	                     <input type="text" class="form-control" id="publisher">
	                  </div>
	               </div>
	               
	               <div class="form-row">
	                 
	                  <div class="form-group col-md-6">
	                     <label for="price">가격:</label>
	                     <input type="number" class="form-control" id="price">
	                  </div>
	                  
	                  <div class="form-group col-md-6">
	                     <label for="stock">재고:</label>
	                     <input type="number" class="form-control" id="stock">
	                  </div>
	               </div>
	              
	            </form>
	         </div>
	         <div class="modal-footer">
	            <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
	            <button type="button" class="btn btn-primary" id="newRegBtn">등록</button>
	         </div>
	      </div>
	   </div>
	</div>
   
   
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
   
   <script>
   		$(document).ready(function(){
   			
   			$('#searchWord').val('');
	   			
   			$('.updateBtn').click(function(){
   				
   				$row = $(this).closest('tr'); // 현재 내가 선택한 태그 가장 가까운 상위 tr
   	   			$id = $row.find('th').text();
   				$title = $row.find('td:eq(0)').text();
   				$price = $row.find('td:eq(1)').text();
   				$stock = $row.find('td:eq(2)').text();
   	   			console.log($id);
   	   			console.log($title);
   	   			console.log($price);
   	   			console.log($stock);
   	   			$('#editBkid').val($id);
   	   			$('#editTitle').val($title);
   	   			$('#editPrice').val($price);
   	   			$('#editStock').val($stock);
   	   	
   	   			$('#editModal').modal('show');
   	   			   	   			   	
   	   		});
   			
   			$('#saveBtn').click(function(){
   				console.log('저장버튼클릭');
   				var id = $('#editBkid').val();
   				var title = $('#editTitle').val();
   				var price = $('#editPrice').val();
   				var stock = $('#editStock').val();
   				console.log('도서번호:'+ id);
   				console.log('도서명:'+ title);
   				console.log('가격:'+ price);
   				console.log('재고량:'+ stock);
   				ok=confirm("정말로 수정하시겠습니까?");
   				if(ok==true) {
   					
   					$.ajax({
   						url: 'book_modpop.jsp',
   						method: 'POST',
   						data: { "bkid" : id, "title" : title, 
   							    "price" : price, "stock" : stock},
   						datatype: 'json',
   		   				success : function(response){ 
   		   					console.log(response);
   		   					var data = JSON.parse(response);
	   						console.log('서버응답값:'+ data.result);	
	   						if( data.result == 1 ) {
	   							$('#editModal').modal('hide');
	   							location.reload();	
	   						}
   		   				},
   		   				error: function(xhr, status, error){
   		   					console.error(status, error);
   		   					$('#editModal').modal('hide');
   		   				}
   					});
   				}
   				   				
   			});
   			
			$('.regBtn').click(function(){
   				
   				$('#regModal').modal('show');
   			});
			
			// 새로 등록
			$('#newRegBtn').click(function() {
   				
				console.log('새로등록 버튼클릭');
   				var title = $('#title').val();
   				var isbn = $('#isbn').val();
   				var author = $('#author').val();
   				var publisher = $('#publisher').val();
   				var price = $('#price').val();
   				var stock = $('#stock').val();
   			
   				console.log('도서명:'+ title);
   				console.log('ISBN:'+ isbn);
   				
   				console.log('저자:'+ author);
   				console.log('출판사:'+ publisher);
   				
   				console.log('가격:'+ price);
   				console.log('재고량:'+ stock);
   				
   				if(title=='') { 	alert('도서명을 입력하세요!');	return;		}
   				if(isbn=='') { 	alert('ISBN을 입력하세요!');	return;		}
   				if(author=='') { 	alert('저자명을 입력하세요!');	return;		}
   				if(price=='') { 	alert('가격을 입력하세요!');	return;		}
   				
   				ok=confirm("등록하시겠습니까?");
   				if(ok==true) {
   					
   					$.ajax({
   						url: 'bookreg',
   						method: 'POST',
   						data: { "title" : title, "isbn" : isbn, 
   							    "author" : author, "publisher" : publisher,
   							    "price" : price, "stock" : stock},
   						datatype: 'json',
   						success: function (data, status, xhr) {
   							console.log(data)
   						},
   						error: function (xhr, status, error) {
   							console.log(error)
   						}
   		   				
   					
  					});
   				}
			});
   				
   			$('#searchBtn').click(function(){
   				console.log('검색버튼클릭');
   				let searchword = $('#searchWord').val();
   				location.href='booklist.jsp?search='+searchword;
   			});
   			
   		});
   		
   		function delBook(id) {
   			console.log("파라미터값:"+ id);
   			ok=confirm("정말로 삭제하시겠습니까?");
   			if(ok==true) {
	   			$.ajax({
	   				url: 'book_delpro.jsp',
	   				method: 'POST',
	   				data: {bkid: id},
	   				datatype: 'json',
	   				success : function(response){
	   					console.log('응답결과:'+ response);
	   					var data = JSON.parse(response);
	   					console.log('서버응답값:'+ data.result);	
	   					if( data.result == 1 ) {
	   						location.reload();	
	   					}	
	   				},
	   				error: function(xhr, status, error) {
	   					console.error(status, error);
	   				}
	   				
	   			}); // 비동기
   			}
   		}
   		
   		function viewBook(id) {
   			console.log("파라미터값:"+ id);
   			location.href='book_detail.jsp?bkid='+id; // ?뒤에 코드 GET방식 값전송
   		}
   		
   		function updateBook(id) {
   			console.log("파라미터값:"+ id);
   		}
   </script>
</body>
</html>
    