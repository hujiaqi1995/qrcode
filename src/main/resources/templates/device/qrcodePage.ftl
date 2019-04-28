<html>
<head>
    <meta charset="UTF-8" name="viewport">
    <title>二维码详情</title>
    <link href="https://cdn.bootcss.com/twitter-bootstrap/3.0.1/css/bootstrap.min.css" rel="stylesheet">
</head>
<script type="text/javascript">
    function my_print() {
        //直接调用浏览器打印功能
        bdhtml = window.document.body.innerHTML;
        //定义打印区域起始字符，根据这个截取网页局部内容
        sprnstr = "<!--startprint-->"; //打印区域开始的标记
        eprnstr = "<!--endprint-->";   //打印区域结束的标记
        prnhtml = bdhtml.substr(bdhtml.indexOf(sprnstr) + 17);
        prnhtml = prnhtml.substring(0, prnhtml.indexOf(eprnstr));
        //还原网页内容
        window.document.body.innerHTML = prnhtml;
        //开始打印
        window.print();
    }
</script>
<style type="text/css">
    html{
        height: 100%;
        width: 100%;
    }

    body {
        position: absolute;
        margin: 0 auto;
        height:100%;
        width: 100%;
    }

    .out {
        width: 10em;
        height: 100%;
        background-color: #2f3e4e;
        position: fixed;
        top: 80px;
    }
    .nav ul {
        margin: 0;padding: 0;
        list-style-type: none;
        line-height: 3em;
    }

    .nav a {
        /*padding: 3px;*/
        display: block;
        width: 10em;
        text-decoration: none;
        background-color: #2f3e4e;
        color: #ffffff;
    }
    .nav a:hover {
        background-color: #4c6375;
        cursor: pointer;
    }
    #companyName {
        text-align: center;
        /*background: #72beda;*/
        background: #2f3e4e;
        height: 80px;
        width: 100%;
        line-height: 80px;
        font-size: xx-large;
        color: #ffffff;
        position: fixed;
    }
    .container{
        position: fixed;/*绝对定位*/
        width: 400px;
        height: 600px;
        top: 20%;
        left: 41%;
    }
    .text{
        /*margin-bottom: 10px;*/
        margin-left: 40px;
        font-size: medium;
    }

    .image{
        position: absolute;
        top: 50%;
        left: 50%;
        width: 300px;
        height: 300px;
        margin-left: -200px;
        margin-top: -200px;

    }
    #mybutton{
        top: 60%;
        left: 50%;
        margin-top: 350px;
        margin-left: 85px;
    }

    .footer {
        left: 0px;
        position: fixed;
        width: 100%;
        height: 40px;
        text-align: center;
        font-size: 14px;
        /*font-weight:bold;*/
        bottom: 0px;
    }
</style>

</head>
<body>

<div class="row" id="companyName">
    <div id="name">杭州铁路职工培训基地资产录入系统</div>
</div>

<div class="row">
    <div class="col-xs-3 col-md-2">
        <#include "../common/left-nav.ftl">
    </div>
    <div class="col-xs-12 col-sm-6 col-md-8">
        <div class="container">
            <!--startprint-->
            <div class="text">
                <div>设备编号:&nbsp; ${dto.getId()}</div>
                <div>设备名称:&nbsp; ${dto.getDeviceName()}</div>
                <div>购置日期:&nbsp; ${dto.getDate()}</div>
            </div>
            <div class="image">
                <img src="${qrcodePath}" id="print" height="300px" width="300px"><br>
            </div>
            <!--endprint-->
            <div class="button" id="mybutton">
                <button class="btn btn-primary" onclick="my_print()">打印图片</button>
            </div>
        </div>
    </div>
</div>
<h1 class="footer">
    浙江华扩科技有限公司<br/>
</h1>

</body>
</html>