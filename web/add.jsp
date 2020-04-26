<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<!DOCTYPE html>
<html><head>
  <style >*, *:before, *:after {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
  }

  input, button {
    border: none;
    outline: none;
    background: none;
    font-family: 'Open Sans', Helvetica, Arial, sans-serif;
  }

  .tip {  
    font-size: 20px;
    margin: 40px auto 50px;
    text-align: center;
  }

  .cont {
    overflow: hidden;
    position: relative;
    width: 900px;
    height: 550px;
    margin: 0 auto 100px;
    background: #fff;
    margin-top: 70px;
  }
  .sig{
    margin-left:200px; 
    width: 950px;
    height: 600px;
  }
  body{
    background-color: black;
  }
  .form {
    position: relative;
    width: 640px;
    height: 100%;
    transition: -webkit-transform 1.2s ease-in-out;
    transition: transform 1.2s ease-in-out;
    transition: transform 1.2s ease-in-out, -webkit-transform 1.2s ease-in-out;
    padding: 50px 30px 0;
  }

  .sub-cont {
    overflow: hidden;
    position: absolute;
    left: 640px;
    top: 0;
    width: 900px;
    height: 100%;
    padding-left: 260px;
    background: #fff;
    transition: -webkit-transform 1.2s ease-in-out;
    transition: transform 1.2s ease-in-out;
    transition: transform 1.2s ease-in-out, -webkit-transform 1.2s ease-in-out;
  }
  .cont.s--signup .sub-cont {
    -webkit-transform: translate3d(-640px, 0, 0);
            transform: translate3d(-640px, 0, 0);
  }

  button {
    display: block;
    margin: 0 auto;
    width: 260px;
    height: 36px;
    border-radius: 30px;
    color: #fff;
    font-size: 15px;
    cursor: pointer;
  }

  .img {
    overflow: hidden;
    z-index: 2;
    position: absolute;
    left: 0;
    top: 0;
    width: 260px;
    height: 100%;
    padding-top: 360px;
  }
  .img:before {
    content: '';
    position: absolute;
    right: 0;
    top: 0;
    width: 900px;
    height: 100%;
    background-image: url("https://s3-us-west-2.amazonaws.com/s.cdpn.io/142996/sections-3.jpg");
    background-size: cover;
    transition: -webkit-transform 1.2s ease-in-out;
    transition: transform 1.2s ease-in-out;
    transition: transform 1.2s ease-in-out, -webkit-transform 1.2s ease-in-out;
  }
  .img:after {
    content: '';
    position: absolute;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.6);
  }
  .cont.s--signup .img:before {
    -webkit-transform: translate3d(640px, 0, 0);
            transform: translate3d(640px, 0, 0);
  }
  .img__text {
    z-index: 2;
    position: absolute;
    left: 0;
    top: 50px;
    width: 100%;
    padding: 0 20px;
    text-align: center;
    color: #fff;
    transition: -webkit-transform 1.2s ease-in-out;
    transition: transform 1.2s ease-in-out;
    transition: transform 1.2s ease-in-out, -webkit-transform 1.2s ease-in-out;
  }
  .img__text h2 {
    margin-bottom: 10px;
    font-weight: normal;
  }
  .img__text p {
    font-size: 14px;
    line-height: 1.5;
  }
  .cont.s--signup .img__text.m--up {
    -webkit-transform: translateX(520px);
            transform: translateX(520px);
  }
  .img__text.m--in {
    -webkit-transform: translateX(-520px);
            transform: translateX(-520px);
  }
  .cont.s--signup .img__text.m--in {
    -webkit-transform: translateX(0);
            transform: translateX(0);
  }
  .img__btn {
    overflow: hidden;
    z-index: 2;
    position: relative;
    width: 100px;
    height: 36px;
    margin: 0 auto;
    background: transparent;
    color: #fff;
    text-transform: uppercase;
    font-size: 15px;
    cursor: pointer;
  }
  .img__btn:after {
    content: '';
    z-index: 2;
    position: absolute;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    border: 2px solid #fff;
    border-radius: 30px;
  }
  .img__btn span {
    position: absolute;
    left: 0;
    top: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    width: 100%;
    height: 100%;
    transition: -webkit-transform 1.2s;
    transition: transform 1.2s;
    transition: transform 1.2s, -webkit-transform 1.2s;
  }
  .img__btn span.m--in {
    -webkit-transform: translateY(-72px);
            transform: translateY(-72px);
  }
  .cont.s--signup .img__btn span.m--in {
    -webkit-transform: translateY(0);
            transform: translateY(0);
  }
  .cont.s--signup .img__btn span.m--up {
    -webkit-transform: translateY(72px);
            transform: translateY(72px);
  }

  h2 {
    width: 100%;
    font-size: 26px;
    text-align: center;
  }

  label {
    display: block;
    width: 260px;
    margin: 25px auto 0;
    text-align: center;
  }
  label span {
    font-size: 12px;
    color: #cfcfcf;
    text-transform: uppercase;
  }

  input {
    display: block;
    width: 100%;
    margin-top: 5px;
    padding-bottom: 5px;
    font-size: 16px;
    border-bottom: 1px solid rgba(0, 0, 0, 0.4);
    text-align: center;
  }

  .forgot-pass {
    margin-top: 15px;
    text-align: center;
    font-size: 12px;
    color: #cfcfcf;
  }

  .submit {
    margin-top: 40px;
    margin-bottom: 20px;
    background: #d4af7a;
    text-transform: uppercase;
  }

  .fb-btn {
    border: 2px solid #d3dae9;
    color: #8fa1c7;
  }
  .fb-btn span {
    font-weight: bold;
    color: #455a81;
  }

  .sign-in {
    transition-timing-function: ease-out;
  }
  .cont.s--signup .sign-in {
    transition-timing-function: ease-in-out;
    transition-duration: 1.2s;
    -webkit-transform: translate3d(640px, 0, 0);
            transform: translate3d(640px, 0, 0);
  }

  .sign-up {
    -webkit-transform: translate3d(-900px, 0, 0);
            transform: translate3d(-900px, 0, 0);
  }
  .cont.s--signup .sign-up {
    -webkit-transform: translate3d(0, 0, 0);
            transform: translate3d(0, 0, 0);
  }

  .icon-link {
    position: absolute;
    left: 5px;
    bottom: 5px;
    width: 32px;
  }
  .icon-link img {
    width: 100%;
    vertical-align: top;
  }
  .icon-link--twitter {
    left: auto;
    right: 5px;
  }
  
