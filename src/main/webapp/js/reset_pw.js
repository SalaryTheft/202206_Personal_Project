$(document).ready(function () {
    $("input[type='submit']").click(function (e) {
        e.preventDefault();
        $("input").each(function () {
            $(this).val($(this).val().trim());
        });

        if ($("input[name='memId']").val().length < 4) {
            alert("아이디를 4글자 이상 입력해주세요.");
            return false;
        }
        if ($("input[name='memPw']").val().length < 4) {
            alert("비밀번호를 4글자 이상 입력해주세요.");
            return false;
        }

        if ($("input[name='memPw']").val() != $("input[name='memPwConfirm']").val()) {
            alert("비밀번호 확인이 일치하지 않습니다.");
            return false;
        }

        if ($("#register_form select").val() == "") {
            alert("보안 질문을 선택해주세요.");
            return false;
        }

        if ($("input[name='memSa']").val().length < 1) {
            alert("보안 질문 정답을 입력해주세요.");
            return false;
        }

        $("#register_form").submit();

    });

});