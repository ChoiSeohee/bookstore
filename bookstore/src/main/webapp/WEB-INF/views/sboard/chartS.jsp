<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<body class="hold-transition skin-blue">

<!-- Main content -->
<section class="content">
   <div class="row">
      <!-- left column -->
      <div class="col-md-12">
         <!-- general form elements -->
         <div class="box box-primary">
            <div class="box-header">
               <h3 class="box-title">판매정보 입력화면</h3>
            </div>
            <!-- /.box-header -->

<!-- 등록 화면 -->
<form name="chart" method="post">
   <div class="box-body">
      <div class="form-group">
         <label>소설</label>
         <input type="text" name='novel' class="form-control" placeholder="단위:만(권)")>
      </div>
      
      <div class="form-group">
         <label>인문</label>
         <input type="text" name='humanities' class="form-control" placeholder="단위:만(권)">
      </div>
      
      <div class="form-group">
         <label>교양/과학</label>
         <input type="text" name='science' class="form-control" placeholder="단위:만(권)">
      </div>
      
      <div class="form-group">
         <label>역사/문화</label>
         <input type="text" name='history_culture' class="form-control" placeholder="단위:만(권)">
      </div>
      
      <div class="form-group">
         <label>기술/컴퓨터</label>
         <input type="text" name='technology_computer' class="form-control" placeholder="단위:만(권)">
      </div>
      
      
<button type="submit" class="btn btn-primary">REGIST</button>
   </div>
</form>
</div>
</div>
</div>
</section>

</body>

</html>
<%@include file="../include/footer.jsp"%>