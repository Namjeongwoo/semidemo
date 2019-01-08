   <%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>signup</title>
<link rel="stylesheet" type="text/css" href="../semiview/login/css/signup.css" />
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<script type="text/javascript">
      var regId = /^[a-zA-Z]{1}[a-zA-Z0-9_]{4,12}$/;
      var regPassword = /^[a-zA-Z]{1}[a-zA-Z0-9!@#$%^&*_]{7,15}$/;
      var regNickname= /^[a-zA-Zㄱ-ㅎ가-힣]{2,12}$/;
      var regEmail= /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
      var regFind_pass_ques= /^[a-zA-Zㄱ-ㅎ가-힣]{1,25}$\s/g;
      var regFind_pass_answ;
      
        var inval_Arr=new Array(5).fill(false);
       
$(document).ready(function(){
   $('form').on('submit', function(){
      
        //아이디
           if(regId.test($('#id').val())){
             inval_Arr[0]=true;
             console.log(inval_Arr[0]);
          }else{
             inval_Arr[0]=false;
             console.log(inval_Arr[0]);
             alert('아이디를 확인하세요');
             return false;
          } 
          
          
          //비밀번호
          if(regPassword.test($('#password').val())&&($('#password').val()==($('#password2').val()))){
             inval_Arr[1]=true;
             console.log(inval_Arr[1]);
          }else{
             inval_Arr[1]=false;   
             console.log(inval_Arr[1]);
             alert('비밀번호를 확인하세요');
             return false;
          }
         // 닉네임 정규식
         if (regNickname.test($('#nickname').val())) {
            inval_Arr[2] = true;   
             console.log(inval_Arr[2]);
         } else {
            inval_Arr[2] = false;
             console.log(inval_Arr[2]);
             alert('닉네임을 확인하세요');
            return false;
         }
        
          // 이메일 정규식
           if(regEmail.test($('#email').val())){
            inval_Arr[3] = true;
             console.log(inval_Arr[3]);
         }else{
            inval_Arr[3]=false;
             console.log(inval_Arr[3]);
             alert('이메일을 확인하세요');
            return false;
         }   
          
        // 비밀번호찾기 질문 정규식
            if(regFind_pass_ques.test($('#pass_ques').val())){
               inval_Arr[4]=true;
            }else{
               inval_Arr[4]=false;
               alert("비밀번호 찾기 질문을 확인하세요");
               return false;
            }

         var validAll = true;
         for(var i = 0; i < inval_Arr.length; i++){
            
            if(inval_Arr[i] == false){
               validAll = false;
               console.log(validAll);
            }
         }
         
         if(validAll == true){ // 유효성 모두 통과
            alert('회원가입이 성공적으로 완료되었습니다!');
         } else{
            return false ;
         }
    });    
   
     $("#id").blur(function() {
            if (regId.test($(this).val())) {
               console.log(regId.test($(this).val()));
               $("#idCheck").text('');
            } else {
               $('#idCheck').text('아이디는 영문자, 숫자 조합 5~15 글자이어야 하오.');
               $('#idCheck').css('color', 'red');
            }
     });
     $("#password").blur(function() {
            if (regPassword.test($(this).val())) {
               console.log(regPassword.test($(this).val()));
               $("#passwordCheck").text('');
            } else {
               $('#passwordCheck').text('패스워드는 영문자로 시작해 8~15글자이어야 하오.');
               $('#passwordCheck').css('color', 'red');
            }
     });
     
     $("#password2").blur(function() {
    	     	 
         if ($('#password').val()==$('#password2').val()) {
            $("#password2Check").text('');
         } else {
            $('#password2Check').text('패스워드 다시 확인해봐봐');
            $('#password2Check').css('color', 'red');
         }
  	});
     
     $("#nickname").blur(function() {
            if (regNickname.test($(this).val())) {
               console.log(regNickname.test($(this).val()));
               $("#nicknameCheck").text('');
            } else {
               $('#nicknameCheck').text('닉네임은 영문자, 한글 조합 2~12 글자이어야 합니다.');
               $('#nicknameCheck').css('color', 'red');
            }
     });
     $("#email").blur(function() {
            if (regEmail.test($(this).val())) {
               console.log(regEmail.test($(this).val()));
               $("#emailCheck").text('');
            } else {
               $('#emailCheck').text('이메일 양식을 지켜주세요.');
               $('#emailCheck').css('color', 'red');
            }
     });
     $("#pass_ques").blur(function() {
            if (regFind_pass_ques.test($(this).val())) {
               console.log(regFind_pass_ques.test($(this).val()));
               $("#pass_quesCheck").text('');
            } else {
               $('#pass_quesCheck').text('영문자, 숫자 조합 20글자 내로 작성해주세요.');
               $('#pass_quesCheck').css('color', 'red');
            }
     });
     
     
});

</script>
<!-- <script type="text/javascript" src="../semiview/login/jquery.js"></script> -->

</head>
<body>
   <img id="top_bar" alt="" src="../semiview/images/top_bar.jpg" />
   <div class="go_main">
      <a href="*">
         <img id="logo" alt="home" src="../semiview/images/logo.png" />
      </a>
   </div>
   <h1 style="padding-top: 20px; text-align: center;">
      <img id="sign_img" src="../semiview/images/top_banner.png" />
   </h1>
   <div id="signUp">
      <form name="frm" id="frm" method="post" action="signUpWrite.do">
         <div class="form-group">
            <input type="text" class="form-control" id="id" name="id" placeholder="아이디" maxlength="20"/>
         </div>
         <div id="idCheck"> </div>
         <div class="form-group">
            <input type="password" class="form-control" id="password" name="password" placeholder="비밀번호" />
         </div>
         <div id="passwordCheck"> </div>
         <div class="form-group">
            <input type="password" class="form-control" id="password2" name="password2" placeholder="비밀번호 확인" />
         </div>
         <div id="password2Check"> </div>
         <div class="form-group">
            <input type="text" class="form-control" id="nickname" name="nickname" minlength="2" placeholder="닉네임" />
         </div>
         <div id="nicknameCheck"> </div>
         <div class="form-group">
            <input type="email" name="email" id="email" placeholder="이메일" />
         </div>
         <div id="emailCheck"> </div>
         <div class="form-control" id="gender">
            <div class="btn-group" data-toggle="buttons">
               <label class="btn btn-primary active">
                  <input type="radio" id="male" name="gender" autocomplete="off" value="남자" checked />남자
               </label>
               <label class="btn btn-primary">   
                  <input type="radio" id="female" name="gender" autocomplete="off" value="여자" checked />여자
               </label>
            </div>
         </div>
         <div class="form-control">
            <input type="text" id="pass_ques" name="pass_ques" placeholder="비밀번호 찾기 질문" />
         </div>
         <div id="pass_quesCheck"> </div>
         <div class="form-control">
            <input type="text" id="pass_answ" name="pass_answ" placeholder="비밀번호 찾기 답" />
         </div>
         <div id="pass_answCheck"> </div>
         <div>
            <input type="submit" class="btn btn-primary from-control" id="signBtn" value="회원가입"/>
         </div>
      </form>

   </div>
</body>
</html>





















