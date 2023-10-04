

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
### 포인트
기능명 | 상세
-------|-----
포인트 충전 | 포인트는 1,3,5,10만원 단위로 충전 가능하며, 1P 당 1원의 가치를 지닌다. 
포인트 내역 | 로그인 한 회원은 본인의 포인트 내역을 볼 수 있다. 
### 하루기록
기능명 | 상세
-------|-----
하루기록 작성 | 하루기록은 해당 회원만 열람할 수 있으며 작성 시 10P를 적립받는다. 제목, 내용의 수정과 글 삭제가 가능하다.
### 커뮤니티
기능명 | 상세
-------|-----
소셜링 | 소셜링은 해당 회원만 접근 할 수 있으며, 주최자는 원하는 날짜와 인원을 지정하여 소셜링을 오픈할 수 있고 회원은 소셜링을 자유롭게 참여할 수 있다.
SNS | 프로필 사진과 한줄소개를 수정할 수 있으며, 본인이 원하는 사진과 글을 자유롭게 등록, 삭제할 수 있다. 회원은 글에 댓글을 남길 수 있다. sns 팔로우 기능을 통해 원하는 회원의 sns를 팔로우 할 수 있고 팔로잉, 팔로워 수가 sns 페이지에 공개되며, 버튼 선택 시 팔로잉 목록을 볼 수 있다.
쪽지 | 검색 기능을 이용하여 회원 검색을 하고 쪽지를 발송할 회원을 선택할 수 있다. 발송한 쪽지는 읽음 여부를 확인할 수 있다.
### 게시판
기능명 | 상세
-------|-----
공지사항 | 비회원과 회원 모두 공지사항을 볼 수 있다.
문의게시판 | 비회원은 문의게시판의 리스트에만 접근이 가능하고, 회원만 문의게시판 이용이 가능하다. 일반글과 비밀글로 작성이 가능하며, 카테고리별로 문의글 작성이 가능하다. 글작성자와 관리자만 댓글작성이 가능하다.
### 관리자
기능명 | 상세
-------|-----
회원관리 | 회원 정보를 조회할 수 있으며, 회원을 탈퇴시킬 수 있다. 아이디와 이름으로 회원 검색이 가능하다.
커뮤니티 관리 | 커뮤니티의 모든 글을 삭제할 수 있으며, 댓글도 삭제 가능하다. // 이거 제가 쓴거에요 지우지 마세여..
포인트 | 각 회원의 포인트 내역을 볼 수 있으며 포인트를 조정할 수 있다.
공지사항 | 관리자만 공지사항을 작성할 수 있다.
문의게시판 | 답변을 달지 않은 문의사항리스트를 통해 오래된 문의사항부터 차례로 답변해줄 수 있다. 관리자가 댓글로 답변을 달아주면 답변완료처리되며 제목에 답변완료라는 표시가 생긴다.
예약관리 | 예약자들의 예약 정보 내역을 조회 가능하며, 문의게시판으로부터 예약취소요청이 들어오는 경우 취소 버튼이 활성화되어 관리자가 취소할 수 있다. 이용일이 지난 건은 음영처리된다.

### 시설예약
기능명 | 상세
-------|-----
시설예약 | 지점, 시설, 날짜, 시간, 인원수 예약시 요금이 출력되며, 캘린더 상에 타인의 기예약건이 표시되어 비어있는 시간을 한눈에 파악할 수 있다. 
예약결제 | 입력한 정보가 출력되고 회원이 사용할 수 있는 포인트를 입력하여 최종 결제할 수 있다. 카카오간편결제가 가능하다.
예약내역 | 날짜가 지나지 않은 내역은 예약일이 다가오는 순으로 정렬, 지난 목록은 버튼 클릭시 현재 날짜와 가까운 순서로 정렬된다. 예약취소가 가능하며 이용 1일 전 예약 알림 메일이 자동 전송된다.




## 🚌 여행팔레트 살펴보기

