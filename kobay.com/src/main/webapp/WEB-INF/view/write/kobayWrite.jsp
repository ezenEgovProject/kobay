<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>

<!-- Include Date Range Picker -->

<script type="text/javascript" src="../../../js/datepicker/moment.min.js"></script>
<script type="text/javascript" src="../../../js/datepicker/daterangepicker.js"></script>
<link rel="stylesheet" type="text/css" href="../../../css/daterangepicker.css" />
<link rel="stylesheet" type="text/css" href="../../../css/write.css" />

<link rel="stylesheet" type="text/css" href="../../../dist/summernote.css" />
<script type="text/javascript" charset="UTF-8" src="../../../dist/summernote.js"></script>
<script src="../../../dist/lang/summernote-ko-KR.js"></script>

<script type="text/javascript">

//summernote 적용부분

$(function() {
	$('#summernote').summernote({
		popover: false,
		height : 300, // 기본 높이값
		minHeight : null, // 최소 높이값(null은 제한 없음)
		maxHeight : null, // 최대 높이값(null은 제한 없음)
		focus : false, // 페이지가 열릴때 포커스를 지정함
		lang : 'ko-KR', // 한국어 지정(기본값은 en-US)
		callbacks: {
        	onImageUpload: function(files, editor, welEditable) {
                for (var i = files.length - 1; i >= 0; i--) {
                  sendFile(files[i], this);
                }
        	}
        }

	});
});

function sendFile(file, el) {
    var form_data = new FormData();
    form_data.append('file', file);
    $.ajax({
      data: form_data,
      type: "POST",
      url: '/image',
      cache: false,
      contentType: false,
      enctype: 'multipart/form-data',
      processData: false,
      success: function(url) {
        $(el).summernote('editor.insertImage', url);
        $('#imageBoard > ul').append('<li><img src="'+url+'" width="480" height="auto"/></li>');
        $('textarea[name="aucdetail"]').html($('#summernote').code());
      }
    });
  }

</script>

<script type="text/javascript">

//daterangepicker 적용부분

	$(function() {
		$('input[name="dateRange"]').daterangepicker({
			
			timePicker : true,
			timePickerIncrement : 30,
			locale : {
				format : 'YYYY-MM-DD H:mm A',
				cancelLabel : 'clear'
			}
			
		});
		$('input[name="dateRange"]').on(
				'apply.daterangepicker',
				function(ev, picker) {
					$(this).val(
							picker.startDate.format('YYYY-MM-DD H:mm A')
									+ ' ~ '
									+ picker.endDate
											.format('YYYY-MM-DD H:mm A'));
				});

		$('input[name="dateRange"]').on('cancel.daterangepicker',
				function(ev, picker) {
					$(this).val('');
				});

	});
	
</script>

