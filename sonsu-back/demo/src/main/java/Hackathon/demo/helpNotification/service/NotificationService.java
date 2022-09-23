package Hackathon.demo.helpNotification.service;

import com.google.firebase.messaging.FirebaseMessagingException;
import lombok.AllArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@AllArgsConstructor
public class NotificationService {
    private FirebaseCloudMessageService firebaseMessage;

    // 도움요청 전체 로직
    public ResponseEntity<Map<String, Object>> getHelp() throws FirebaseMessagingException {
        Map<String, Object> resBody = new HashMap<>();
        // 1분에 한 번씩 서버에 듣고 있는게 있는지 확인 -> gps위치가 얼마 이상 변 할 때 서버에 자동으로 http 내위치 변경됐다 DB에 이 위치로 저장해놔라(실시간)

        // DB에 저장된 헬퍼의 위치 정보를 가지고 비교해야할 것 같음
        if(getHelperLocation().size()==0){//근처 헬퍼가 없을 때
            resBody.put("message", "nobody near here");
            return ResponseEntity.status(400).body(resBody);
        }
        //근처 헬퍼 1인 이상 존재 -> Notification
        sendHelpNotification();

        resBody.put("message", "success to request");
        return ResponseEntity.ok().body(resBody);
    }

    public List<String> getHelperLocation() throws FirebaseMessagingException {
        List<String> registrationTokens = new ArrayList<>();

        //firebaseMessage.sendMessageMany(registrationTokens);

        calculDist(registrationTokens);

        return registrationTokens;
    }

    // 도움요청자와의 거리 계산 -> 10분 거리 내에 있는 클라이언트 토큰 리스트 반환
    public List<String> calculDist(List<String> userLocations){
        List<String> resultDist = new ArrayList<>();
        return resultDist;
    }

    // 가까운 클라이언트들에게 도움 요청 Notification
    public void sendHelpNotification() throws FirebaseMessagingException {
        List<String> registrationTokens = new ArrayList<>();
        firebaseMessage.sendMessageMany(registrationTokens);
    }

    // 도움 제공자가 나타났을 때
    public ResponseEntity<Map<String, Object>> giveHelpInfo(){
        Map<String, Object> resBody = new HashMap<>();

        // 도움 요청자에게도 도움 제공자가 나타났음을 알림
        sendFoundHelper();
        // 도움 제공자에게 도움 받는사람의 정보를 반환해줌
        return ResponseEntity.ok().body(resBody);
    }

    public void sendFoundHelper(){

    }

    //notification test
    public ResponseEntity<String> testNotification(String tockenNum) throws IOException {
        firebaseMessage.sendMessageTo(tockenNum, "노티가 가나요?", "히히명주안");

        return ResponseEntity.ok().body("success");
    }
}
