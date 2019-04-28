<html>
<head>
    <meta charset="UTF-8" name="viewport">
    <title>维修记录添加</title>
    <link href="https://cdn.bootcss.com/twitter-bootstrap/3.0.1/css/bootstrap.min.css" rel="stylesheet">
    <style type="text/css">
        .divForm{
            position: fixed;/*绝对定位*/
            width: 1000px;
            height: 800px;
            top: 50%;
            left: 50%;
            margin-top: -250px;
            margin-left: -250px;
        }
        .footer {
            position: absolute;
            text-align:center;
            top: 92%;
            left: 50%;
            margin-left: -70px;
        }
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
        <div class="divForm">
            <form action="/history/add" method="post" class="form-horizontal">
                <div class="form-group">
                    <div for="forDeviceId" class="col-sm-2 control-label">设备编号:</div>
                    <div class="col-sm-3">
                        <input type="text" class="form-control" id="forDeviceId" name="deviceId" value="${deviceId}" readonly>
                    </div>
                </div>
                <div class="form-group">
                    <div for="forHistoryDate" class="col-sm-2 control-label">维修时间:</div>
                    <div class="col-sm-3">
                        <input type="date" class="form-control" id="forHistoryDate" name="date" value="2019-01-01" required>
                    </div>
                </div>
                <div class="form-group">
                    <div for="repairPrice" class="col-sm-2 control-label">价格:</div>
                    <div class="col-sm-3">
                        <input type="text" class="form-control" id="repairPrice" name="price" required>
                    </div>
                </div>
                <div class="form-group">
                    <div for="forNote" class="col-sm-2 control-label">备注:</div>
                    <div class="col-sm-3">
                        <input type="text" class="form-control" id="forNote" name="note" required>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-3">
                        <div class="form-actions">
                            <button type="submit" class="btn btn-primary">保存</button>
                            <a class="btn btn-info" href="/detailPage?deviceId=${deviceId}" role="button">取消</a>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<div class="footer">浙江华扩科技有限公司</div>
</body>