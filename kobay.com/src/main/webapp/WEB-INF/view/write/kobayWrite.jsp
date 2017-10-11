<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="utf-8">
<head>
	<!-- Include Date Range Picker -->
	<script type="text/javascript" src="../../../js/jquery-3.1.1.js"></script>
	<script type="text/javascript" src="../../../js/datepicker/moment.min.js"></script>
	<script type="text/javascript" src="../../../js/datepicker/daterangepicker.js"></script>
	<link rel="stylesheet" type="text/css" href="../../../css/daterangepicker.css" />
	
	
	<script type="text/javascript" charset="UTF-8" src="../../../smarteditor/js/HuskyEZCreator.js"></script>

	<script>
	    $(function() {
	        //전역변수선언
	        var editor_object = [];
	 
	        nhn.husky.EZCreator
	                .createInIFrame({
	                    oAppRef : editor_object,
	                    elPlaceHolder : "aucdetail",
	                    sSkinURI : "../../../smarteditor/SmartEditor2Skin.html",
	                    htParams : {
	                        // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
	                        bUseToolbar : true,
	                        // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
	                        bUseVerticalResizer : true,
	                        // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
	                        bUseModeChanger : true,
	                    }
	                });
	        //전송버튼 클릭이벤트
	        $("#saveBtn").click(function() {
	            //id가 smarteditor인 textarea에 에디터에서 대입
	            editor_object.getById["aucdetail"].exec("UPDATE_CONTENTS_FIELD", []);
	 
	            
	           
	        });
	    });
	 
	   
	</script>
	
	
	<script type="text/javascript">
	$(function() {
	    $('input[name="dateRange"]').daterangepicker({
	        timePicker: true,
	        timePickerIncrement: 30,
	        locale: {
	            format: 'YYYY-MM-DD H:mm A',
	        	cancelLabel: 'clear'
	        }
	    });
	    $('input[name="dateRange"]').on('apply.daterangepicker', function(ev, picker) {
	        $(this).val(picker.startDate.format('YYYY-MM-DD H:mm A') + ' ~ ' + picker.endDate.format('YYYY-MM-DD H:mm A'));
	    });

	    $('input[name="dateRange"]').on('cancel.daterangepicker', function(ev, picker) {
	        $(this).val('');
	    });

	    
	});
	</script>    