.pulse-button {
  float: right;
  margin-top: 30px;
  margin-right:30px;
  position: relative;
  display: block;
  width: 100px;
  height: 100px;
  text-transform: uppercase;
  text-align: center;
  line-height: 100px;
  letter-spacing: -1px;
  color: white;
  border: none;
  border-radius: 50%;
  background:tomato;
  cursor: pointer;
  box-shadow: 0 0 0 0 tomato;
  -webkit-animation: pulse 1.5s infinite;
}

.pulse-button:hover {
  -webkit-animation:none;
  color: black;
  background-color: light tomato;
}

@-webkit-keyframes pulse {
  0% {
    -moz-transform: scale(0.9);
    -ms-transform: scale(0.9);
    -webkit-transform: scale(0.9);
    transform: scale(0.9);
  }
  70% {
    -moz-transform: scale(1);
    -ms-transform: scale(1);
    -webkit-transform: scale(1);
    transform: scale(1);
    box-shadow: 0 0 0 50px rgba(90, 153, 212, 0);
  }
  100% {
    -moz-transform: scale(0.9);
    -ms-transform: scale(0.9);
    -webkit-transform: scale(0.9);
    transform: scale(0.9);
    box-shadow: 0 0 0 0 rgba(90, 153, 212, 0);
  }
}
.fa{
  margin-top:25px;
}

</style>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head><body>
<span class="pulse-button"><a href="index.html"><i class="fa fa-home" style="font-size:48px;color:black"></i></a></span>
  <div class="sig">
<div class="cont">
  <div class="form sign-in">
    <h2>Welcome back,</h2>
	<form action="login.jsp" method="post" name="myform1" autocomplete="off">
    <label>
      <span>Email</span>
      <input type="email" name="email" required>
    </label>
    <label>
      <span>Password</span>
      <input type="password" name="pwd" required>
    </label>  
    <p class="forgot-pass">Forgot password?</p>
    <button type="submit" value="Insert" id="b" class="submit" name="btn_add1">Sign In</button>
	
	</form>
  </div>
  <div class="sub-cont">
    <div class="img">
      <div class="img__text m--up">
        <h2>New here?</h2>
        <p>Sign up and discover great amount of new opportunities!</p>
      </div>
      <div class="img__text m--in">
        <h2>One of us?</h2>
        <p>If you already has an account, just sign in. We've missed you!</p>
      </div>

      <div class="img__btn">
        <span class="m--up">Sign Up</span>
        <span class="m--in">Sign In</span>
      </div>
    </div>
    <div class="form sign-up">
      <h2>Time to feel like home,</h2>
	  <form action="registration" method="post" name="myform" autocomplete="off">
      <label>
        <span>Name</span>
        <input type="text" name="name" required>
      </label>
      <label>
        <span>Email</span>
        <input type="email" name="mail" required>
      </label>
      <label>
        <span>Password</span>
        <input type="password" name="pwd" required>
      </label>
      <label>
        <span>College</span>
        <input type="text" name="college" required>
      </label>
      <label>
        <span>Phone Number</span>
        <input type="text" name="phone"  required>
      </label>
     <button type="submit" class="submit" value="Insert" name="btn_add8" id="b">Sign Up</button>
	
	  </form>
    </div>
  </div>
</div>
</div>
<script>document.querySelector('.img__btn').addEventListener('click', function () {
  document.querySelector('.cont').classList.toggle('s--signup');
});
//# sourceURL=pen.js
</script>

<script>
const mod = document.querySelector('.sig');
const modalB = document.querySelector('#sign');
const closeB = document.querySelector('.close');
const o = document.querySelector('.c');

// Events
modalB.addEventListener('click', openModal);
closeB.addEventListener('click', closeModal);
window.addEventListener('click', outsideClick);

// Open
function openModal() {
  mod.style.display = 'block';
  o.style.opacity='0.09';
}

// Close
function closeModal() {
  mod.style.display = 'none';
o.style.opacity='1';
}

// Close If Outside Click
function outsideClick(e) {
  if (e.target == mod) {
    mod.style.display = 'none';
  }
}
</script>
</body></html>

	
