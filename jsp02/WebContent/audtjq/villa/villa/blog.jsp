<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Chelsea</title>
  
<script src="../include/jquery-3.3.1.min.js"></script>
<script>
$(function(){
	list();
	$("#btnSave").click(function(){
		insert();
	});
	//검색 버튼 클릭
	$("#btnSearch").click(function(){
		list();
	});
});
function insert(){
	var writer=$("#writer").val();
	var memo=$("#memo").val();
	var param="writer="+writer+"&memo="+memo;
	$.ajax({
		type: "post",
		url: "${path}/memo_servlet/insert.do",
		data: param,
		success: function(){ //call back
			list();
			$("#writer").val("");
			$("#memo").val("");
		}
	});
}
function list(){
	//검색옵션과 검색할 키워드를 전달
	var param="searchkey="+$("#searchkey").val()
		+"&search="+$("#search").val();
	$.ajax({
		type: "post",
		url: "${path}/memo_servlet/list.do",
		data: param,
		success: function(result){
			$("#result").html(result);
		}
	});
}
</script>
    
    <meta charset="utf-8">
    
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Mukta+Mahee:200,300,400|Playfair+Display:400,700" rel="stylesheet">

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
                        <li><a href="index.jsp">Home</a></li>
                        <li><a href="hotel.jsp">구장</a></li>
                        <li><a href="about.jsp">구단소개</a></li>
                        <li class="active"><a href="blog.jsp">뉴스</a></li>
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

    <section class="site-hero overlay page-inside" style="background-image: url(img/111.png)">
      <div class="container">
        <div class="row site-hero-inner justify-content-center align-items-center">
          <div class="col-md-10 text-center">
            <h1 class="heading" data-aos="fade-up">뉴스</h1>
            <p class="sub-heading mb-5" data-aos="fade-up" data-aos-delay="100">구단소식통(뉴스통)</p>
          </div>
        </div>
        <!-- <a href="#" class="scroll-down">Scroll Down</a> -->
      </div>
    </section>
    <!-- END section -->

    
    <section class="section bg-light post">
      <div class="container">
        <div class="row">
          <div class="col-md-8">
            <div class="row mb-5">
              <div class="col-md-6">
                <div class="media media-custom d-block mb-4">
                  <a href="http://www.besteleven.com/National/news_world_01_view.asp?iBoard=56&iIDX=119779" class="mb-4 d-block"><img src="img/1.png" alt="Image placeholder" class="img-fluid"></a>
                  <div class="media-body">
                    <span class="meta-post">may 16, 2019</span>
                    <h2 class="mt-0 mb-3"><a href="http://www.besteleven.com/National/news_world_01_view.asp?iBoard=56&iIDX=119779">로프터크 치크 친선경기 중에 부상 최대 1년소요</a></h2>
                  </div>
                </div>
              </div>
              <div class="col-md-6">
                 <div class="media media-custom d-block mb-4">
                  <a href="http://www.sportalkorea.com/news/view.php?gisa_uniq=2019051320581036&section_code=20&cp=se&gomb=1" class="mb-4 d-block"><img src="img/2.png" alt="Image placeholder" class="img-fluid"></a>
                  <div class="media-body">
                    <span class="meta-post">may 14 , 2019</span>
                    <h2 class="mt-0 mb-3"><a href="http://www.sportalkorea.com/news/view.php?gisa_uniq=2019051320581036&section_code=20&cp=se&gomb=1">첼시 합류'풀리시치' (임대 복귀) </a></h2>
                  </div>
                </div>
              </div>


              <div class="col-md-6">
                <div class="media media-custom d-block mb-4">
                  <a href="http://www.besteleven.com/National/news_world_01_view.asp?iBoard=13&iIDX=119641" class="mb-4 d-block"><img src="img/3.png" alt="Image placeholder" class="img-fluid"></a>
                  <div class="media-body">
                    <span class="meta-post">may  11, 2018</span>
                    <h2 class="mt-0 mb-3"><a href="http://www.besteleven.com/National/news_world_01_view.asp?iBoard=13&iIDX=119641">다비드루이스 2021년까지 계약연장</a></h2>
                  </div>
                </div>
              </div>
              <div class="col-md-6">
                 <div class="media media-custom d-block mb-4">
                  <a href="http://interfootball.heraldcorp.com/news/articleView.html?idxno=295047#" class="mb-4 d-block"><img src="img/4.png" alt="Image placeholder" class="img-fluid"></a>
                  <div class="media-body">
                    <span class="meta-post">may  8, 2019</span>
                    <h2 class="mt-0 mb-3"><a href="http://interfootball.heraldcorp.com/news/articleView.html?idxno=295047#">FIFA, 첼시 징계 확정 2020년까지 영입 금지(임대생 영입불가)</a></h2>
                  </div>
                </div>
              </div>


              <div class="col-md-6">
                <div class="media media-custom d-block mb-4">
                  <a href="http://news.kmib.co.kr/article/view.asp?arcid=0013301435&code=61161311&cp=nv" class="mb-4 d-block"><img src="img/5.png" alt="Image placeholder" class="img-fluid"></a>
                  <div class="media-body">
                    <span class="meta-post">may 10, 2019</span>
                    <h2 class="mt-0 mb-3"><a href="http://news.kmib.co.kr/article/view.asp?arcid=0013301435&code=61161311&cp=nv">첼시 프랑크푸르트꺾고 아스날과 결승대결</a></h2>
                  </div>
                </div>
              </div>
              <div class="col-md-6">
                 <div class="media media-custom d-block mb-4">
                  <a href="http://interfootball.heraldcorp.com/news/articleView.html?idxno=295708" class="mb-4 d-block"><img src="img/6.png" alt="Image placeholder" class="img-fluid"></a>
                  <div class="media-body">
                    <span class="meta-post">may 13, 2019</span>
                    <h2 class="mt-0 mb-3"><a href="http://interfootball.heraldcorp.com/news/articleView.html?idxno=295708">첼시 리그3위로 마감 챔피언스리그티켓확보</a></h2>
                  </div>
                </div>
              </div>
            </div>
            
             <div class="row">
              <div class="col-md-12">
                <nav role="navigation">
                  <ul class="pagination custom-pagination pagination-lg">
                  <!--   <li class="page-item active">
                      <a class="page-link" href="#">1</a>
                    </li>
                    <li class="page-item ">
                      <a class="page-link " href="#">2</a>
                    </li>
                    <li class="page-item ">
                      <a class="page-link" href="#">3</a>
                    </li>-->
                  </ul>
                </nav>
              </div>
            </div>
          </div>
          <!-- END content -->
          <div class="col-md-4">
            <div class="row">

              <div class="col-md-11 ml-auto">


              <!--   <form action="#" class="sidebar-search">
                  <div class="form-group">
                    <span class="fa fa-search icon-search"></span>
                    <input type="text" class="form-control search-input"  placeholder="Search...">
                  </div>
                </form>   --> 

                <div class="side-box">
                  <h2 class="heading">Highlight</h2>
                  <ul class="post-list list-unstyled">
                    <li>
                      <a href="https://sports.news.naver.com/wfootball/vod/index.nhn?category=epl&gameId=2019051210014736989&date=20190512" class="d-flex">
                        <span class="mr-3 image"><img src="img/40.png" alt="Image placeholder" class="img-fluid"></span>
                        <div>
                          <span class="meta">may 12, 2019</span>
                          <h3>첼시vs레스터 하이라이트</h3>
                        </div>
                      </a>
                    </li>  
                    <li>
                      <a href="https://sports.news.naver.com/wfootball/vod/index.nhn?category=europa&tab=&listType=game&date=20190510&gameId=2019051051018008091&teamCode=&playerId=&keyword=&id=538944&page=1" class="d-flex">
                        <span class="mr-3 image"><img src="img/41.png" alt="Image placeholder" class="img-fluid"></span>
                        <div>
                          <span class="meta">may 10, 2019</span>
                          <h3>첼시vs프랑크푸르트 하이라이트(유로파리그) 2차전</h3>
                        </div>
                      </a>
                    </li>  
                    
                    <li>
                      <a href="https://sports.news.naver.com/wfootball/vod/index.nhn?category=epl&gameId=2019050510014736973&date=20190505" class="d-flex">
                        <span class="mr-3 image"><img src="img/42.png" alt="Image placeholder" class="img-fluid"></span>
                        <div>
                          <span class="meta">may 5, 2019</span>
                          <h3>첼시vs왓포드 하이라이트</h3>
                        </div>
                      </a>
                    </li>  
                    <li>
                      <a href="https://sports.news.naver.com/wfootball/vod/index.nhn?category=europa&gameId=2019050351018008089&date=20190503" class="d-flex">
                        <span class="mr-3 image"><img src="img/43.png" alt="Image placeholder" class="img-fluid"></span>
                        <div>
                          <span class="meta">may 3, 2019</span>
                          <h3>첼시vs프랑크푸르트 하이라이트(유로파리그) 1차전</h3>
                        </div>
                      </a>
                    </li>  
                    <li>
                      <a href="https://sports.news.naver.com/wfootball/vod/index.nhn?category=epl&gameId=2019042910014736941&date=20190429" class="d-flex">
                        <span class="mr-3 image"><img src="img/44.png" alt="Image placeholder" class="img-fluid"></span>
                        <div>
                          <span class="meta">April 29, 2019</span>
                          <h3>첼시vs맨유 하이라이트</h3>
                        </div>
                      </a>
                    </li>  
                  </ul>
                </div>

                <div class="side-box">
               
        <div id="rank_template1" class="home_box" >
	<div class="home_mn">
		<div class="home_box_head" style=>
			<h2>해외축구 순위표</h2>
			</div>
		</div>
		<div class="hmb_tbl _team_rank_area" id="_team_rank_epl" >
			<table>
				<thead>
				<tr>
					<th scope="col" class="th_num"><span class="blind">순번</span></th>
					<th scope="col" class="th_team" style="text-align: center;"><span>팀명</span></th>
					<th scope="col"><span>경기</span></th>
					<th scope="col"><span>승</span></th>
					<th scope="col"><span>무</span></th>
					<th scope="col"><span>패</span></th>
					<th scope="col"><span>승점</span></th>
				</tr>
				</thead>
				<tbody>
				<tr class="best">
					<th scope="row"><span><em class="rank num1"><span class="blind">1위</span></em></span></th>
					<td>
						<div class="wrap">
							<div class="image emblem">
								<img width="20" height="20" alt="" src="img/123/1.png" class="emblem">
							<span class="name">맨시티</span>
							</div>
							<div class="info">
								
							</div>
						</div>
					</td>
					<td><span class="point_blue">38</span></td>
					<td><span class="point_blue">32</span></td>
					<td><span class="point_blue">2</span></td>
					<td><span class="point_blue">4</span></td>
					<td><span class="point_blue">98</span></td>
				</tr>
				<tr>
					<th scope="row"><span><em class="rank num2"><span class="blind">2위</span></em></span></th>
					<td>
						<div class="wrap">
							<div class="image emblem">	
						<img width="20" height="20" alt="" src="img/123/2.png" class="emblem">
							<span class="name">리버풀</span>
							</div>
							<div class="info">
								
							</div>
						</div>
					</td>
					<td><span class="">38</span></td>
					<td><span class="">30</span></td>
					<td><span class="">7</span></td>
					<td><span class="">1</span></td>
					<td><span class="">97</span></td>
				</tr>
				
				<tr>
					<th scope="row"><span><em class="rank num3"><span class="blind">3위</span></em></span></th>
					<td>
						<div class="wrap">
							<div class="image emblem">
								<img width="20" height="20" alt="" src="img/123/3.png" class="emblem">
								<span class="name">첼시</span>
							</div>
							<div class="info">
							</div>
						</div>
					</td>	
					<td><span class="">38</span></td>
					<td><span class="">21</span></td>
					<td><span class="">9</span></td>
					<td><span class="">8</span></td>
					<td><span class="">72</span></td>
				</tr>
				
				<tr>
					<th scope="row"><span><em class="rank num4"><span class="blind">4위</span></em></span></th>
					<td>
						<div class="wrap">
							<div class="image emblem">
								<img width="20" height="20" alt="" src="img/123/4.png" class="emblem">
							<span class="name">토트넘</span>
							</div>
							<div class="info">
							</div>
						</div>
					</td>
					<td><span class="">38</span></td>
					<td><span class="">23</span></td>
					<td><span class="">2</span></td>
					<td><span class="">13</span></td>
					<td><span class="">71</span></td>
				</tr>
				
				<tr>
					<th scope="row"><span><em class="rank num5"><span class="blind">5위</span></em></span></th>
					<td>
						<div class="wrap">
							<div class="image emblem">
								<img width="20" height="20" alt="" src="img/123/5.png" class="emblem">
								<span class="name">아스널</span>
							</div>
							<div class="info">
							</div>
						</div>
					</td>
					<td><span class="">38</span></td>
					<td><span class="">21</span></td>
					<td><span class="">7</span></td>
					<td><span class="">10</span></td>
					<td><span class="">70</span></td>
				</tr>
				
				<tr>
					<th scope="row"><span><em class="rank num6"><span class="blind">6위</span></em></span></th>
					<td>
						<div class="wrap">
							<div class="image emblem">
						<img width="20" height="20" alt="" src="img/123/6.png" class="emblem">
							<span class="name">맨유</span>
							</div>
							<div class="info">
							</div>
						</div>
					</td>
					<td><span class="">38</span></td>
					<td><span class="">19</span></td>
					<td><span class="">9</span></td>
					<td><span class="">10</span></td>
					<td><span class="">66</span></td>
				</tr>
				
				<tr>
					<th scope="row"><span><em class="rank num7"><span class="blind">7위</span></em></span></th>
					<td>
						<div class="wrap">
							<div class="image emblem">
							<img width="20" height="20" alt="" src="img/123/7.png" class="emblem">
							<span class="name">울버햄튼</span>
							</div>
							<div class="info">
							</div>
						</div>
					</td>

					<td><span class="">38</span></td>
					<td><span class="">16</span></td>
					<td><span class="">9</span></td>
					<td><span class="">13</span></td>
					<td><span class="">57</span></td>
				</tr>
				
				<tr>
					<th scope="row"><span><em class="rank num8"><span class="blind">8위</span></em></span></th>
					<td>
						<div class="wrap">
							<div class="image emblem">
								<img width="20" height="20" alt="" src="img/123/8.png" class="emblem">
							<span class="name">에버턴</span>
							</div>
							<div class="info">
							</div>
						</div>
					</td>
					<td><span class="">38</span></td>
					<td><span class="">15</span></td>
					<td><span class="">9</span></td>
					<td><span class="">14</span></td>
					<td><span class="">54</span></td>
				</tr>
				
				<tr>
					<th scope="row"><span><em class="rank num9"><span class="blind">9위</span></em></span></th>
					<td>
						<div class="wrap">
							<div class="image emblem">
							<img width="20" height="20" alt="" src="img/123/9.png" class="emblem">
								<span class="name">레스터</span>
							</div>
							<div class="info">
							</div>
						</div>
					</td>
					<td><span class="">38</span></td>
					<td><span class="">15</span></td>
					<td><span class="">7</span></td>
					<td><span class="">16</span></td>
					<td><span class="">52</span></td>
				</tr>
				
				<tr>
					<th scope="row"><span><em class="rank num10"><span class="blind">10위</span></em></span></th>
					<td>
						<div class="wrap">
							<div class="image emblem">
			            <img width="20" height="20" alt="" src="img/123/10.png" class="emblem">
								<span class="name">웨스트햄</span>
							</div>
							<div class="info">		
							</div>
						</div>
					</td>
					<td><span class="">38</span></td>
					<td><span class="">15</span></td>
					<td><span class="">7</span></td>
					<td><span class="">16</span></td>
					<td><span class="">52</span></td>
				</tr>
					<tr>
					<th scope="row"><span><em class="rank num10"><span class="blind">11위</span></em></span></th>
					<td>
						<div class="wrap">
							<div class="image emblem">
						<img width="20" height="20" alt="" src="img/123/11.png" class="emblem">
								<span class="name">왓포드</span>
							</div>
							<div class="info">		
							</div>
						</div>
					</td>
					<td><span class="">38</span></td>
					<td><span class="">14</span></td>
					<td><span class="">8</span></td>
					<td><span class="">16</span></td>
					<td><span class="">50</span></td>
				</tr>
						<tr>
					<th scope="row"><span><em class="rank num10"><span class="blind">12위</span></em></span></th>
					<td>
						<div class="wrap">
							<div class="image emblem">
                        <img width="20" height="20" alt="" src="img/123/12.png" class="emblem">
       								<span class="name">크팰</span>
							</div>
							<div class="info">		
							</div>
						</div>
					</td>
					<td><span class="">38</span></td>
					<td><span class="">14</span></td>
					<td><span class="">7</span></td>
					<td><span class="">17</span></td>
					<td><span class="">49</span></td>
				</tr>
						<tr>
					<th scope="row"><span><em class="rank num10"><span class="blind">13위</span></em></span></th>
					<td>
						<div class="wrap">
							<div class="image emblem">
							<img width="20" height="20" alt="" src="img/123/13.jpg" class="emblem">
								<span class="name">뉴캐슬	</span>
							</div>
							<div class="info">		
							</div>
						</div>
					</td>
					<td><span class="">38</span></td>
					<td><span class="">12</span></td>
					<td><span class="">9</span></td>
					<td><span class="">17</span></td>
					<td><span class="">45</span></td>
				</tr>
							<tr>
					<th scope="row"><span><em class="rank num10"><span class="blind">14위</span></em></span></th>
					<td>
						<div class="wrap">
							<div class="image emblem">
						     <img width="20" height="20" alt="" src="img/123/14.png" class="emblem">
								<span class="name">본머스	</span>
							</div>
							<div class="info">		
							</div>
						</div>
					</td>
					<td><span class="">38</span></td>
					<td><span class="">13</span></td>
					<td><span class="">6</span></td>
					<td><span class="">19</span></td>
					<td><span class="">45</span></td>
				</tr>
							<tr>
					<th scope="row"><span><em class="rank num10"><span class="blind">15위</span></em></span></th>
					<td>
						<div class="wrap">
							<div class="image emblem">
								     <img width="20" height="20" alt="" src="img/123/15.jpg" class="emblem">
								<span class="name">번리</span>
							</div>
							<div class="info">		
							</div>
						</div>
					</td>
					<td><span class="">38</span></td>
					<td><span class="">11</span></td>
					<td><span class="">7</span></td>
					<td><span class="">20</span></td>
					<td><span class="">40</span></td>
				</tr>
									<tr>
					<th scope="row"><span><em class="rank num10"><span class="blind">16위</span></em></span></th>
					<td>
						<div class="wrap">
							<div class="image emblem">
						     <img width="20" height="20" alt="" src="img/123/16.png" class="emblem">
								<span class="name">소튼</span>
							</div>
							<div class="info">		
							</div>
						</div>
					</td>
					<td><span class="">38</span></td>
					<td><span class="">9</span></td>
					<td><span class="">12</span></td>
					<td><span class="">17</span></td>
					<td><span class="">39</span></td>
				</tr>
								<tr>
					<th scope="row"><span><em class="rank num10"><span class="blind">17위</span></em></span></th>
					<td>
						<div class="wrap">
							<div class="image emblem">
								     <img width="20" height="20" alt="" src="img/123/17.png" class="emblem">
								<span class="name">브라이튼</span>
							</div>
							<div class="info">		
							</div>
						</div>
					</td>
					<td><span class="">38</span></td>
					<td><span class="">9</span></td>
					<td><span class="">9</span></td>
					<td><span class="">20</span></td>
					<td><span class="">36</span></td>
				</tr>
								<tr>
					<th scope="row"><span><em class="rank num10"><span class="blind">18위</span></em></span></th>
					<td>
						<div class="wrap">
							<div class="image emblem">
						     <img width="20" height="20" alt="" src="img/123/18.png" class="emblem">
								<span class="name">카디프</span>
							</div>
							<div class="info">		
							</div>
						</div>
					</td>
					<td><span class="">38</span></td>
					<td><span class="">10</span></td>
					<td><span class="">4</span></td>
					<td><span class="">24</span></td>
					<td><span class="">34</span></td>
				</tr>
								<tr>
					<th scope="row"><span><em class="rank num10"><span class="blind">19위</span></em></span></th>
					<td>
						<div class="wrap">
							<div class="image emblem">
						     <img width="20" height="20" alt="" src="img/123/19.png" class="emblem">
								<span class="name">풀럼</span>
							</div>
							<div class="info">		
							</div>
						</div>
					</td>
					<td><span class="">38</span></td>
					<td><span class="">7</span></td>
					<td><span class="">5</span></td>
					<td><span class="">26</span></td>
					<td><span class="">26</span></td>
				</tr>
								<tr>
					<th scope="row"><span><em class="rank num10"><span class="blind">20위</span></em></span></th>
					<td>
						<div class="wrap">
							<div class="image emblem">
								     <img width="20" height="20" alt="" src="img/123/20.jpg" class="emblem">
								<span class="name">허더즈</span>
							</div>
							<div class="info">		
							</div>
						</div>
					</td>
					<td><span class="">38</span></td>
					<td><span class="">3</span></td>
					<td><span class="">7</span></td>
					<td><span class="">28</span></td>
					<td><span class="">16</span></td>
				</tr>
				</tbody>
			</table>
		</div>
		</div>
	</div>
