<!-- 1. 입력 폼을 채우고 제출하면 페이지 리로드 후 변화가 없음
뒤로가기 클릭 시 jquery 문구 "로그인 성공!"이 출력되고 확인 클릭 시 메인 페이지로 이동함 -->
<%--이슈해결 완료 _ 현준--%>


<%
    /**
     * login시 입력한 ID와 PW를 한줄의 String으로 만들어서 AjaxAction 클래스로 보냅니다.
     * */
    String errorMessage = (String) request.getAttribute("error");
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!doctype html>
<html>
<head>
    <title> Restaurant LOGIN</title>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Caveat&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Amatic+SC:wght@700&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo:wght@800&family=Oswald:wght@300&display=swap"
          rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">

    <!-- Libs CSS -->
    <link rel="stylesheet" href="../../../assets/libs/ion-rangeslider/css/ion.rangeSlider.min.css">
    <link rel="stylesheet" href="../../../assets/libs/litepicker/dist/css/litepicker.css">
    <link rel="stylesheet" href="../../../assets/libs/bootstrap-icons/font/bootstrap-icons.css">
    <link rel="stylesheet" href="../../../assets/libs/magnific-popup/dist/magnific-popup.css">

    <!-- Theme CSS -->
    <link rel="stylesheet" href="../../../assets/css/theme.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css"/>

    <!-- Libs JS -->
    <script src="../../../assets/libs/jquery/dist/jquery.min.js"></script>
    <script src="../../../assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <script src="../../../assets/libs/jquery-slimscroll/jquery.slimscroll.min.js"></script>
    <script src="../../../assets/libs/magnific-popup/dist/jquery.magnific-popup.min.js"></script>
    <script src="../../../assets/libs/prismjs/prism.js"></script>
    <script src="../../../assets/libs/leaflet/dist/leaflet.js"></script>
    <script src="../../../assets/libs/litepicker/dist/litepicker.js"></script>
    <script src="../../../assets/libs/ion-rangeslider/js/ion.rangeSlider.min.js"></script>
    <script src="../../../assets/libs/inputmask/dist/jquery.inputmask.min.js"></script>


    <!-- clipboard -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/clipboard.js/1.5.12/clipboard.min.js"></script>

    <!-- Theme JS -->
    <script src="../../../assets/js/theme.min.js"></script>
</head>
<body class="bg-light">

<main>

    <%--로그인 완료시 error page 대신 이미 로그인되었다는 modal 띄우기--%>
    <%--                class="w-100 btn btn-lg btn-dark" style="font-family: 'Noto Serif KR', serif;"--%>
    <%--        onclick="button()"--%>
    <%--    </form>--%>
    <div class="container">
        <form>
            <div class="py-5 text-center" style="margin-bottom: 50px; margin-top: 180px;">
                <h2 style="font-family: 'Noto Serif KR', serif;">로그인</h2>
                <p class="lead" style="font-family: 'Noto Serif KR', serif;"> 아직 계정이 없으신가요? <a
                        href="signupPage.sep">회원가입</a></p>
            </div>
            <div>
                <div class="needs-validation" novalidate>
                    <div class="row g-3">
                        <div style="width: 650px; margin: auto;">
                            <label for="floatingInput" class="form-label"
                                   style="font-family: 'Noto Serif KR', serif;">아이디</label>
                            <div class="input-group has-validation">
                                <input type="text" class="form-control" id="floatingInput" placeholder="" required>
                                <div class="invalid-feedback">
                                    아이디를 입력해주세요.
                                </div>
                            </div>
                        </div>

                        <div style="width: 650px; margin: auto;">
                            <label for="floatingPassword" class="form-label"
                                   style="font-family: 'Noto Serif KR', serif;">비밀번호</label>
                            <input type="text" class="form-control" id="floatingPassword" placeholder="" required="">
                            <div class="invalid-feedback">
                                비밀번호를 입력해주세요.
                            </div>
                        </div>
                    </div>
                    <button type="button" class="w-100 btn btn-lg btn-dark" style="font-family: 'Noto Serif KR', serif; margin-top: 30px;"
                            id="lo_button">로그인 하기
                    </button>
                </div>
            </div>
        </form>
    </div>
</main>

<script src="js/bootstrap.bundle.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</body>

<script>

    $(document).ready(function () { //이 파일이 시작되면 자동으로 실행됩니다.
        errorAlert();
    })

    function errorAlert() {
        var errorMessage = "<%=errorMessage%>";
        if (errorMessage != 'null')
            swal({
                title: '잠깐!',
                text: errorMessage,
                icon: 'info',
                button: '확인',
            });
    }

    $("#test_swal").click(function test_swal() {
        swal({
            title: '테스트.',
            text: '테스트는 완료됨.',
            icon: 'info',
            button: '확인,'
        });
    })


    // $("#lo_button").click(function test_swal(){
    //     if(0){
    //         swal({
    //             title: '테스트.',
    //             text: 'if테스트 완료됨.',
    //             icon: 'info',
    //             button: '확인,'
    //         }).then(function(){
    //             window.location.href = "main.sep"
    //         });
    //     }
    //     else{
    //         swal({
    //             title: '테스트.',
    //             text: 'else테스트 완료됨.',
    //             icon: 'info',
    //             button: '확인,'
    //         }).then(function(){
    //             window.location.href = "main.sep"
    //         })
    //     }
    //
    // })
    //swal test용 함수

    $("#lo_button").click(function () {
        let id = $('#floatingInput').val();
        let pw = $('#floatingPassword').val();
        let data = id + "-/-/-" + pw; //데이터를 1줄로 합침.

        $.ajax({
            url: "ajax.sep",
            type: "post",
            data: {
                req: "login", //AjaxAction 클래스에다가 req값을 전달해줍니다.
                data: data //AjaxAction 클래스에다가 data값을 전달해줍니다.
            }, success: function (lo) { //login은 ajaxAction 클래스가 return해준 값을 담는 변수 이름입니다.
                if (lo == "1") {
                    swal({
                        title: '로그인 성공!',
                        text: 'Restaurant에 오신 걸 환영합니다.',
                        icon: 'success',
                        button: '확인',

                    }).then(function () {
                        window.location.href = "main.sep"
                    });
                } else {
                    swal({
                        title: '로그인 실패!',
                        text: '다시 입력해주세요!',
                        icon: 'error',
                        button: '확인',
                    }).then(function () {
                        location.reload();
                    });
                }
            }
        })

    })
</script>
</html>