</head>
	<script>
		 $(function(){	
			$("#saveBtn").click(function(){
				
				var a = frm.auctitle.value;
				
				alert(a);
				
				var form = new FormData(document.getElementById('frm'));
				alert(form);
				
					
				$.ajax({
					type: 'POST',
					data: form,
					url: "<c:url value='/uploadFileSave'/>",
					dataType: "json",
					processData: false,
					contentType: false,
					success: function(data){                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
						if(data.cnt>0){
							alert("저장됐습니다.");
							location.href = "<c:url value='/write'/>";
						} else{
							alert("저장에실패");
						}
					},
					error: function(error){
						alert("error : " + error);
					}
				});
			});
		});
	</script>
	<script>
	function fn_next(ctgcd) {
	
		var a = "ctgcd=" + ctgcd;
		
		$.ajax({
			type : 'POST',
			data : a,
			url : "<c:url value='/selectMlist'/>",
			dataType : "json",
	/* 		processData : false,
			contentType : false, 후.........*/
			success : function(data) {	
				if (data.resultMList != null) {
					$('#mctg').children("option").remove();
				      //data.rows 에 코드, 이름 형태로 되어있다고 가정.
				      var codeList = data.resultMList;
				      for(var i = 1; i < codeList.length ; i++){
				        var option = "<option value='" + codeList[i].ctgcd + "'>" + codeList[i].ctgnm + "</option>";      
				        //대상 콤보박스에 추가
				        $('#mctg').append(option);
				      }
				}	      
			},
			error : function(x, o, e) {	
				var msg = "페이지 호출 중 에러 발생 \n" + x.status + " : " + o + " : " + e;
				alert(msg);
			}
		});
	}
	</script>
	<style type="text/css">
	.filebox input[type="file"] {
	    position: absolute;
	    width: 1px;
	    height: 1px;
	    padding: 0;
	    margin: -1px;
	    overflow: hidden;
	    clip:rect(0,0,0,0);
	    border: 0;
	}
	
	.filebox label {
	    display: inline-block;
	    padding: .5em .75em;
	    color: #999;
	    font-size: inherit;
	    line-height: normal;
	    vertical-align: middle;
	    background-color: #fdfdfd;
	    cursor: pointer;
	    border: 1px solid #ebebeb;
	    border-bottom-color: #e2e2e2;
	    border-radius: .25em;
	}
	
	/* named upload */
	.filebox .upload-name {
		display: inline-block;
		padding: .5em .75em;
		font-size: inherit;
		font-family: inherit;
		line-height: normal;
		vertical-align: middle;
		background-color: #f5f5f5;
		border: 1px solid #ebebeb;
		border-bottom-color: #e2e2e                                                                                                                               2;
		border-radius: .25em;
		-webkit-appearance: none; /* 네이티브 외형 감추기 */
		-moz-appearance: none;
		appearance: none;
	}
	
	/* imaged preview */
	.filebox .upload-display {
	    margin-bottom: 5px;
	    
	}
	
	@media(min-width: 768px) {
	    .filebox .upload-display {
	       display: inline-block;
	       margin-right: 5px;
	       margin-bottom: 0;
	    }
	}
	
	.filebox .upload-thumb-wrap {
	    display: inline-block;
	    width: 240px;
	    padding: 2px;
	    vertical-align: middle;
	    border: 1px solid #ddd;
	    border-radius: 5px;
	    background-color: #fff;
	}
	
	.filebox .upload-display img {
	    display: block;
	    max-width: 100%;
	    width: 100% \9;
	    height: auto;
	}
	
	.filebox.bs3-primary label {
		color: #fff;
		background-color: #337ab7;
		border-color: #2e6da4;
	}
	
	</style>
	  
	<script>
	$(document).ready(function(){
	   	var fileTarget = $('.filebox .upload-hidden');
	
		fileTarget.on('change', function(){
		    if(window.FileReader){
		        // 파일명 추출
		        var filename = $(this)[0].files[0].name;
		    } else {
		        // Old IE 파일명 추출
		        var filename = $(this).val().split('/').pop().split('\\').pop();
		    };
		    $(this).siblings('.upload-name').val(filename);
		});
	
	    //preview image 
	    var imgTarget = $('.preview-image .upload-hidden');
	
	    imgTarget.on('change', function(){
	        var parent = $(this).parent();
	        parent.children('.upload-display').remove();
	
	        if(window.FileReader){
	            //image 파일만
	         	if (!$(this)[0].files[0].type.match(/image\//)) return;
	            
	            var reader = new FileReader();
	            reader.onload = function(e){
	                var src = e.target.result;
	                parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img src="'+src+'" class="upload-thumb"></div></div>');
	            }
	            reader.readAsDataURL($(this)[0].files[0]);
	        }
	        else {
	            $(this)[0].select();
	            $(this)[0].blur();
	            var imgSrc = document.selection.createRange().text;
	            parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img class="upload-thumb"></div></div>');
	
	            var img = $(this).siblings('.upload-display').find('img');
	            img[0].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""+imgSrc+"\")";        
	        }
	    });
	});
	</script>
	
	<body>

    <!-- Page Content -->
    <!-- 각자페이지에서 변경할 부분 -->
    <div class="container">
	<form name="frm" method="post" id="frm" enctype="multipart/form-data"  action="">
		
		
	      
	      <div class="row">
	        <div class="col-lg-9 mb-4">
	          <h3>상품등록</h3>        
	          <p></p>
	            <div class="control-group form-group">
	             	<div class="controls">
		                <label>카테고리:</label> <br> 
		                <select id="lctg" name="lctg" onchange="fn_next(this.value)">
							<option value="">대분류</option>
							<c:forEach var="rs" items="${resultList}" varStatus="status">
								<tr>
									<td>
										<c:if test="${fn:length(rs.ctgcd)==3}">
											<option value="${rs.ctgcd}">${rs.ctgnm}</option>
										</c:if>
									</td>
								</tr>
							</c:forEach>
						</select> 
						<select id="mctg" name="mctg">
							<option value="">중분류</option>
						</select>
						<p class="help-block"></p>
	              	</div>
	            </div>
	          
 
	            <div class="control-group form-group date" id="sandbox-container">
	            <label for="datepicker">등록기간:</label>
		            <div class="input-daterange input-group" id="datepicker" style="width: 70%">
		            	<input type="text" class="input-sm form-control" name="dateRange" id="dateRange" value="" />
		            	<%-- daterange의 값을 컨트롤러로 넘겨받아 db에 저장하기전 '~'를 기준으로 나누워 sdate/edate로 저장할 것 --%> 
					</div>
				</div>
	            <div class="control-group form-group">
	              	<div class="controls">
	                	<label>상품명:</label>
	                	<input type="text" class="form-control" name="auctitle" id="auctitle">
	              	</div>
	            </div>
	            <div class="control-group form-group">
	              	<div class="controls">
	               		<label>상품이미지:</label>
	             	   	<div class="filebox bs3-primary preview-image"> 
							<input class="upload-name" value="파일선택" disabled="disabled" style="width:200px;">
							<label for="file1">업로드</label> 
							<input type="file" name="file1" id="file1" class="upload-hidden"> 
						</div>   
	              	</div>
	            </div> 
	            <div class="control-group form-group">
	             	<div class="controls">
		                <label>상품가격:</label>
		                <input type="text" class="form-control" name="sprice" id="sprice">
	              	</div>
	            </div>
	            
	            <div class="control-group form-group">
	              	<div class="controls">
		                <label>배송방법:</label>
		                	<select name="deliveryway" id="deliveryway">
								<option value="0">택배</option>
								<option value="1">직접수령</option>
							</select>
	              	</div>
	            </div>
	            <div class="control-group form-group">
					<div class="controls">
					  	<label>배송료:</label>
					  	<input type="text" class="form-control" name="deliveryfee" id="deliveryfee">
					</div>
	            </div>
	            <div class="control-group form-group">
	              	<div class="controls">
	                	<label>판매자:</label>
	                	<input type="text" class="form-control" name="sellername" id="sellername">
	              	</div>
	            </div>
	            <div class="control-group form-group">
	              	<div class="controls">
		               	<label>판매자연락처:</label>
		               	<input type="text" class="form-control" id="sellerphone" name="sellerphone">
         	 		</div>
	            </div>
	            
	           <div class="control-group form-group">
	              	<div class="controls">
	                	<label>상세정보:</label>
	                	<textarea class="form-control" id="aucdetail" style="HEIGHT: 220px; WIDTH: 660px" rows="10" cols="30" name="aucdetail"></textarea>
	              	</div>
	           </div>
	           
	            <div id="success">
	            </div>
	            <!-- For success/fail messages -->
	            <button type="button" class="btn btn-primary" id="saveBtn">등록</button>
	        </div>
      </div>
      </form> 
    </div>
    <!-- /.container -->
    <!-- /.Page Content -->

    <!-- Footer -->


    <!-- Bootstrap core JavaScript -->
    <script src="../../../../vendor/popper/popper.min.js"></script>
    <script src="../../../../vendor/bootstrap/js/bootstrap.min.js"></script>
    
  </body>

</html>
