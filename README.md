<img src="https://user-images.githubusercontent.com/62578738/192111974-6ad690e1-4446-4502-bc3b-c91bcf170683.png"/>

 <div align="center"> 손수(手) : 손 수 만드는 따뜻한 사회 </div>
    
## 👩🏻‍🎓팀명 : 졸업언제하조🎓
  
<br/>
<br/>
<br/>
  
## 💡 제출 세션 및 주제
<span style= 'background-color: #F7DDBE'>[자유세션] __따뜻한 대구 만들기 - 도움이 쉬워지는 세상__</span>
  
<br/>
<br/>
<br/>
  
## 👥 프로젝트 한 줄 설명
장애인등(장애인, 노인, 임산부 등)이 생활 속에서 필요한 도움을 쉽게 얻고, 공동체 내에서의 간단한 __도움을 주고 받는 것이 더욱 쉬워지도록 주선하는 어플리케이션__
  
<br/>
<br/> 
<br/>
  
## 🧑🏻‍🦯 프로젝트에 대한 설명
### 프로젝트 목적
세상이 점차 변해가며 예로부터 이루어졌던 서로 돕는 문화가 많이 사라졌습니다. 1인 가구가 급증하고 개인주의가 심화되면서 이웃 간의 거리는 점차 멀어졌습니다. 최근에는 일상에서 어려움을 겪는 사람들이 간단한 도움을 받는 것 조차 쉽지 않습니다.

 특히 장애인등(장애인, 노인, 임산부 등)은 대중교통을 이용하거나 택시잡기, 키오스크 이용 등 같이 우리에게는 비교적 간단한 일에도 어려움을 겪습니다. 기술이 발전하면서 편한 세상이 되었지만, 다른 누군가에게는 아닐지도 모릅니다. 이렇게 격차가 점점 벌어지는 사회에서 서로 간의 도움은 더욱 필요해졌습니다.

 하지만 이런 상황에서 누군가는 무심히 그냥 지나치고, 누군가는 바빠서, 또 누군가는 괜히 나섰다가 오히려 상대의 기분을 상하게 할까 봐 주저 하기도 합니다. 저희 팀은 여러 원인 중 도움의 의지는 있으나 주저하는 이유 중 **‘괜히 나섰다가 오히려 상대의 기분을 상하게 하지는 않을까 걱정 하는 상황’**에 주목했습니다.

 

칼럼 ‘도움의 역설’에서 역시 도움의 방법에 대해 다음과 같이 이야기합니다.([https://www.hankyung.com/thepen/lifeist/article/202103224614Q](https://www.hankyung.com/thepen/lifeist/article/202103224614Q))
>남을 도울까 말까 하는 바탕에는 ‘내가 정말 도울 수 있을까?’하는 걱정과 ‘저 사람을 도울 필요가 있을까?’하는 의구심이 깔려있다. 또한 도움을 주는 것에는 나의 의지도 중요하지만, 받고자 하는 사람의 의지도 중요하다. 미리 상의하는 것도 서로 간에 아쉬움이 남지 않는 도움의 방법이다.

<br/>
<br/>

### 타겟(예상 사용자)

<br/> 
<br/>
<br/> 

## ⌨️ 프로젝트에 활용된 기술
<img src="https://user-images.githubusercontent.com/62578738/192134693-d35f6313-07a2-4141-8361-b88ba1203c20.png"/>

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
