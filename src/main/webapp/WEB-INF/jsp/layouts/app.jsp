<!DOCTYPE html>
<!--[if IE 8 ]><html class="ie" xmlns="http://www.w3.org/1999/xhtml" xml:lang="en-US" lang="en-US"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!-->
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en-US" lang="en-US">
<!--<![endif]-->

<head>
    <!-- Basic Page Needs -->
    <meta charset="utf-8">
    <!--[if IE]><meta http-equiv='X-UA-Compatible' content='IE=edge,chrome=1'><![endif]-->
    <title>TerraFinder :: ${page_name}</title>

    <meta name="author" content="themesflat.com">

    <!-- Mobile Specific Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <!-- Theme Style -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/animate.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/animation.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap-select.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/styles.css">



    <!-- Font -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/font/fonts.css">

    <!-- Icon -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/icon/style.css">

    <!-- Favicon and Touch Icons  -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/images/favicon.png">
    <link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/assets/images/favicon.png">

</head>

<body class="counter-scroll">

    <!-- #wrapper -->
    <div id="wrapper">
        <!-- #page -->
        <div id="page" class="">
            <!-- layout-wrap -->
            <div class="layout-wrap loader-off">
                <!-- preload -->
                <div id="preload" class="preload-container">
                    <div class="preloading">
                        <span></span>
                    </div>
                </div>
                <!-- /preload -->
                <!-- section-menu-left -->
                <jsp:include page="../components/sidebar.jsp"></jsp:include>
                <!-- /section-menu-left -->
                <!-- section-content-right -->
                <div class="section-content-right">
                    <!-- header-dashboard -->
                    <jsp:include page="../components/header.jsp"></jsp:include>
                    <!-- /header-dashboard -->
                    <!-- main-content -->
                    <jsp:include page="${content}" />
                    <!-- /main-content -->
                </div>
                <!-- /section-content-right -->
            </div>
            <!-- /layout-wrap -->
        </div>
        <!-- /#page -->
    </div>
    <!-- /#wrapper -->

    <!-- Javascript -->
    <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/countto.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap-select.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/apexcharts/apexcharts.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/apexcharts/small-chart-1.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/apexcharts/small-chart-2.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/apexcharts/small-chart-3.js"></script>
    <script src="${pageContext.request.contextPath}/assets/s/apexcharts/small-chart-4.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/apexcharts/line-chart-twoline.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/apexcharts/candlestick-1.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/apexcharts/candlestick-4.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/apexcharts/candlestick-5.js"></script>
    <!-- <script src="js/switcher.js"></script> -->
    <script defer src="${pageContext.request.contextPath}/assets/js/theme-settings.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>

</body>

</html>