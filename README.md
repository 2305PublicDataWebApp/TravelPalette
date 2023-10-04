

![logo](https://github.com/2305PublicDataWebApp/TravelPalette/assets/134674356/8324a738-77d9-4513-b19d-e76b63b909d6)
# 여행팔레트<br>여행지 정보 및 커뮤니티 사이트
</br>

## ⛰️ 프로젝트 목적

✔ 여행객들에게 질 좋은 여행 정보 및 서비스를 제공</br>
✔ 여행객들 간의 커뮤니티를 제공해 생생한 후기와 정보를 제공</br>
✔ 지도를 통해 우리나라의 여행지를 한 눈에 파악</br>
</br>
## 🏖️ 개발 기간

2023.09.01 - 2023.09.27
</br>

## 🌅 개발 환경
![image](https://github.com/2305PublicDataWebApp/TravelPalette/assets/134674356/a99d6043-880b-4217-b95e-57c054368f70)

## ✈️ 팀 소개 및 팀원 소개
### 모험가조 > 4명의 모험가들
![image](https://github.com/2305PublicDataWebApp/TravelPalette/assets/134674356/1cef53de-0b21-43af-a7e0-5d40511fcdab)

</br>

## 🚄 주요 기능
### 회원관리
기능명 | 상세
-------|-----
회원가입 | 아이디, 비밀번호, 이름, 닉네임, 이메일, 성별, 전화번호, SMS/메일 수신 여부를 입력하면 가입이 가능하다. 필수 정보는 반드시 입력해야 하며 닉네임은 중복 확인을 통해 고유한 정보임을 확인해야 한다. 이메일은 이메일 인증을 통해 사용자가 실제 사용하는 계정임을 인증해야 한다. 아이디, 닉네임, 이메일은 회원 간 중복될 수 없다.
로그인 | 회원가입 시 입력한 정보와 아이디, 비밀번호가 일치하면 로그인이 가능하다. 로그인 창에서 회원가입, 아이디 찾기, 비밀번호 찾기 페이지로 이동할 수 있다. 아이디 찾기에서는 이름과 이메일을 입력하면 일부가 가려진 아이디 정보를 확인할 수 있고 비밀번호 찾기 페이지에서는 아이디와 이메일을 입력하면 입력한 이메일에 임시 비밀번호가 전송된다.
소셜 로그인 | 카카오톡 계정과 비밀번호를 통해 소셜 로그인을 할 수 있다. 소셜 로그인도 회원과 동일하게 사이트 이용이 가능하다.
마이페이지 | 회원의 최근 활동 내역을 10개까지 확인할 수 있다. 회원 정보 수정, 1:1 문의, 회원 탈퇴 페이지로 이동할 수 있다. 회원 정보 수정 페이지에서는 비밀번호, 닉네임, 이메일, 전화번호, SMS/메일 수신 여부를 수정할 수 있다. 닉네임과 이메일을 변경할 경우 중복 확인 및 이메일 인증을 해야 변경이 가능하다. 회원 탈퇴 페이지에서는 비밀번호를 입력 시 정말 탈퇴할 것인지 확인 창이 뜨고 확인을 누르면 회원 탈퇴가 된다.
1:1 문의 | 관리자에게 문의할 수 있다. 내가 문의한 내역을 확인할 수 있고 문의글을 작성할 수 있다. 작성 시 파일을 첨부할 수 있고 관리자의 답변이 달리기 전까지 문의글을 수정할 수 있다. 관리자의 답변이 달리면 내가 문의할 글 내에서 답변을 확인할 수 있고 답변이 달리면 삭제만 가능하다.
### 커뮤니티
기능명 | 상세
-------|-----
모든 게시판 | 로그인 한 회원은 게시글을 작성, 수정, 삭제 가능하고 최신순, 좋아요순으로 정렬이 가능하며 태그별로 검색이 가능하다.
동행 게시판 | 로그인 한 회원은 다른 회원들에게 여행 메이트를 모집하는 정보를 담은 게시글을 작성할 수 있으며 기본 양식이 제공되고 수정이 가능하다.
여행 인증 게시판 | 로그인 한 회원은 다른 회원들에게 자신이 다녀온 여행지에 관한 정보를 담은 게시글 작성할 수 있다. 사진 첨부도 가능하다.
질문 게시판 | 로그인 한 회원은 다른 회원들에게 궁금한 점을 질문할 수 있는 게시글을 작성할 수 있다.
게시글 상세보기 | 여행 인증 게시판은 사진을 누르면 모달로 사진이 원래 크기대로 보이고 다른 곳을 누르면 원래 화면으로 돌아간다. 댓글 작성, 수정, 삭제가 가능하며 게시글과 댓글 모두 좋아요를 누르고 취소할 수 있다. 또한 비밀댓글을 사용할 수 있으며 작성자와 본인에게만 내용이 보인다.
### 이벤트 게시판
기능명 | 상세
-------|-----
이벤트 게시판 | 관리자만 작성, 수정, 삭제가 가능하다. 사용자는 이벤트 게시판 목록을 조회 가능하다.
진행중이벤트 | 사용자는 진행중 이벤트 조회 가능하다.
완료된이벤트 | 사용자는 완료된 이벤트 조회 가능하다.
이벤트 게시판 상세 | 사용자는 이벤트 게시판 상세정보를 조회 가능하다. 이벤트 상세에서 이미지를 누르면 해당 이벤트 페이지로 이동한다.
### 지도
기능명 | 상세
-------|-----
지도 | 마커를 누르면 커스텀오버레이가 튀어나오고 커스텀오버레이를 클릭하면 해당 여행지 상세페이지로 이동한다. 커스텀 오버레이가 켜져있는 마커를 누르면 커스텀 오버레이가 꺼진다.
여행상세정보지도 | 여행상세정보에 지도를 누르면 카카오맵으로 연결된다.
### 관리자
기능명 | 상세
-------|-----
1:1 문의 답변 | 회원이 1:1로 문의 준 것을 목록으로 확인할 수 있고, 눌러서 답변 가능하다. 수정도 가능하며 삭제는 할 수 없다. 답변하지 않았을 시 X가, 답변 시 답변완료가 노출된다.






## 🚌 여행팔레트 살펴보기

### 1. 메인화면
![FireShot Capture 003 - Document - 127 0 0 1](https://github.com/2305PublicDataWebApp/TravelPalette/assets/134674342/90c1c96b-1cab-4b2b-a769-98778f2d93d5)

### 2. 회원가입
<img width="1440" alt="회원가입" src="https://github.com/2305PublicDataWebApp/TravelPalette/assets/134674356/a06426ff-8be8-4bc7-bf8d-f699eee8bc92">

### 3. 로그인
<img width="1440" alt="로그인" src="https://github.com/2305PublicDataWebApp/TravelPalette/assets/134674356/971059e0-8d6b-4831-a8c9-24d94f193349">

3-1 아이디찾기
<img width="1440" alt="아이디 찾기" src="https://github.com/2305PublicDataWebApp/TravelPalette/assets/134674356/ff333960-bb77-4821-98fc-619f2d77d8d7">

3-2 비밀번호찾기
<img width="1440" alt="비밀번호 찾기" src="https://github.com/2305PublicDataWebApp/TravelPalette/assets/134674356/7738d669-3475-43e9-be87-006d6be84d4c">
### 4. 소셜 로그인
<img width="1440" alt="소셜 로그인1" src="https://github.com/2305PublicDataWebApp/TravelPalette/assets/134674356/cafc0e5e-9d4e-47ac-ba47-0d919269b844">
<img width="1440" alt="소셜 로그인2" src="https://github.com/2305PublicDataWebApp/TravelPalette/assets/134674356/b8110332-d8b6-477c-9652-bd6b6d4272f1">


### 5. 마이페이지

5-1 마이페이지(최근 활동 내역)
<img width="1440" alt="마이페이지" src="https://github.com/2305PublicDataWebApp/TravelPalette/assets/134674356/c8c7db69-4b0a-4692-81f0-c90fa740617e">

5-2 회원 정보 수정
<img width="1440" alt="비밀번호 확인" src="https://github.com/2305PublicDataWebApp/TravelPalette/assets/134674356/49138e7a-c66a-479b-973a-2426a0bc0abe">
<img width="1440" alt="회원 정보 수정" src="https://github.com/2305PublicDataWebApp/TravelPalette/assets/134674356/e688ffb1-4f92-47cd-8649-89a8a73c77d4">

5-3 회원 탈퇴
<img width="1440" alt="회원 탈퇴" src="https://github.com/2305PublicDataWebApp/TravelPalette/assets/134674356/7700b7ad-3b51-4421-b918-3f60ccc4c7c3">

### 6. 1:1 문의
<img width="1440" alt="1:1 문의 내역" src="https://github.com/2305PublicDataWebApp/TravelPalette/assets/134674356/ab984adb-5404-4db2-a8c0-087027daa704">
<img width="1440" alt="1:1 문의 상세 조회" src="https://github.com/2305PublicDataWebApp/TravelPalette/assets/134674356/86b44550-4c5d-4943-8f7e-ba0778a28eba">
<img width="1440" alt="1:1 문의 작성" src="https://github.com/2305PublicDataWebApp/TravelPalette/assets/134674356/bee542b3-39e5-4751-bf3c-e683c630e096">


### 7. 커뮤니티
7-1 여행 정보 게시판
![FireShot Capture 002 - Document - 127 0 0 1](https://github.com/2305PublicDataWebApp/TravelPalette/assets/134674342/5980fe70-d097-42f5-ad1a-5dbe8efa7129)

7-2 질의 문답 게시판
![FireShot Capture 004 - Document - 127 0 0 1](https://github.com/2305PublicDataWebApp/TravelPalette/assets/134674342/2fa8615a-dc4e-4dc3-bdb9-52a501e07187)

7-3 동행 구인 게시판
![FireShot Capture 005 - Document - 127 0 0 1](https://github.com/2305PublicDataWebApp/TravelPalette/assets/134674342/d897252f-2684-4a3f-a3a6-9fb33b46052b)

7-4 게시글 상세보기
![FireShot Capture 006 - Document - 127 0 0 1](https://github.com/2305PublicDataWebApp/TravelPalette/assets/134674342/a32f83b3-a9f5-4d57-a445-3103e63c743c)

7-5 게시글 작성, 수정폼과 거의 동일
![FireShot Capture 007 - Document - 127 0 0 1](https://github.com/2305PublicDataWebApp/TravelPalette/assets/134674342/761f3ad1-d755-4acd-8a3f-79a2be8413a6)


### 8. 1:1 문의 답변
8-1 1:1 문의 목록

8-2 1:1 문의 답변 상세

8-3 1:1 문의 답변 작성, 수정폼과 거의 동일 
![responseWrite](https://github.com/2305PublicDataWebApp/TravelPalette/assets/134674363/9db23e36-2f9a-4a56-8969-8dda4e04f15d)

### 9. 이벤트 게시판
9-1 이벤트 게시판 목록

9-2 이벤트 게시판 상세

9-3 이벤트 게시판 작성, 수정폼과 거의 동일

### 10. 지도
