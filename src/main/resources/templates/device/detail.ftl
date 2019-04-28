<html>
<head>
    <meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <title>设备维修记录</title>
    <link href="https://cdn.bootcss.com/twitter-bootstrap/3.0.1/css/bootstrap.min.css" rel="stylesheet">
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
            background: #2f3e4e;
            height: 80px;
            width: 100%;
            line-height: 80px;
            font-size: xx-large;
            color: #ffffff;
            /*position: fixed;*/
        }

        .container {
            position: fixed;/*绝对定位*/
            top: 15%;
        }

        .col-md-12 column {
            width: 100%;
            height: 100%;
        }
        #table1 {
            width: 100%;
            margin-top: 50px;
            top: 150px;
            margin-left: 5em;
        }


        #table2 {
            width: 100%;
            margin-top: 50px;
            margin-left: 5em;
        }

        #page2 {
            position: relative;
            top: 20px;
            left: 35%;
        }

        #add{
            position: relative;
            top: 20px;
        }
        #back{
            position: relative;
            top: 20px;
        }

        #footer {
            left: 0px;
            position: fixed;
            width: 100%;
            height: 40px;
            text-align: center;
            font-size: 14px;
            /*font-weight:bold;*/
            bottom: 0px;
        }
        th,td{
            text-align:center;/** 设置水平方向居中 */
            vertical-align:middle/** 设置垂直方向居中 */
            white-space: nowrap;
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

        <div class="col-xs-12 col-sm-6 col-md-8" id="mt">
            <div class="col-md-12 column" >
                <table id="table1" class="table table-bordered table-condensed table-hover " style="text-align: center">
                    <thead>
                    <tr>
                        <th >设备编号</th>
                        <th >设备名称</th>
                        <th >购置日期</th>
                        <th >对内造价</th>
                        <th >存放地址</th>
                        <th >责任人</th>
                        <th >资产类别</th>
                    </tr>
                    </thead>
                    <tbody>
                    <td>${dto.getId()}</td>
                    <td>${dto.getDeviceName()}</td>
                    <td>${dto.getDate()}</td>
                    <td>${dto.getPrice()}</td>
                    <td>${dto.getAddress()}</td>
                    <td>${dto.getPrincipal()}</td>
                    <td>${dto.getCategory()}</td>
                    </tbody>
                </table>
            </div>

            <div class="col-md-12 column" >
                <table id="table2" class="table table-bordered table-condensed table-hover">
                    <thead>
                    <tr>
                        <th>维修时间</th>
                        <th>费用</th>
                        <th>备注</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <#list histories as history>
                    <tr>
                        <td>${history.getDate()}</td>
                        <td>${history.getPrice()}元</td>
                        <td>${history.getNote()}</td>
                        <td><a href="/history/delete?deviceId=${history.getDeviceId()}&historyId=${history.getId()}">删除</a></td>
                    </tr>
                    </#list>
                    </tbody>
                </table>
                <a class="btn btn-primary" id="add" href="/history/addPage?deviceId=${dto.getId()}" role="button">添加记录</a>
                <a class="btn btn-info" id="back" href="/device/list">返回</a>
                <br>
            <#--页码-->
                <div class="col-md-12 column" id="page2">
                    <ul class="pagination">
                <#if currentPage lte 1>
                    <li class="disabled"><a href="#">上一页</a></li>
                <#else>
                    <li>
                        <a href="detailPage?deviceId=${dto.getId()}&pageNum=#{currentPage-1}&pageSize=${pageSize}">上一页</a>
                    </li>
                </#if>

                <#list 1..historyPage.getTotalPages() as index>
                    <#if currentPage == index>
                        <li class="disabled"><a href="#">${index}</a></li>
                    <#elseif  index gt 0>
                        <li>
                            <a href="detailPage?deviceId=${dto.getId()}&pageNum=${index}&pageSize=${pageSize}">${index}</a>
                        </li>
                    </#if>
                </#list>

                <#if currentPage gte historyPage.getTotalPages()>
                    <li class="disabled"><a href="#">下一页</a></li>
                <#else>
                    <li>
                        <a href="detailPage?deviceId=${dto.getId()}&pageNum=${currentPage+1}&pageSize=${pageSize}">下一页</a>
                    </li>
                </#if>
                    </ul>
                </div>

            </div>
            <br>
            <h1 id="footer">
                浙江华扩科技有限公司<br/>
            </h1>
        </div>

    </div>

</body>
</html>