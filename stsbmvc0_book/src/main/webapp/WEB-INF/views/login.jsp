<%@ page language="java" contentType="text/html; charset=UTF-8"%>
    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>서적관리 V2</title>
    <!-- 부트스트랩 CSS 링크 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        /* 추가적인 CSS 스타일링 */
        body {
            background-color: #f8f9fa;
        }
        .login-container {
            margin-top: 5%;
        }
    </style>
</head>
<body>
    <div class="container login-container">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header">
                        서적 관리시스템 로그인 Ver 2.0
                    </div>
                    <div class="card-body">
                        <form action="loginpro" method="GET" id="loginFrm" >
                            <div class="form-group">
                                <label for="username">관리자 아이디:</label>
                                <input type="text" class="form-control" id="userid" name="userid" placeholder="사용자 이름을 입력하세요">
                            </div>
                            <div class="form-group">
                                <label for="password">비밀번호:</label>
                                <input type="password" class="form-control" id="password" name="password" placeholder="비밀번호를 입력하세요">
                            </div>
                            <button type="button" class="btn btn-primary btn-block">로그인</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- 부트스트랩 JS 스크립트 링크 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        
    <script>
        $('button').click(
            function(){
                // id=admin pw=jquery 같으면 main.html 로 이동하라
                
                let id = $('#userid').val();
                let pw = $('#password').val();
                if(id=='') {
                    alert('아이디가 필요합니다');
                    return;
                }
                if(pw=='') {
                    alert('비밀번호가 필요합니다');
                    return
                }
                
				$('#loginFrm').submit();
            }
        );
    </script>
</body>
</html>
