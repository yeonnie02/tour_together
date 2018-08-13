<%@ page contentType="text/html;charset=utf-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *Must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title -->
    <title>TourTogether-Tour &amp; Content | For Guide</title>

    <!-- Favicon -->
    <link rel="icon" href="../clever-img/core-img/favicon.ico">

    <!-- Stylesheet -->
    <link rel="stylesheet" href="../clever/style.css">
    <link rel="stylesheet" href="../clever-css/all.css">
</head>

<body>
    <!-- Preloader -->
    <div id="preloader">
        <div class="spinner"></div>
    </div>

    <!-- ##### Header Area Start ##### -->
	<%@include file="../include2/navybar4.jsp"%>
    <!-- ##### Header Area End ##### -->

    <!-- ##### Breadcumb Area Start ##### -->
    <div class="breadcumb-area">
        <!-- Breadcumb -->
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="#">Home</a></li>
                <li class="breadcrumb-item"><a href="#">Tour</a></li>
                <li class="breadcrumb-item"><a href="#">Tour &amp; Guide</a></li>
                <li class="breadcrumb-item active" aria-current="page">Tour Content</li>
            </ol>
        </nav>
    </div>
    <!-- ##### Breadcumb Area End ##### -->

    <!-- ##### Single Course Intro Start ##### -->
    <div class="single-course-intro d-flex align-items-center justify-content-center" style="background-image: url(../clever-img/bg-img/bg5.jpg);">
        <!-- Content -->
        <div class="single-course-intro-content text-center">
            <!-- Ratings -->
            <div class="ratings">
                <i class="fa fa-star" aria-hidden="true"></i>
                <i class="fa fa-star" aria-hidden="true"></i>
                <i class="fa fa-star" aria-hidden="true"></i>
                <i class="fa fa-star" aria-hidden="true"></i>
                <i class="fa fa-star-o" aria-hidden="true"></i>
            </div>
            <h3><input type="text" name="title" placeholder="제목"/></h3>
            <div class="meta d-flex align-items-center justify-content-center">
                <input type="text" name=""  placeholder="2018-08-09~2018-08-12"/>
                <span><i class="fa fa-circle" aria-hidden="true"></i></span>
                <input type="text" name="region" placeholder="국가(지역?)"/>
            </div>
            <div class="price">모집인원: <input type="text" name="region" placeholder="인원 수"/></div>
        </div>
    </div>
    <!-- ##### Single Course Intro End ##### -->

    <!-- ##### Courses Content Start ##### -->
    <div class="single-course-content section-padding-100">
        <div class="container">
            <div class="row">
                <div class="col-12 col-lg-8">
                    <div class="course--content">

                        <div class="clever-tabs-content">
                            <ul class="nav nav-tabs" id="myTab" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" id="tab--1" data-toggle="tab" href="#tab1" role="tab" aria-controls="tab1" aria-selected="false">Description</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="tab--2" data-toggle="tab" href="#tab2" role="tab" aria-controls="tab2" aria-selected="true">Itinerary</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="tab--4" data-toggle="tab" href="#tab4" role="tab" aria-controls="tab4" aria-selected="true">Guides</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="tab--5" data-toggle="tab" href="#tab5" role="tab" aria-controls="tab5" aria-selected="true">Etc...</a>
                                </li>
                            </ul>

                            <div class="tab-content" id="myTabContent">
                                <!-- Tab Text -->
                                <div class="tab-pane fade show active" id="tab1" role="tabpanel" aria-labelledby="tab--1">
                                    <div class="clever-description">

                                        <!-- About Course -->
                                        <div class="about-course mb-30">
                                            <h4>About this Tour</h4>
                                            <p><input type="text" name="" placeholder="여행에 대한 간략 정보."/></p>
                                        </div>

                                        <!-- FAQ -->
                                        <div class="clever-faqs">
                                            <h4>FAQs</h4>

                                            <div class="accordions" id="accordion" role="tablist" aria-multiselectable="true">

                                                <!-- Single Accordian Area -->
                                                <div class="panel single-accordion">
                                                    <h6><a role="button" class="" aria-expanded="true" aria-controls="collapseOne" data-toggle="collapse" data-parent="#accordion" href="#collapseOne">Are there any disadvantages when getting off the road?
                                                    <span class="accor-open"><i class="fa fa-plus" aria-hidden="true"></i></span>
                                                    <span class="accor-close"><i class="fa fa-minus" aria-hidden="true"></i></span>
                                                    </a></h6>
                                                    <div id="collapseOne" class="accordion-content collapse show">
                                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce enim nulla, mollis eu metus in, sagittis fringilla tortor.</p>
                                                    </div>
                                                </div>

                                                <!-- Single Accordian Area -->
                                                <div class="panel single-accordion">
                                                    <h6>
                                                        <a role="button" class="collapsed" aria-expanded="true" aria-controls="collapseTwo" data-parent="#accordion" data-toggle="collapse" href="#collapseTwo">What is the refund policy?
                                                        <span class="accor-open"><i class="fa fa-plus" aria-hidden="true"></i></span>
                                                        <span class="accor-close"><i class="fa fa-minus" aria-hidden="true"></i></span>
                                                        </a>
                                                    </h6>
                                                    <div id="collapseTwo" class="accordion-content collapse">
                                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vel lectus eu felis semper finibus ac eget ipsum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam vulputate id justo quis facilisis.</p>
                                                    </div>
                                                </div>

                                                <!-- Single Accordian Area -->
                                                <div class="panel single-accordion">
                                                    <h6>
                                                        <a role="button" aria-expanded="true" aria-controls="collapseThree" class="collapsed" data-parent="#accordion" data-toggle="collapse" href="#collapseThree">What is Travel Essential Knowledge?
                                                        <span class="accor-open"><i class="fa fa-plus" aria-hidden="true"></i></span>
                                                        <span class="accor-close"><i class="fa fa-minus" aria-hidden="true"></i></span>
                                                        </a>
                                                    </h6>
                                                    <div id="collapseThree" class="accordion-content collapse">
                                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vel lectus eu felis semper finibus ac eget ipsum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam vulputate id justo quis facilisis.</p>
                                                    </div>
                                                </div>

                                                <!-- Single Accordian Area -->
                                                <div class="panel single-accordion">
                                                    <h6>
                                                        <a role="button" aria-expanded="true" aria-controls="collapseFour" class="collapsed" data-parent="#accordion" data-toggle="collapse" href="#collapseFour">How much money do I need to have extra money?
                                                        <span class="accor-open"><i class="fa fa-plus" aria-hidden="true"></i></span>
                                                        <span class="accor-close"><i class="fa fa-minus" aria-hidden="true"></i></span>
                                                        </a>
                                                    </h6>
                                                    <div id="collapseFour" class="accordion-content collapse">
                                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vel lectus eu felis semper finibus ac eget ipsum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam vulputate id justo quis facilisis.</p>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>

                                <!-- Tab Text -->
                                <div class="tab-pane fade" id="tab2" role="tabpanel" aria-labelledby="tab--2">
                                    <div class="clever-curriculum">

                                        <!-- About Curriculum -->
                                        <div class="about-curriculum mb-30">
                                            <h4>Detailed Itinerary</h4>
                                            <p><input type="text" name="" placeholder="상세 여행 일정 및 정보."/></p>
                                        </div>

                                        <!-- Curriculum Level -->
                                        <div class="curriculum-level mb-30">
                                            <h4 class="d-flex justify-content-between"><span>DAY 1</span> <span>0/4</span></h4>
                                            <h5>2018-08-09</h5>
                                            <p>일자별 알림 사항---------------------------------------------------</p>

                                            <ul class="curriculum-list">
                                                <li><i class="fas fa-map-marked" aria-hidden="true"></i> 지역1
                                                    <ul>
                                                        <li>
                                                            <span><i class="fas fa-map-marker-alt" aria-hidden="true"></i> 관광지1: <span>내집</span></span>
                                                            <span><i class="fa fa-clock-o" aria-hidden="true"></i> 1 hour</span>
                                                        </li>
                                                        <li>
                                                            <span><i class="fas fa-map-marker-alt" aria-hidden="true"></i> 관광지2: <span>니집</span></span>
                                                            <span><i class="fa fa-clock-o" aria-hidden="true"></i>  2 1/2 hours</span>
                                                        </li>
                                                        <li>
                                                            <span><i class="fas fa-map-marker-alt" aria-hidden="true"></i> 관광지3: <span>우리집</span></span>
                                                            <span><i class="fa fa-clock-o" aria-hidden="true"></i> 50 minutes</span>
                                                        </li>
                                                    </ul>
                                                </li>
                                                <li><i class="fas fa-map-marked" aria-hidden="true"></i> 지역1
                                                    <ul>
                                                        <li>
                                                            <span><i class="fas fa-map-marker-alt" aria-hidden="true"></i> 관광지1: <span>내집</span></span>
                                                            <span><i class="fa fa-clock-o" aria-hidden="true"></i> 1 hour</span>
                                                        </li>
                                                        <li>
                                                            <span><i class="fas fa-map-marker-alt" aria-hidden="true"></i> 관광지2: <span>니집</span></span>
                                                            <span><i class="fa fa-clock-o" aria-hidden="true"></i>  2 1/2 hours</span>
                                                        </li>
                                                        <li>
                                                            <span><i class="fas fa-map-marker-alt" aria-hidden="true"></i> 관광지3: <span>우리집</span></span>
                                                            <span><i class="fa fa-clock-o" aria-hidden="true"></i> 50 minutes</span>
                                                        </li>
                                                    </ul>
                                                </li>
                                            </ul>
                                        </div>

                                        <!-- Curriculum Level -->
                                        <div class="curriculum-level mb-30">
                                            <h4 class="d-flex justify-content-between"><span>DAY 2</span> <span>0/5</span></h4>
                                            <h5>2018-08-10</h5>
                                            <p>일자별 알림 사항---------------------------------------------------</p>

                                            <ul class="curriculum-list">
                                                <li><i class="fas fa-map-marked" aria-hidden="true"></i> 지역1
                                                    <ul>
                                                        <li>
                                                            <span><i class="fas fa-map-marker-alt" aria-hidden="true"></i> 관광지1: <span>내집</span></span>
                                                            <span><i class="fa fa-clock-o" aria-hidden="true"></i> 1 hour</span>
                                                        </li>
                                                        <li>
                                                            <span><i class="fas fa-map-marker-alt" aria-hidden="true"></i> 관광지2: <span>니집</span></span>
                                                            <span><i class="fa fa-clock-o" aria-hidden="true"></i> 2 1/2 hours</span>
                                                        </li>
                                                        <li>
                                                            <span><i class="fas fa-map-marker-alt" aria-hidden="true"></i> 관광지3: <span>우리집</span></span>
                                                            <span><i class="fa fa-clock-o" aria-hidden="true"></i> 50 minutes</span>
                                                        </li>
                                                    </ul>
                                                </li>
                                                <li><i class="fas fa-map-marked" aria-hidden="true"></i> 지역1
                                                    <ul>
                                                        <li>
                                                            <span><i class="fas fa-map-marker-alt" aria-hidden="true"></i> 관광지1: <span>내집</span></span>
                                                            <span><i class="fa fa-clock-o" aria-hidden="true"></i> 1 hour</span>
                                                        </li>
                                                        <li>
                                                            <span><i class="fas fa-map-marker-alt" aria-hidden="true"></i> 관광지2: <span>니집</span></span>
                                                            <span><i class="fa fa-clock-o" aria-hidden="true"></i>  2 1/2 hours</span>
                                                        </li>
                                                    </ul>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>

                                <!-- Tab Text -->
                                <div class="tab-pane fade" id="tab4" role="tabpanel" aria-labelledby="tab--4">
                                    <div class="clever-members">

                                        <!-- About Members -->
                                        <div class="about-members mb-30">
                                            <h4>Guides</h4>
                                            <p><input style="border:none" type="text" name="" placeholder="가이드 정보 & 투어리스트에게 할 말"/></p>
                                        </div>

                                        <!-- All Members -->
                                        <div class="all-instructors mb-30">
                                            <div class="row">
                                                <!-- Single Members -->
                                                <div class="col-lg-6">
                                                    <div class="single-instructor d-flex align-items-center mb-30">
                                                        <div class="instructor-thumb">
                                                            <img src="../clever-img/bg-img/t1.png" alt="">
                                                        </div>
                                                        <div class="instructor-info">
                                                            <h5>Sarah Parker</h5>
                                                            <span>Guide</span>
                                                        </div>
                                                    </div>
                                                </div>

                                                <!-- Single Members -->
                                                <div class="col-lg-6">
                                                    <div class="single-instructor d-flex align-items-center mb-30">
                                                        <div class="instructor-thumb">
                                                            <img src="../clever-img/bg-img/t2.png" alt="">
                                                        </div>
                                                        <div class="instructor-info">
                                                            <h5>Sarah Parker</h5>
                                                            <span>Guide</span>
                                                        </div>
                                                    </div>
                                                </div>

                                                <!-- Single Members -->
                                                <div class="col-lg-6">
                                                    <div class="single-instructor d-flex align-items-center mb-30">
                                                        <div class="instructor-thumb">
                                                            <img src="../clever-img/bg-img/t3.png" alt="">
                                                        </div>
                                                        <div class="instructor-info">
                                                            <h5>Sarah Parker</h5>
                                                            <span>Guide</span>
                                                        </div>
                                                    </div>
                                                </div>

                                                <!-- Single Members -->
                                                <div class="col-lg-6">
                                                    <div class="single-instructor d-flex align-items-center mb-30">
                                                        <div class="instructor-thumb">
                                                            <img src="../clever-img/bg-img/t4.png" alt="">
                                                        </div>
                                                        <div class="instructor-info">
                                                            <h5>Sarah Parker</h5>
                                                            <span>Guide</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Tab Text -->
                                <div class="tab-pane fade" id="tab5" role="tabpanel" aria-labelledby="tab--5">
                                    <div class="clever-review">

                                        <!-- About Review -->
                                        <div class="about-review mb-30">
                                            <h4>제목</h4>
                                            <p>Sed elementum lacus a risus luctus suscipit. Aenean sollicitudin sapien neque, in fermentum lorem dignissim a. Nullam eu mattis quam. Donec porttitor nunc a diam molestie blandit. Maecenas quis ultrices</p>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-12 col-lg-4">
                    <div class="course-sidebar">
                        <!-- Buy Course -->
                        <a href="#" class="btn clever-btn mb-30 w-100">글쓰기</a>

                        <!-- Widget -->
                        <div class="sidebar-widget">
                            <h4>Guide Tour Features</h4>
                            <ul class="features-list">
                                <li>
                                    <h6><i class="fa fa-clock-o" aria-hidden="true"></i> Duration</h6>
                                    <h6><input style="border:none" type="text" name="" placeholder="여행기간"/></h6>
                                </li>
                                <li>
                                    <h6><i class="fa fa-bell" aria-hidden="true"></i> Country</h6>
                                    <h6><input style="border:none" type="text" name="" placeholder="여행지역"/></h6>
                                </li>
                                <li>
                                    <h6><i class="fa fa-file" aria-hidden="true"></i> Number of travelers</h6>
                                    <h6><input style="border:none" type="text" name="" placeholder="모집인원"/></h6>
                                </li>
                            </ul>
                        </div>
                        
                        <!-- Widget -->
                        <div class="sidebar-widget">
                            <h4>Map</h4>
                            <img src="../clever-img/bg-img/cer.png" alt="">
                        </div>

                        <!-- Widget -->
                        <div class="sidebar-widget">
                            <h4>You may like</h4>

                            <!-- Single Courses -->
                            <div class="single--courses d-flex align-items-center">
                                <div class="thumb">
                                    <img src="../clever-img/bg-img/yml.jpg" alt="">
                                </div>
                                <div class="content">
                                    <h5>1</h5>
                                    <h6>가</h6>
                                </div>
                            </div>

                            <!-- Single Courses -->
                            <div class="single--courses d-flex align-items-center">
                                <div class="thumb">
                                    <img src="../clever-img/bg-img/yml2.jpg" alt="">
                                </div>
                                <div class="content">
                                    <h5>2</h5>
                                    <h6>나</h6>
                                </div>
                            </div>

                            <!-- Single Courses -->
                            <div class="single--courses d-flex align-items-center">
                                <div class="thumb">
                                    <img src="../clever-img/bg-img/yml3.jpg" alt="">
                                </div>
                                <div class="content">
                                    <h5>3</h5>
                                    <h6>다</h6>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- ##### Courses Content End ##### -->

    <!-- ##### Footer Area Start ##### -->
    <footer class="footer-area">
        <!-- Top Footer Area -->
        <div class="top-footer-area">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <!-- Footer Logo -->
                        <div class="footer-logo">
                            <a href="index.html"><img src="../clever-img/core-img/logo2.png" alt=""></a>
                        </div>
                        <!-- Copywrite -->
                        <p><a href="#"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Bottom Footer Area -->
        <div class="bottom-footer-area d-flex justify-content-between align-items-center">
            <!-- Contact Info -->
            <div class="contact-info">
                <a href="#"><span>Phone:</span> +44 300 303 0266</a>
                <a href="#"><span>Email:</span> info@clever.com</a>
            </div>
            <!-- Follow Us -->
            <div class="follow-us">
                <span>Follow us</span>
                <a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a>
                <a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a>
                <a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a>
            </div>
        </div>
    </footer>
    <!-- ##### Footer Area End ##### -->

    <!-- ##### All Javascript Script ##### -->
    <!-- jQuery-2.2.4 js -->
    <script src="../clever-js/jquery/jquery-2.2.4.min.js"></script>
    <!-- Popper js -->
    <script src="../clever-js/bootstrap/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="../clever-js/bootstrap/bootstrap.min.js"></script>
    <!-- All Plugins js -->
    <script src="../clever-js/plugins/plugins.js"></script>
    <!-- Active js -->
    <script src="../clever-js/active.js"></script>
</body>

</html>