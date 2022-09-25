<img src="https://user-images.githubusercontent.com/62578738/192111974-6ad690e1-4446-4502-bc3b-c91bcf170683.png"/>

 <div align="center"> 손수(手) : 손 수 만드는 따뜻한 사회 </div>
    
## 👩🏻‍🎓팀명 : 졸업언제하조🎓
  
  
  
## 💡 제출 세션 및 주제
<span style= 'background-color: #F7DDBE'>[자유세션] __따뜻한 대구 만들기 - 도움이 쉬워지는 세상__</span>
  
  
  
## 👥 프로젝트 한 줄 설명
장애인등(장애인, 노인, 임산부 등)이 생활 속에서 필요한 도움을 쉽게 얻고, 공동체 내에서의 간단한 __도움을 주고 받는 것이 더욱 쉬워지도록 주선하는 어플리케이션__
  
  
  
## 🧑🏻‍🦯 프로젝트에 대한 설명

### 기능
<img src="https://user-images.githubusercontent.com/62578738/192135005-453b3d5e-1b64-4142-97c8-6745a264b0ee.png"/>

## ⌨️ 프로젝트에 활용된 기술
<img src="https://user-images.githubusercontent.com/62578738/192134693-d35f6313-07a2-4141-8361-b88ba1203c20.png"/>
장애인등(장애인, 노인, 임산부 등)을 위한 도움요청자 UI와 도움제공자 UI를 구별하였습니다.
도움요청자의 경우, 버튼 최소화하였으며 직관적인 UI를 제공합니다.

<img src="https://user-images.githubusercontent.com/62578738/192135060-6c32dc2b-e4fc-414a-bb26-8d8d4c1a53f0.png"/>
버튼 클릭을 통해 주변 10분 이내 거리의 도움제공자에게 알림을 보낼 수 있습니다.
도움제공자가 요청수락후 10분 이내에 도움을 제공하러 오지 않을 시 자동으로 신고처리되며, 새로 도움을 요청할 수 있습니다.

<img src="https://user-images.githubusercontent.com/62578738/192135079-dcae4164-30d9-4673-8843-046acfeb1d0c.png"/>
도움제공자가 주변 도움요청자가 보낸 알림을 한눈에 볼 수 있도록 긴급 요청 알림 리스트를 제공합니다.
도움제공자가 도움요청을 수락하면, 해당 도움의 요청자 정보와 현재 위치를 표시한 지도를 확인할 수 있습니다.
또한, 도움제공자도 도움요청자를 신고할 수 있는 기능을 제공합니다.

<img src="https://user-images.githubusercontent.com/62578738/192135107-af4b72b5-8e2e-40fa-af04-7020393c5abc.png"/>
기업 및 시와 연계하여 봉사 횟수에 따른 봉사시간과 같은 리워드를 제공합니다. (예정) 해당 리워드는 도움요청자가 ‘도움완료’버튼을 누를 시 도움제공자에게 제공되며, 메인화면 및 프로필화면에서 확인할 수 있습니다.
도움 제공자는 도움 완료 이후 도움에 대한 후기(평가가 아닌 어떠한 도움을 제공하였는지에 대한 기록)를 남김으로써 다음 도움제공자에게 더 나은 정보를 제공할 수 있습니다.

- **[봉사모집 게시판]**
더 다양한 봉사를 접하고 신청할 수 있습니다.

- **[소소한 도움 게시판]**
도움제공자들 간 소소한 도움요청도 가능합니다.

### 영향(기대효과)

🚨 **긴급요청**

: 장애인등(장애인, 노인, 임산부 등)이 언제 어디서든 제약을 받지 않고 도움을 요청하여 평소에 도움을 주고 싶었던 사람도 마음편히 도움을 줄 수 있고 도움을 요청하는 사람도 눈치보지 않고 도움을 받을 수 있는 사회분위기를 기대할 수 있습니다.

👨‍👨‍👧‍👦 **커뮤니티**

: 누구나 소소한 도움을 요청하고 손길을 나누어 줌으로써, 약해진 공동체 의식을 강화 할 수 있을 것이라고 예상합니다. 상호간 돕는 문화가 발전하면서 대구 지역 구성원의 삶을 윤택하게 만들 수 있을 것이라 예상합니다

