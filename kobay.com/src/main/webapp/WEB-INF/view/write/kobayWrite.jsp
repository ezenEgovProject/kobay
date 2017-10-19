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
	$(function() {
		$('#summernote').summernote({
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
	$(function() {
		$("#saveBtn").click(function() {
					
				
			if(document.frm.lctg.value==""){
				alert("id입력");
				return;
			}
	
			var form = new FormData(document.getElementById('frm'));
// 			var form = $("#frm").serialize();
			alert(form);
			
			$.ajax({
				type : 'POST',
				data : form,
				url : "<c:url value='/uploadFileSave'/>",
				dataType : "json",
				processData: false,
			 	contentType: false,
// 			 	async: false,
				success : function(data) {
					if (data.cnt > 0) {
						alert("저장됐습니다.");
						location.href = "<c:url value='/write'/>";
					} else {
						alert("저장에실패");
					} 
				},
				error : function(error) {
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
					success : function(data) {
						if (data.resultMList != null) {
							$('#mctg').children("option").remove();
							//data.rows 에 코드, 이름 형태로 되어있다고 가정.
							var codeList = data.resultMList;
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
			 
							<select id="lctg" name="lctg" onchange="fn_next(this.value)">
								<option value="" >대분류</option>
								<c:forEach var="rs" items="${resultList}" varStatus="status">
									<option value="${rs.ctgcd}">${rs.ctgnm}</option>
								</c:forEach>
							</select> 
							<select id="mctg" name="mctg">
								<option value="">중분류</option>
							</select></label>
				
				
				<label for="field2">
				<span>등록기간: </span>
					<div class="input-daterange input-group" id="datepicker" style="width: 50%">				
							<input type="text" class="input-sm form-control" name="dateRange" id="dateRange" value="" />	
					</div>			
				</label>
				
				
				<label>
				<span>상품명: </span>
					<input type="text" class="input-field" name="auctitle" id="auctitle" required>
				</label>
				
				
				</div>
				
				<div class="form-style-3">
				<label><span>상품이미지:</span></label>
				<div class="filebox bs3-primary preview-image">
					<input class="upload-name" value="메인이미지선택" disabled="disabled" style="width: 200px;"> 
					<label for="file1">업로드</label> 
					<input type="file" name="file1" id="file1" class="upload-hidden">
				</div>
				
				<div class="filebox bs3-primary preview-image">
					<input class="upload-name" value="서브이미지1선택" disabled="disabled" style="width: 200px;"> 
					<label for="file2">업로드</label> 
					<input type="file" name="file2" id="file2" class="upload-hidden">
				</div>
						
				</div>
				
				<div class="form-style-2">
				
				<label>
				<span>상품가격: </span>
					<input type="text" class="input-field" name="sprice" id="sprice" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' >
				</label>
				
				<label>
				<span>배송방법: </span>
					<select name="deliveryway" id="deliveryway" onchange="fee(this.value)">
								<option value="" >선택</option>
								<option value="0">택배</option>
								<option value="1">직접수령</option>
					</select>
				</label>
				
				<script>
				
				function fee(dway) {
					
					var a = dway;
					
					if(a==0){
						
						$("input[name=deliveryfee]").attr("disabled",false);
						$("input[name=deliveryfee]").val('');

					}	
					else if(a==1){
						
						$("input[name=deliveryfee]").attr("disabled",true);
					}			
				}
				
				</script>
				
				<label>
				<span>배송료: </span>
					<input type="text" class="input-field" name="deliveryfee" id="deliveryfee" disabled="" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'>
				</label>
				
				<label>
				<span>판매자: </span>
					<input type="text" class="input-field" name="sellername" id="sellername" >
				</label>
				
				<script>
				
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
				
				
				<label><span>판매자연락처: </span>			
				<select name="phone1" id="phone1">
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

				<label for="field5"><span>상세정보: </span>
				<div class="float"></div>
				<textarea class="textarea-field" id="summernote" name="aucdetail"></textarea>
				</label>
				
				<label><input type="submit" id="saveBtn" value="입력"/></label>
			
			
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
