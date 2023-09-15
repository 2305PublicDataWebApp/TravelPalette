<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
        <link rel="stylesheet" href="../resources/css/community/insert.css">
    </head>
    <body>
        <!-- ��� -->
        <jsp:include page="/include/header.jsp"></jsp:include>
        
        <!-- �׺� -->
        <jsp:include page="/include/nav.jsp"></jsp:include>
  
        <!-- ���� -->
        <main>
            <div style="width: 100%;height: 135px;">
                <h4 style="float: left;font-family: 'TmoneyRoundWindExtraBold';font-size: 28px;padding: 20px;margin-top: 30px;">�Խ��� �� ���</h4>
                <button style="float: right;margin: 49px 10px 0px 0px;" type="button" class="btn btn-primary">�������</button>
                <!-- <button style="float: right;margin: 47px 10px 0px 0px;" type="button" class="btn btn-info">�����ϱ�</button> -->
            </div>
            <div style="width: 100%;margin: 0 auto;">
                <div class="form-floating mb-3">
                    <input type="text" style="border: 1px solid #ccc;" class="form-control" id="floatingInput" placeholder="������ �Է����ּ���">
                    <label for="floatingInput">����</label>
                  </div>
            </div>
            <div class="form-floating" style="margin-top: 25px;">
                <select class="form-select" id="floatingSelect" aria-label="Floating label select example" style="border: 1px solid #ccc;">
                  <option selected>�Խ����� �������ּ���!</option>
                  <option value="1">���ǹ��� �Խ���</option>
                  <option value="2">���� ���� �Խ���</option>
                  <option value="3">���� ���� �Խ���</option>
                </select>
                <label for="floatingSelect">�Խ��� ����</label>
              </div>
              <div class="input-group mb-3" style="margin-top: 25px;">
                <img src="../resources/images/community/fileadd.png" style="width: 25px;height: 25px;margin-top: 6px;margin-right: 10px;" alt="">
                <input type="file" class="form-control" id="inputGroupFile02" style="border: 1px solid #ccc;">
                <!-- <label class="input-group-text" for="inputGroupFile02">Upload</label> -->
              </div>
              <div class="form-floating">
                <textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea2" style="height: 100px;border: 1px solid #ccc;margin-top: 25px;height: 500px;resize: none;"></textarea>
                <label for="floatingTextarea2">Comments</label>
              </div>
        </main>
        <div style="width: 1000px;margin: 0 auto;text-align: center;margin-top: 70px;">
            <button type="button" class="btn btn-primary btn-lg">�� ���</button>
        </div>
        <div style="width: 100%;height: 80px;margin: 0 auto;">
        </div>
        <!-- Ǫ�� -->
        <jsp:include page="/include/footer.jsp"></jsp:include>
        <script>
            document.addEventListener("DOMContentLoaded", function() {
			    const liElements = document.querySelectorAll('nav ul li');
			    const navArea = document.getElementById('navArea');
			
			    let hoverIntent = false;
			
			    liElements.forEach(li => {
			        li.addEventListener('mouseenter', () => {
			            hoverIntent = true;
			            navArea.classList.add('show');
			            navArea.style.zIndex = 2;
			        });
			
			        li.addEventListener('mouseleave', () => {
			            hoverIntent = false;
			            setTimeout(() => {
			                if (!hoverIntent) {
			                    navArea.classList.remove('show');
                            }
                            // navArea.style.zIndex = -1;
				            }, ); // Add a delay before hiding to allow time for moving to menu_text
				        });
				    });
			
                    navArea.addEventListener('mouseenter', () => {
			        hoverIntent = true;
			    });
			
			    navArea.addEventListener('mouseleave', () => {
			        hoverIntent = false;
			        setTimeout(() => {
			            if (!hoverIntent) {
			                navArea.classList.remove('show');
			            }
                        // navArea.style.zIndex = -1;
			        }, ); // Add a delay before hiding to allow time for moving to menu_text
			    });
			});
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa" crossorigin="anonymous"></script>
    </body>
</html>