### 1. 메인화면
![127 0 0 1_8999_](https://github.com/2211SpringCloudWebApp/SPOUTING/assets/119032818/fa480a0d-9d60-4077-988c-d00bdf748b5c)

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

4-1 마이페이지(최근 활동 내역)
<img width="1440" alt="마이페이지" src="https://github.com/2305PublicDataWebApp/TravelPalette/assets/134674356/c8c7db69-4b0a-4692-81f0-c90fa740617e">

4-2 회원 정보 수정
<img width="1440" alt="비밀번호 확인" src="https://github.com/2305PublicDataWebApp/TravelPalette/assets/134674356/49138e7a-c66a-479b-973a-2426a0bc0abe">
<img width="1440" alt="회원 정보 수정" src="https://github.com/2305PublicDataWebApp/TravelPalette/assets/134674356/e688ffb1-4f92-47cd-8649-89a8a73c77d4">

4-3 회원 탈퇴
<img width="1440" alt="회원 탈퇴" src="https://github.com/2305PublicDataWebApp/TravelPalette/assets/134674356/7700b7ad-3b51-4421-b918-3f60ccc4c7c3">

### 6. 1:1 문의
<img width="1440" alt="1:1 문의 내역" src="https://github.com/2305PublicDataWebApp/TravelPalette/assets/134674356/ab984adb-5404-4db2-a8c0-087027daa704">
<img width="1440" alt="1:1 문의 상세 조회" src="https://github.com/2305PublicDataWebApp/TravelPalette/assets/134674356/86b44550-4c5d-4943-8f7e-ba0778a28eba">
<img width="1440" alt="1:1 문의 작성" src="https://github.com/2305PublicDataWebApp/TravelPalette/assets/134674356/bee542b3-39e5-4751-bf3c-e683c630e096">


### 6. 커뮤니티
6-1 여행 정보 게시판
![FireShot Capture 002 - Document - 127 0 0 1](https://github.com/2305PublicDataWebApp/TravelPalette/assets/134674342/5980fe70-d097-42f5-ad1a-5dbe8efa7129)

6-2 질의 문답 게시판
![FireShot Capture 004 - Document - 127 0 0 1](https://github.com/2305PublicDataWebApp/TravelPalette/assets/134674342/2fa8615a-dc4e-4dc3-bdb9-52a501e07187)

6-3 동행 구인 게시판
![FireShot Capture 005 - Document - 127 0 0 1](https://github.com/2305PublicDataWebApp/TravelPalette/assets/134674342/d897252f-2684-4a3f-a3a6-9fb33b46052b)

6-4 게시글 상세보기
![FireShot Capture 006 - Document - 127 0 0 1](https://github.com/2305PublicDataWebApp/TravelPalette/assets/134674342/a32f83b3-a9f5-4d57-a445-3103e63c743c)

6-5 게시글 작성, 수정폼과 거의 동일
![FireShot Capture 007 - Document - 127 0 0 1](https://github.com/2305PublicDataWebApp/TravelPalette/assets/134674342/761f3ad1-d755-4acd-8a3f-79a2be8413a6)


### 7. 마켓
![sonof iptime org_9511_shop_main](https://github.com/2211SpringCloudWebApp/SPOUTING/assets/119032818/253e958c-aa86-467b-aa8b-004aeaef8683)

7-1 제품리스트
![sonof iptime org_9511_shop_productList](https://github.com/2211SpringCloudWebApp/SPOUTING/assets/119032818/abe38f36-50d5-433f-b60c-c5dd7e26bd7f)

7-2 장바구니
![sonof iptime org_9511_shop_cartView](https://github.com/2211SpringCloudWebApp/SPOUTING/assets/119032818/0849d74d-b216-4ad7-8034-405313dda8b1)

7-3 주문서
![127 0 0 1_8999_cart_orderView](https://github.com/2211SpringCloudWebApp/SPOUTING/assets/119032818/fc31676a-b90d-4520-a2cc-4e192122c1c3)

7-4 결제
![127 0 0 1_8999_cart_orderView (2)](https://github.com/2211SpringCloudWebApp/SPOUTING/assets/119032818/99e712e3-ee0b-4801-b09a-6c17f474e98e)


### 8. 커뮤니티
8-1 소셜링
![sonof iptime org_9511_meeting](https://github.com/2211SpringCloudWebApp/SPOUTING/assets/119032818/a5f73abd-85ac-4cef-b136-705c466db560)
![sonof iptime org_9511_meetingDetailPage_meetingNo=201 readerNo=4](https://github.com/2211SpringCloudWebApp/SPOUTING/assets/119032818/a262f250-5b22-46b9-a784-17d6716271b2)
![sonof iptime org_9511_meetingOpenPage](https://github.com/2211SpringCloudWebApp/SPOUTING/assets/119032818/ff2751d9-3a23-498a-a2d7-e695632d34d1)

8-2 SNS
![sonof iptime org_9511_sns_userNo=3](https://github.com/2211SpringCloudWebApp/SPOUTING/assets/119032818/44e84ecc-302c-49c6-96dd-fe8784b39de5)
![sonof iptime org_9511_sns_detail_snsPhotoNo=143](https://github.com/2211SpringCloudWebApp/SPOUTING/assets/119032818/18b8b824-a4ed-402f-8992-ffa91f8f7127)
![sonof iptime org_9511_sns_uploadPage](https://github.com/2211SpringCloudWebApp/SPOUTING/assets/119032818/7dd2c363-f040-4cb4-ae5c-0220853b5213)

### 9. 게시판
9-1 공지사항
![sonof iptime org_9511_notice_list (1)](https://github.com/2211SpringCloudWebApp/SPOUTING/assets/119032818/f48f65ae-fad2-4789-ac5c-5aec0473d47b)
![sonof iptime org_9511_notice_detail_noticeNo=305](https://github.com/2211SpringCloudWebApp/SPOUTING/assets/119032818/4433528b-a99f-4f5e-9f45-a23027bfaac6)
<img width="1440" alt="스크린샷 2023-05-15 오후 3 27 05" src="https://github.com/2211SpringCloudWebApp/SPOUTING/assets/119032818/9b516676-5734-4e9f-b403-3b4293e8ed8f">

9-2 문의사항
![sonof iptime org_9511_inquiry_list](https://github.com/2211SpringCloudWebApp/SPOUTING/assets/119032818/ddc689f0-7a2e-4b7a-b8b9-faf52b4b3377)
![sonof iptime org_9511_inquiry_detail_inquiriesNo=185](https://github.com/2211SpringCloudWebApp/SPOUTING/assets/119032818/6d3fdfde-0941-4706-88fc-b94dba254cc2)
![sonof iptime org_9511_inquiry_checkSecretNo_inquiriesNo=191](https://github.com/2211SpringCloudWebApp/SPOUTING/assets/119032818/93033b91-cc45-4c67-916a-3aff13f7e25b)


### 10. 하루기록
![image](https://github.com/2211SpringCloudWebApp/SPOUTING/assets/119032693/f5fa34b6-25e6-45a4-a6f1-384577254c5a)
![image](https://github.com/2211SpringCloudWebApp/SPOUTING/assets/119032693/f6429092-a02d-4fda-9a4c-faaf75c48265)
![image](https://github.com/2211SpringCloudWebApp/SPOUTING/assets/119032693/593a49da-b768-4fbf-a192-b712d0d9aa77)

### 11. 포인트
![image](https://github.com/2211SpringCloudWebApp/SPOUTING/assets/119032693/fd2fffff-c76e-44dd-b1ea-1eb2d8345a70)
![image](https://github.com/2211SpringCloudWebApp/SPOUTING/assets/119032693/422ed7f9-a215-4d03-b076-e52f0823ae78)
![image](https://github.com/2211SpringCloudWebApp/SPOUTING/assets/119032693/42863835-1c95-4f0e-982a-4b9bf0f8b21f)