<script>
//글 저장 부분
	$(function() {
		$("#saveBtn").click(function() {
			
			//null값 체크
			var text;
		    
			if (document.frm.lctg.value=="") {
		    	text = "대분류를 입력해주세용.";
		    	document.getElementById("ctgchk").innerHTML = text;
		    	document.frm.lctg.focus();
		        return;
		    }else{
		    	document.getElementById("ctgchk").innerHTML = "";
		    }
			
			if (document.frm.mctg.value=="") {
		    	text = "중분류를 입력해주세용";
		    	document.getElementById("ctgchk").innerHTML = text;
		    	document.frm.mctg.focus();
		        return;
		    }else{
		    	document.getElementById("ctgchk").innerHTML = "";
		    }
			
		   	if (document.frm.auctitle.value=="") {
		    	text = "상품명을 입력해주세용.";
		    	document.getElementById("titchk").innerHTML = text;
		    	document.frm.auctitle.focus();
		        return;
		    }else{
		    	document.getElementById("titchk").innerHTML = "";
		    }
		   	
		   	if (document.frm.file1.value=="") {
		    	text = "메인사진을 등록해주세용.";
		    	document.getElementById("mimgchk").innerHTML = text;
		    	document.frm.file1.focus();
		        return;
		    }else{
		    	document.getElementById("mimgchk").innerHTML = "";
		    }
		   	
		   	if (document.frm.sp.value=="") {
		    	text = "상품가격을 등록해주세용.";
		    	document.getElementById("spchk").innerHTML = text;
		    	document.frm.sp.focus();
		        return;
		    }else{
		    	document.getElementById("spchk").innerHTML = "";
		    }
		   	
		   	if (document.frm.dw.value=="") {
		    	text = "배송방법을 선택해주세용.";
		    	document.getElementById("dwchk").innerHTML = text;
		    	document.frm.dw.focus();
		        return;
		    }else{
		    	document.getElementById("dwchk").innerHTML = "";
		    }
		   	
		   	if(document.frm.dw.value=="0" && document.frm.df.value==""){
		   		text = "배송료를 입력해주세요.";
		   		document.getElementById("dfchk").innerHTML = text;
		    	document.frm.df.focus();
		        return;
		   	}else{
		    	document.getElementById("dfchk").innerHTML = "";
		    }
		   	
		   	if (document.frm.sellername.value=="") {
		    	text = "판매자를 입력해주세용.";
		    	document.getElementById("snchk").innerHTML = text;
		    	document.frm.sellername.focus();
		        return;
		    }else{
		    	document.getElementById("snchk").innerHTML = "";
		    }
		    
		   	if (document.frm.phone1.value=="" || document.frm.phone2.value=="" || document.frm.phone3.value=="") {
		    	text = "전화번호를 입력해주세용.";
		    	document.getElementById("pnchk").innerHTML = text;
		    	document.frm.phone1.focus();
		        return;
		    }else if(document.frm.phone2.value.length<3 || document.frm.phone3.value.length<4){
		    	text = "전화번호를 제대로 입력해주세용.";
		    	document.getElementById("pnchk").innerHTML = text;
		    	document.frm.phone1.focus();
		        return;
		    }else{
		    	document.getElementById("pnchk").innerHTML = "";
		    }
		   	
		   	if(document.frm.aucdetail.value==""){
		   		text = "상세정보를 입력해주세요.";
		   		document.getElementById("adchk").innerHTML = text;
		    	document.frm.aucdetail.focus();
		        return;
		   	}else{
		    	document.getElementById("adchk").innerHTML = "";
		    }
			
			var form = new FormData(document.getElementById('frm'));

			$.ajax({
				type : 'POST',
				data : form,
				url : "<c:url value='/uploadFileSave'/>",
				dataType : "json",
				processData: false,
			 	contentType: false, 
				success : function(data) {
					if (data.cnt > 0) {
						alert("저장됐습니다.");
						location.href = "<c:url value='/main'/>";
					} else {
						alert("저장에실패");
					} 
				},
				error : function(error) {
					  alert("error" + error);

				}
			});
		});
	});
</script>

<script>

//write 페이지에 대분류 선택하면 중분류 뽑아오는 함수

	function fn_next(ctgcd) {
		
		var a = "ctgcd=" + ctgcd;

		$.ajax({
					type : 'POST',
					data : a,
					url : "<c:url value='/selectMlist'/>",
					dataType : "json",
					success : function(data) {
						if (data.resultMList != null) {
							$('#mctg').children("option").remove();
							//data.rows 에 코드, 이름 형태로 되어있다고 가정.
							var codeList = data.resultMList;
							$('#mctg').append( "<option value=''>중분류</option>");
							
							for (var i = 0; i < codeList.length; i++) {
								var option = "<option value='" + codeList[i].ctgcd + "'>"
										+ codeList[i].ctgnm + "</option>";
								//대상 콤보박스에 추가
								$('#mctg').append(option);
							}
						}
					},
					error : function(x, o, e) {
						var msg = "페이지 호출 중 에러 발생 \n" + x.status + " : " + o
								+ " : " + e;
						alert(msg);
					}
				});
	}


