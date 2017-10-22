<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
.dropdown {
    position: relative;
    display: inline-block;
}

.dropdown-content {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    padding: 12px 16px;
    z-index: 1;
}

.dropdown:hover .dropdown-content {
    display: block;
}
</style>
<body>
<h2><img src="../../../images/test/google.png" width="348px" height="190px"></h2>
<p>Move the mouse over the text below to open the dropdown content.</p>

<div class="dropdown">
  <span><img src="../../../images/test/google.png" width="348px" height="190px"></span>
  <div class="dropdown-content">
    <p>경매 이름:<br>
       경매 가격:
    </p>
  </div>
</div>
</body>
</html>