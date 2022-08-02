$(document).ready(function () {
    $("#check_id_btn").click(function (e) {
        e.preventDefault();
        $("input").each(function () {
            $(this).val($(this).val().trim());
        });

        $.ajax({
            url: "./checkIdExist.do",
            data: {
                "memId": $("input[name='memId']").val()
            },
            type: "GET",
            dataType: "text",
            success: function (data) {
                if (data == -1) {
                    alert("이미 사용 중인 아이디입니다.");
                } else if ($("input[name='memId']").val().length >= 4) {
                    alert("사용 가능한 아이디입니다.");
                } else {
                    alert("사용 불가능한 아이디입니다.")
                }
            }
        });
    });

    $("input[type='submit']").click(function (e) {
        e.preventDefault();
        $("input").each(function () {
            $(this).val($(this).val().trim());
        });

        // $("input[name='memId']").val($(self).val().trim());

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

        if (!$('#agree-chkbox').is(":checked")) {
            alert("회원 약관 및 개인정보 처리 방침에 동의해주세요.");
            return false;
        }


        $.ajax({
            url: "./checkIdExist.do",
            data: {
                "memId": $("input[name='memId']").val()
            },
            type: "GET",
            dataType: "text",
            success: function (data) {
                if (data == -1) {
                    alert("이미 사용 중인 아이디입니다.");
                    return false;
                }
            }
        });

        $("#register_form").submit();

    });

});