//파일 미리보기 구현 함수
	$(document)
			.ready(
					function() {
						var fileTarget = $('.filebox .upload-hidden');

						fileTarget.on('change', function() {
							if (window.FileReader) {
								// 파일명 추출
								var filename = $(this)[0].files[0].name;
							} else {
								// Old IE 파일명 추출
								var filename = $(this).val().split('/').pop()
										.split('\\').pop();
							}
							;
							var fileName;
							fileName = filename.slice(filename.indexOf(".") + 1).toLowerCase();
							if(fileName != "jpg" && fileName != "png" &&  fileName != "gif" &&  fileName != "bmp"){
								alert("이미지 파일은 (jpg, png, gif, bmp) 형식만 등록 가능합니다.");
								$(this).siblings('.upload-name').val("");
								return;
							}

						
							$(this).siblings('.upload-name').val(filename);
						});

						//preview image 
						var imgTarget = $('.preview-image .upload-hidden');

						imgTarget
								.on(
										'change',
										function() {
											var parent = $(this).parent();
											parent.children('.upload-display')
													.remove();

											if (window.FileReader) {
												//image 파일만
												if (!$(this)[0].files[0].type
														.match(/image\//))
													return;
													

												var reader = new FileReader();
												reader.onload = function(e) {
													var src = e.target.result;
													parent
															.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img src="'+src+'" class="upload-thumb"></div></div>');
												}
												reader
														.readAsDataURL($(this)[0].files[0]);
											} else {
												$(this)[0].select();
												$(this)[0].blur();
												var imgSrc = document.selection
														.createRange().text;
												parent
														.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img class="upload-thumb"></div></div>');

												var img = $(this).siblings(
														'.upload-display')
														.find('img');
												img[0].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""
														+ imgSrc + "\")";
											}
										});
					});
					

// 숫자만 입력 받을 수 있게 해주는 함수	
	function onlyNumber(event){
		event = event || window.event;
		var keyID = (event.which) ? event.which : event.keyCode;
		if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
			return;
		else
			return false;
	}
	function removeChar(event) {
		event = event || window.event;
		var keyID = (event.which) ? event.which : event.keyCode;
		if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
			return;
		else
			event.target.value = event.target.value.replace(/[^0-9]/g, "");
	}
</script>

</head>
<body>

	<!-- Page Content -->
	<!-- 각자페이지에서 변경할 부분 -->
	<div class="container"> 
	
	<form name="frm" method="post" id="frm" enctype="multipart/form-data">
	<div class="form-style-2">
		<div class="form-style-2-heading">상품등록</div>
			
				<label for="field1">
				<span>카테고리: </span>
			 
							<select class="select-field" id="lctg" name="lctg" onchange="fn_next(this.value)">
								<option value="" >대분류</option>
								<c:forEach var="rs" items="${resultList}" varStatus="status">
									<option value="${rs.ctgcd}">${rs.ctgnm}</option>
								</c:forEach>
							</select> 
							
							<select class="select-field" id="mctg" name="mctg">
								<option value="">중분류</option>
							</select></label>
							<p id="ctgchk" style = "font-style: italic ; font-weight: bold; font-size:0.8em;  color: red;"></p>
				
				
				<label for="field2">
				<span>등록기간: </span>
					<div class="input-daterange input-group" id="datepicker" style="width: 50%">				
							<input type="text" class="input-sm form-control" name="dateRange" id="dateRange" value="" />	
					</div>			
				</label>
				
				
				<label for="field3">
				<span>상품명: </span>
					<input type="text" class="input-field" name="auctitle" id="auctitle" autocomplete="off" />
				</label>
				<p id="titchk" style = "font-style: italic ; font-weight: bold; font-size:0.5em;  color: red;"></p>
				
				
				</div>
			
				<div class="form-style-3">
				<label><span>상품이미지:</span></label>
				<p style = "font-style: italic ; font-weight: bold; font-size:0.8em;  color: red;">메인이미지는 필수 등록사항입니다.</p>
				<div class="filebox bs3-primary preview-image">
					<input class="upload-name" value="메인이미지선택" disabled="disabled" style="width: 200px;"> 
					<label for="file1">업로드</label> 
					<input type="file" name="file1" id="file1" class="upload-hidden" >
				</div>
				
				<div class="filebox bs3-primary preview-image">
					<input class="upload-name" value="서브이미지1선택" disabled="disabled" style="width: 200px;"> 
					<label for="file2">업로드</label> 
					<input type="file" name="file2" id="file2" class="upload-hidden">
				</div>
				
				<div class="filebox bs3-primary preview-image">
					<input class="upload-name" value="서브이미지2선택" disabled="disabled" style="width: 200px;"> 
					<label for="file3">업로드</label> 
					<input type="file" name="file3" id="file3" class="upload-hidden">
				</div>
				
				<div class="filebox bs3-primary preview-image">
					<input class="upload-name" value="서브이미지3선택" disabled="disabled" style="width: 200px;"> 
					<label for="file4">업로드</label> 
					<input type="file" name="file4" id="file4" class="upload-hidden">
				</div>
						
				</div>
				<p id="mimgchk" style = "font-style: italic ; font-weight: bold; font-size:0.8em;  color: red;"></p>
				
				<div class="form-style-2">
				
				<label for="field4">
				<span>상품가격: </span>
					<input type="text" class="input-field" name="sp" id="sp" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' autocomplete="off" >
				</label>
				<p id="spchk" style = "font-style: italic ; font-weight: bold; font-size:0.8em;  color: red;"></p>
				
				<label for="field5">
				<span>배송방법: </span>
					<select class="select-field" name="dw" id="dw" onchange="fee(this.value)">
								<option value="">선택</option>
								<option value="0">택배</option>
								<option value="1">직접수령</option>
					</select>
				</label>
				<p id="dwchk" style = "font-style: italic ; font-weight: bold; font-size:0.8em;  color: red;"></p>
				
				<script>
				// 배송 방법 선택시 배송료 필드에 disabled 추가,제거 해주는 함수
				function fee(dway) {
					
					var a = dway;
					
					if(a=="0"){
						$("input[name=df]").attr("disabled",false);
						
					}else if(a=="1"){
						$("input[name=df]").attr("disabled",true);
						$("input[name=df]").val("");
					}else{
						$("input[name=df]").attr("disabled",true);
						$("input[name=df]").val("");
					}			
				}
				
				</script>
				
				<label for="field6">
				<span>배송료: </span>
					<input type="text" class="input-field" name="df" id="df" disabled="" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' autocomplete="off" >
				</label>
				<p id="dfchk" style = "font-style: italic ; font-weight: bold; font-size:0.8em;  color: red;"></p>
				
				<label for="field7">
				<span>판매자: </span>
					<input type="text" class="input-field" name="sellername" id="sellername" autocomplete="off" >
				</label>				
				<p id="snchk" style = "font-style: italic ; font-weight: bold; font-size:0.8em;  color: red;"></p>
				
				<label for="field8"><span>판매자연락처: </span>			
				<select class="select-field" name="phone1" id="phone1" >
								<option value="">선택</option>
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="011">017</option>
								<option value="011">019</option>
				</select> -
				<input type="text" class="tel-number-field" id="phone2" name="phone2" value="" maxlength="4"
				onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' /> -
				<input type="text" class="tel-number-field" id="phone3" name="phone3" value="" maxlength="4"
				onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' /></label>
				
				<p id="pnchk" style = "font-style: italic ; font-weight: bold; font-size:0.8em;  color: red;"></p>

				<label for="field9"><span>상세정보: </span>
				<div class="float"></div>
				<textarea class="textarea-field" id="summernote" name="aucdetail"></textarea>				
				</label>
				<p id="adchk" style = "font-style: italic ; font-weight: bold; font-size:0.8em;  color: red;"></p>
			
				<input type="button" id="saveBtn" value="입력"/>
				
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
