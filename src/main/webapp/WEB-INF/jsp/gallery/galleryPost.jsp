<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <style>
        #file {
            width: 0;
            height: 0;
            padding: 0;
            border: 0;
            overflow: hidden;
        }
    </style>
</head>
<body>
<h1 class="mb-5">게시글 작성</h1>
<form action="/gallery/galleryPost" method="post" name="form1" enctype="multipart/form-data" accept-charset="UTF-8">
    <label for="title" class="form-label">제목</label>
    <input type="text" class="form-control" placeholder="제목을 입력해 주세요." name="title" id="title">

    <label for="content" class="form-label mt-3">내용</label>
    <textarea name="content" id="content" class="form-control" cols="30" rows="10" placeholder="내용을 입력해 주세요."></textarea>

    <div class="filebox d-flex align-items-center mt-3">
        <input class="upload-name form-control w-50 me-2" value="첨부파일" placeholder="첨부파일" readonly>
        <label for="file" class="form-label btn btn-outline-info mb-0">파일찾기</label>
        <input type="file" name="files" id="file" accept="image/*" class="form-control" onchange="fileCheck(this)" multiple/>
    </div>

    <div class="post mt-3">
        <input type='button' value='게시글 등록' class="btn btn-primary" onclick="postchk()">
        <input type='button' value='취소' class="btn btn-secondary" onclick="history.back()">
    </div>
</form>
<script>
    function fileCheck(obj)
    {
        let pathpoint = obj.value.lastIndexOf('.');
        let filepoint = obj.value.substring(pathpoint + 1, obj.length);
        let filetype = filepoint.toLowerCase();

        if(filetype === 'jpg' || filetype === 'png' || filetype === 'jpeg' || filetype === 'bmp') {
            let file = document.getElementById('file');
            let name = [];

            if(file.files.length > 5) {
                alert('이미지는 5개까지만 첨부할 수 있습니다.');
                let parentObj = obj.parentNode;
                parentObj.replaceChild(obj.cloneNode(true), obj);
                document.getElementById("file").value = "";
                document.getElementsByClassName("upload-name")[0].value = "";
                return false;
            }
            else if(file.files.length > 0) {
                for(let i = 0; i < file.files.length; i++)
                {
                    name[i] = file.files[i].name;
                }
            }

            $(".upload-name").val(name.toString());
            return true;
        }
        else {
            alert('이미지 파일만 선택할 수 있습니다.');
            let parentObj = obj.parentNode;
            parentObj.replaceChild(obj.cloneNode(true), obj);
            document.getElementById("file").value = "";
            document.getElementsByClassName("upload-name")[0].value = "";
            return false;
        }
    }
    function postchk() {
        let form = document.form1;
        if(form.title.value === "" || form.content.value === "") {
            alert("비어있는 항목이 있습니다.");
        }
        else if((form.content.value.toString().split('#').length -1) > 5) {
            alert("태그는 5개까지만 사용할 수 있습니다.");
        }
        else {
            form.submit();
        }
    }
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
</body>
</html>