⏳ **향후 발전 가능성**

: 대구시 및 봉사 단체와의 연계를 통하여 봉사 시간 등 리워드를 제공할 수 있을 것입니다. 이를 통해 일상에서 봉사를 실천하도록 유도 할 수 있습니다.

## ⌨️ 프로젝트에 활용된 기술

**[Frontend] Flutter** 
- GetX를 통한 상태관리와 라우터 처리
- HTTP통신을 통해 POST방식으로 서버와 데이터를 주고 받음
- FCM을 활용하여 서버로 부터 온그라운드/백그라운드 알림 및 데이터를 전달 받음
  - 도움 제공자가 도움 요청을 수락할 시 도움 요청자의 정보 및 위치를 확인 할 수 있도록 위치정보를 표시한 MAP을 도움제공자에게 제공

**[FCM Server] Firebase**
- 데이터베이스 및 FCM(Firebase 클라우드 메시징) 전송 서버로 이용
- FCM을 서버 측에서 클라이언트 측으로 데이터를 보내는 상황에 활용
  - 도움 요청 시 근처 10분 이내 거리의 어플 사용자에게 알람(Notification)을 보내는 경우
  - 도움 요청 수락 시 요청자에게 도움 제공자의 정보(Data) 및 수락 여부를 보내는 경우
- Flutter와 Spring-boot에 각각 파이어베이스 연결 설정을 해 주었으며, 어플 설치 시 부여받는 Client TockenId를 - 통하여 서버 측에서 클라이언트 측으로 메세지 전송 요청
- FireStore(NoSQL)를 유저 정보, 도움 요청 정보, 게시글 정보 등을 저장하는 데이터베이스로 이용
  - FCM을 이용하기 위한 서비스키를 함께 사용이 가능한 측면과 해커톤이라는 시간적 제약이 있는 상황에서 NoSQL이라는 편리성이 존재하여 이번 프로젝트의 DB로서 가장 적합하였음.

**[Server] Spring-boot**
- spring boot 프레임워크를 사용하여 서버 개발을 진행
- 클라이언트 측에서 서버측에 요청이 필요한 경우 HTTP(GET, POST) 통신을 이용하여, 클라이언트의 요청에 따라 적정한 로직 수행 및 데이터 전달
  - spring boot 프레임워크를 사용하여 서버 개발을 진행
  - 도움 요청자의 10분 이내의 도움 제공 가능자에게 알림(Notification)을 주기 위한 거리 계산 로직 수행
  - 유저 데이터 관리 로직 및 도움 요청 및 제공 정보 관리를 위한 로직 수행
  - 도움 요청 및 커뮤니티 관련 데이터 관리 로직 수행
- 해당 프레임워크로 웹서버 개발 후 AWS Cloud Server(Ubuntu)를 통해 배포

<img width="507" alt="image" src="https://user-images.githubusercontent.com/62578738/192134876-6cc9e081-e682-4d57-bd61-9c4947176a1d.png">


## 📹 시연 영상

## 👩‍👩‍👧‍👧 팀원
컴퓨터학부 글로벌SW융합전공
| 김은하 | 이세은 | 이승신 | 정명주 |
| ------ | ------ |----|-----|
| <a href="https://github.com/eunha812"><img src="https://avatars.githubusercontent.com/u/62810560?v=4" alt="eunha812" width="100" height="100"></a> | <a href="https://github.com/seeun-320"><img src="https://user-images.githubusercontent.com/62578738/192110853-974e3a30-b8f0-41d0-a3fe-dc60ed64cc4a.png" alt="seeun-320" width="100" height="100"></a> |<a href="https://github.com/Seungsin"><img src="https://avatars.githubusercontent.com/u/62578738?s=120&v=4" alt="seungsin" width="100" height="100"></a>|<a href="https://github.com/thing-zoo"><img src="https://avatars.githubusercontent.com/u/62596783?v=4" alt="thing-zoo" width="100" height="100"></a>|
| 팀장, Frontend | Frontend |Backend|Frontend|