</div>
              </div>
            </div>      
          </div>
        </div>
      </div>
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
              <li><a href="https://www.hublot.com/en/partnerships/chelsea-fc?utm_source=chelsea&utm_medium=site&utm_campaign=official-timekeeper">HUBLOT</a></li>
              <li><a href="https://www.hyundai.com/kr/ko">Hyundai</a></li>
            </ul>
          </div>
          <div class="col-md-3 mb-5 pr-md-5 contact-info">
          <ul class="list-unstyled link">
            <li><a href="https://www.millenniumhotels.com/en/chelseafc/">MILLENNIUMHOTEL</a></li>
              <li><a href="http://www.singhabeer.com/">Singhabeer</a></li>
              <li><a href="https://www.sonymusic.com/">SONYMUSIC</a></li>
              <li><a href="https://www.rexona.com/br/location-selector.html">Rexona</a></li>
              <li><a href="https://www.chelseafc.com/en/about-chelsea/about-the-club/club-partners/vitality">VITALITY</a></li>
          </div>
           <div class="col-md-3 mb-5 pr-md-5 contact-info">
          <ul class="list-unstyled link">
            <li><a href="">개인정보취급방침</a></li>
              <li><a href="">이용약관</a></li>
              <li><a href="">쿠키정책	</a></li>
             
          </div>
        </div>
        <div class="row bordertop pt-5">
          <p class="col-md-6 text-left"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with by <a href="+" target="_blank">Chelsea</a>
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
    <script src="js/jquery.waypoints.min.js"></script>
    <script src="js/aos.js"></script>
    <script src="js/main.js"></script>
  </body>
</html>