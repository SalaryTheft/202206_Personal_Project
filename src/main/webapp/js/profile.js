$(document).ready(function() {
	$("#updatePw_form input[type='submit']").click(function(e) {
		e.preventDefault();
		$("input").each(function(){
			$(this).val($(this).val().trim());
		});

		if ($("#updatePw_form input[name='memPwOld']").val().length < 4) {
			alert("현재 비밀번호를 4글자 이상 입력해주세요.");
			return false;
		}

		if ($("#updatePw_form input[name='memPw']").val().length < 4) {
			alert("변경할 비밀번호를 4글자 이상 입력해주세요.");
			return false;
		}

		if ($("#updatePw_form input[name='memPw']").val() != $("input[name='memPwConfirm']").val()) {
			alert("변경할 비밀번호 확인이 일치하지 않습니다.");
			return false;
		}

		$("#updatePw_form").submit();
	});

	$("#del_form input[type='submit']").click(function(e) {
		e.preventDefault();
		$("input").each(function(){
			$(this).val($(this).val().trim());
		});

		if ($("#del_form input[name='memPw']").val().length < 4) {
			alert("현재 비밀번호를 4글자 이상 입력해주세요.");
			return false;
		}
		
		if (confirm("정말로 탈퇴하시겠습니다? 탈퇴는 취소가 불가능합니다.")) {
			if (!$('#agree-chkbox').is(":checked")) {
				alert("탈퇴 유의 사항을 읽고 동의해주세요.");
				return false;
			}

			$("#del_form").submit();
		}
	});

});