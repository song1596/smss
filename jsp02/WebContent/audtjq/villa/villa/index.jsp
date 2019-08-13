<!-- http://192.168.0.5/jsp02/WebContent/audtjq/villa/villa/index.jsp-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
  
<!doctype html>
<html lang="en">
  <head>
    <title>Chelsea</title>
    
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Mukta+Mahee:200,300,400|Playfair+Display:400,700" rel="stylesheet">
	<%@ include file="header.jsp" %>
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/animate.css">
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/aos.css">
    
    <link rel="stylesheet" href="fonts/ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="fonts/fontawesome/css/font-awesome.min.css">

    <!-- Theme Style -->
    <link rel="stylesheet" href="css/style.css">

  </head>
  <body>
    
    <header class="site-header">
      <div class="container-fluid">
        <div class="row">
          <div class="col-4 site-logo" data-aos="fade"><a href="index.jsp"><em>Chelsea</em></a></div>
          <div class="col-8"> 


            <div class="site-menu-toggle js-site-menu-toggle"  data-aos="fade">
              <span></span>
              <span></span>
              <span></span>
            </div>
            <!-- END menu-toggle -->

	            <div class="site-navbar js-site-navbar">
	              <nav role="navigation">
	                <div class="container">
	                  <div class="row full-height align-items-center">
	                    <div class="col-md-6">
	                      <ul class="list-unstyled menu">
	                        <li class="active"><a href="index.jsp">Home</a></li>
	           	             <li><a href="hotel.jsp">구장</a></li>
	                        <li><a href="about.jsp">구단소개</a></li>
	                        <li><a href="blog.jsp">뉴스</a></li>
	                        <li><a href="index2.jsp">게시판</a></li>
	                      </ul>
	                    </div>
	                    <div class="col-md-6 extra-info">
	                      <div class="row">
	                        <div class="col-md-6 mb-5">
	                          <h3>Contact Info</h3>
	                          <p>문의사항있으시면<br> 연락부탁드립니다.</p>
	                        <p>audtjq159@naver.com</p>
	                          <p>010-7740-7003</p>
	                          
	                        </div>
	                        <div class="col-md-6">
	                          <h3>Connect With Us</h3>
	                          <ul class="list-unstyled">
	                            <li><a href="https://twitter.com/ChelseaFC_Korea">Twitter</a></li>
	                            <li><a href="https://www.facebook.com/ChelseaFC/?eid=ARBrNJ4XmLEhyuXLiZPzjAcp-H6p9pi1jWxFL2rhQiNVrhoPznJ0bOtISxUuWfvjVJOY7xFt2iJ0rN0v">Facebook</a></li>
	                          </ul>
	                        </div>
	                      </div>
	                    </div>
	                  </div>
	                </div>
	              </nav>
	            </div>
	          </div>
	        </div>
	      </div>
	    </header>
    <!-- END head -->

    <section class="site-hero overlay" style="background-image: url(img/38.png)">
    <c:if test="${sessionScope.userid!=null}">
    <div class="container">
        <div class="row site-hero-inner justify-content-center align-items-center">
          <div class="col-md-10 text-center">
            <h1 class="heading" data-aos="fade-up">	Welcome to Chelsea Home</h1>
            <p class="sub-heading mb-5" data-aos="fade-up" data-aos-delay="100"> </p>
            ${sessionScope.userid }님 환영합니다.
<br>
<br>
<br>
     	<input type="button" value="로그아웃" onclick="logout()" class="btn uppercase btn-outline-light d-sm-inline d-block">
     	<script>
     		function logout(){
     			location.href="${path}/bbb/logout.do";
     			alert("로그아웃 되셨습니다.");
     		}
     	</script>
           </a></p>
          </div>
        </div>
        <!-- <a href="#" class="scroll-down">Scroll Down</a> -->
      </div>
    	
     </c:if> 
   <c:if test="${sessionScope.userid==null}">
      <div class="container">
        <div class="row site-hero-inner justify-content-center align-items-center">
          <div class="col-md-10 text-center">
            <h1 class="heading" data-aos="fade-up">	Welcome to Chelsea Home Page</h1>
            <p class="sub-heading mb-5" data-aos="fade-up" data-aos-delay="100"> </p>
            <p data-aos="fade-up" data-aos-delay="100"><a href="join2.jsp" class="btn uppercase btn-primary mr-md-2 mr-0 mb-3 d-sm-inline d-block">회원가입</a> 
            <a href="login.jsp" class="btn uppercase btn-outline-light d-sm-inline d-block">로그인
           </a></p>
          </div>
        </div>
        <!-- <a href="#" class="scroll-down">Scroll Down</a> -->
      </div>
 </c:if>
 
    </section>
       <footer class="section footer-section">
      <div class="container">
        <div class="row mb-4">
          <div class="col-md-3 mb-5">
            <ul class="list-unstyled link">
               <li><a href="https://www.nike.com/kr/ko_kr/">Nike</a></li>
              <li><a href="http://www.yokohamakorea.com/">Yokohama</a></li>
               <li><a href="https://www.efl.com/carabao-cup">Carabao</a></li>
            
            
            </ul>
          </div>
          <div class="col-md-3 mb-5">
            <ul class="list-unstyled link">
              <li><a href="https://www.beatsbydre.com/kr">BeatsbyDre</a></li>
              <li><a href="https://www.easports.com/fifa">EA</a></li>
              <li><a href="https://www.ericsson.com/en">Ericsson</a></li>
             
            </ul>
          </div>
          <div class="col-md-3 mb-5 pr-md-5 contact-info">
          <ul class="list-unstyled link">
            <li><a href="https://www.millenniumhotels.com/en/chelseafc/">MILLENNIUMHOTEL</a></li>
              <li><a href="http://www.singhabeer.com/">Singhabeer</a></li>
              <li><a href="https://www.sonymusic.com/">SONYMUSIC</a></li>
            
          </div>
           <div class="col-md-3 mb-5 pr-md-5 contact-info">
          <ul class="list-unstyled link">
            <li><a href="https://www.hublot.com/en/partnerships/chelsea-fc?utm_source=chelsea&utm_medium=site&utm_campaign=official-timekeeper">HUBLOT</a></li>
              <li><a href="https://www.hyundai.com/kr/ko">Hyundai</a></li>
             <li><a href="https://www.rexona.com/br/location-selector.html">Rexona</a></li>
              <li><a href="https://www.chelseafc.com/en/about-chelsea/about-the-club/club-partners/vitality">VITALITY</a></li>
          </div>
        </div>
        <div class="row bordertop pt-5">
          <p class="col-md-6 text-left"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with by Chelsea
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
            
          <p class="col-md-6 text-right social">
         <a href="https://www.facebook.com/ChelseaFC/?eid=ARBrNJ4XmLEhyuXLiZPzjAcp-H6p9pi1jWxFL2rhQiNVrhoPznJ0bOtISxUuWfvjVJOY7xFt2iJ0rN0v"><span class="fa fa-facebook"></span></a>
            <a href="https://twitter.com/ChelseaFC_Korea"><span class="fa fa-twitter"></span></a>
          </p>
        </div>
      </div>
    </footer>
    
    
    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <!-- <script src="js/jquery.waypoints.min.js"></script> -->
    <script src="js/aos.js"></script>
    <script src="js/main.js"></script>
  </body>
</html>