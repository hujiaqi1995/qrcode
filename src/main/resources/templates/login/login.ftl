<html>
<head>
    <meta charset="UTF-8" />
    <title>登录</title>
    <link href="https://cdn.bootcss.com/twitter-bootstrap/3.0.1/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/admin_login.css" rel="stylesheet" />
    <style>
        #login_btn_wraper{
            text-align: center;
        }
        #login_btn_wraper .tips_success{
            color:#fff;
        }
        #login_btn_wraper .tips_error{
            color:#DFC05D;
        }
        .tips_error{
            display: block;
            text-align: center;
            color: #fff;
        }
        .tips_success{
            display: block;
            text-align: center;
            color: #fff;
        }
        #login_btn_wraper button:focus{outline:none;}
    </style>
    <script>
        if (window.parent !== window.self) {
            document.write = '';
            window.parent.location.href = window.self.location.href;
            setTimeout(function () {
                document.body.innerHTML = '';
            }, 0);
        }

        function formSubmit(){
            $("#loginForm").fireEvent("onsubmit");
            $("#loginForm").submit();
        }
    </script>
    <style type="text/css">
        <!--
        body, td, th {
            font-family: 微软雅黑;
            font-size: 12px;
            color: #333333;
        }
        body {
            margin: 0 auto;
            background-image: url("images/login/bg-1.jpg");
            background-repeat: no-repeat;
            background-position: center top;
            background-color: #F2F2F2;
            width: 1000px;
        }
        a:link {
            color: #333333;
            text-decoration: none;
        }
        a:visited {
            text-decoration: none;
            color: #333333;
        }
        a:hover {
            text-decoration: none;
            color: #01A2AA;
        }
        a:active {
            text-decoration: none;
            color: #01A2AA;
        }
        .login2016 {
            width: auto;
            height: 455px;
            padding-top: 305px;
            padding-left: 362px;
            padding-right: 343px;
        }
        #logtab {
        }
        #logtab td {
            height: 55px;
        }
        .reglink {
            color: #FFFFFF;
            font-weight: bold;
            font-size: 14px;
        }
        .reglink a {
            color: #FFFFFF!important;
        }
        #logtab input {
            width: 224px;
            height: 38px;
            line-height: 38px;
            background-color: #FFFFFF;
            padding-left: 50px;
            border: 0px #fff solid;
            color: #666666;
            font-size: 14px;
            border-radius: 3px;
        }
        #logtab .input1 {
            background-image: url("images/login/login_3.jpg");
            background-repeat: no-repeat;
            background-position: left center;
        }
        #logtab .input2 {
            background-image: url("images/login/login_6.jpg");
            background-repeat: no-repeat;
            background-position: left center;
        }
        #logtab .input3 {
            width: 75px!important;
            background-image: url("images/login/login_11.jpg");
            background-repeat: no-repeat;
            background-position: left center;
        }

        .footer {
            left:0px;
            position:fixed;
            width:100%;
            height:40px;
            text-align:center;
            font-size:14px;
            /*font-weight:bold;*/
            bottom:0px;
        }

        -->
    </style>
</head>
<body>
<div class="login2016">
    <form method="post" name="login" action="/loginPage" autoComplete="off" class="js-ajax-form" id="loginForm">
        <table width="100%" border="0" cellspacing="0" cellpadding="0" id="logtab">
            <tr>
                <td><input type="text" name="username" id="js-admin-name" class="input1" placeholder="用户名" style="width: 274px"/></td>
            </tr>
            <tr>
                <td><input type="password" name="password"  class="input2" placeholder="密码" style="width: 274px"/></td>
            </tr>
            <tr>
                <td valign="middle">
                    <button type="submit" class="js-ajax-submit" style="background-image: url('/images/login/login_14.jpg');width: 274px;height: 40px;letter-spacing: 10px;font-size: 18px;color: #fff;">登录</button></td>
            </tr>
        </table>
    </form>
</div>

<h4 class="footer">浙江华扩科技有限公司</h4>

<script>
    var GV = {
        DIMAUB: "",
        JS_ROOT: "__PUBLIC__/js/",//js版本号
        TOKEN : ''	//token ajax全局
    };
</script>
<script src="js/wind.js"></script>
<script src="js/jquery.js"></script>
<script type="text/javascript" src=".js/common.js"></script>

<script>
    ;(function(){
        document.getElementById('js-admin-name').focus();
    })();
</script>
</body>
</html>
