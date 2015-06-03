<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<%@include file="/WEB-INF/common/head.jsp"%>
</head>
<body>
    <%@include file="/WEB-INF/common/banner.jsp" %>
    <div class="page">
        <div class="box mtop">
            <%@include file="/WEB-INF/common/nav.jsp" %>
            <div class="rightbox">
    <h2 class="mbx">
        我的学习中心&nbsp;&nbsp;&nbsp;&nbsp;</h2>
    <div class="dhbg">
        <div class="dh1" style="margin: 0 27px 15px 0;">
            <div class="dhwz">
                <p>
                    您共有 <span class="red">0</span>条通知信息 <span class="red">0 </span>条未读
                </p>
                <p>
                    共有 <span class="red">0 </span>条短信息、 <span class="red">0</span>个投诉、 <span class="red">
                        0 </span>个异议
                </p>
                <p>
                    有 <span class="red">0</span>个投诉、<span class="red">0
                    </span>个异议、<span class="red">0</span>条短信息未处理</p>
                <div class="btright">
                    <a href="User/StudentInfor/Letter.aspx.html">
                        <img src="images/Student/default/bt_bzr.jpg" alt="给班主任发消息" width="121" height="25" /></a></div>
            </div>
        </div>
        <div class="dh2">
            <div class="dhwz">
                <p>
                    你有 <span class="red">0</span> 门课程要考 <a href="EducationCenter/Application.aspx.html" class="red">查看报考计划</a></p>
                <p>
                    你已经通过 <span class="red">0 </span>门课程&nbsp;共有 <span class="red">13</span> 门 <a href="EducationCenter/Score.aspx.html" class="red">查看成绩</a>
                </p>
                <p>
                    已经发放了 <span class="red">0 </span>本书籍 <a href="EducationCenter/Book.aspx.html" class="red">查看书籍情况</a></p>
                <div class="btright">
                    <a href="EducationCenter/Application.aspx.html">
                        <img src="images/Student/default/bt_jw.jpg" alt="进入教务中心" width="121" height="25" /></a></div>
            </div>
        </div>
        <div class="dh3" style="margin: 0 27px 15px 0;">
            <div class="dhwz">
                <p>
                    <a href="http://sm.zk0731.com/User/ExamCenter/ExamPractice/ListExam.aspx?ptid=1">模拟考试</a></p>
                <p>
                    <a href="http://sm.zk0731.com/User/ExamCenter/ExamPractice/ListExercise.aspx?ptid=3">章节练习</a>
                </p>
                <p>
                    <a href="http://sm.zk0731.com/User/ExamCenter/ExamPractice/ListExercise.aspx?ptid=2">网上作业</a></p>
                <div class="btright">
                    <a href="http://sm.zk0731.com/User/ExamCenter/ExamPractice/ListExam.aspx?ptid=1">
                        <img src="images/Student/default/bt_ks.jpg" alt="进入考试中心" width="121" height="25" /></a></div>
            </div>
        </div>
        <div class="dh4">
            <div class="dhwz">
                <p>
                    你应交<span class="blue">7800.00</span> 元，实缴 <span class="green">3700.00</span>元</p>
                    <p>
                    欠费 <span class="red">4100.00</span> 元</p>
                <p>
                    你总共有<span class="red">3</span> 条财务记录需要确定</p>
                
                <div class="btright">
                    <a href="MyAccount/wdcw.aspx.html">
                        <img src="images/Student/default/bt_cw.jpg" alt="进入财务中心" width="121" height="25" /></a></div>
            </div>
        </div>
    </div>

    <div class="xxlc">
        <strong class="lcbt">学历历程</strong>
    </div>
    <div class="lcbiao">
        <div class="lctime">
            2014-05-01</div>
        <div class="lctime">
            2014-05-02</div>
        <div class="lctime">
             2014-05-03</div>
        <div class="lctime2">
            2014-05-04</div>
        <div class="lctime">
             2014-05-05</div>
        <div class="lctime">
             2014-05-06</div>
        <div class="lctime">
             2014-05-07</div>
    </div>
    <div class="xxjl">
    
        <div align="center">
        <span>
            18:10 登陆系统
            
              <a></a>
              </span>
            </div>
        <div align="center">
        <span>
            18:09 登陆系统
              <a></a>
              </span>
            </div>
        <div align="center">
        <span>
            18:06 登陆系统
              <a></a>
              </span>
            </div>
        <div align="center">
        <span>
            11:19 登陆系统
              <a></a>
              </span>
            </div>
    </div>
            </div>
        </div>
        <%@include file="/WEB-INF/common/footer.jsp" %>
    </div>
</body>
</html>
