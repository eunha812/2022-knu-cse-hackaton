package Hackathon.demo.helpNotification.service;


import Hackathon.demo.user.domain.entity.Helper;
import Hackathon.demo.user.domain.entity.Needer;
import Hackathon.demo.user.service.UserService;

import com.google.firebase.messaging.FirebaseMessagingException;
import lombok.AllArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.io.IOException;

import java.security.KeyStore;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import java.util.concurrent.ExecutionException;

@Service
@AllArgsConstructor
public class NotificationService {
    private FirebaseCloudMessageService firebaseMessage;

    private UserService userService;

    // 도움요청 전체 로직
    public ResponseEntity<Map<String, Object>> getHelp(Map<String, String> neederInfo) throws Exception {
        Map<String, Object> resBody = new HashMap<>();

        // DB에 저장된 헬퍼의 위치 정보를 가지고 비교해야할 것 같음
        List<String> nearHelperTockens = calculDist(userService.getHelpers(), 11);

        if(nearHelperTockens.isEmpty()){//근처 헬퍼가 없을 때
            resBody.put("message", "nobody near here");
            return ResponseEntity.status(406).body(resBody);
        }
        //근처 헬퍼 1인 이상 존재 -> Notification
        //FirebaseCloudMessageService.sendMessageMany(nearHelperTockens);
        for(int i=0;i<nearHelperTockens.size();i++){
            firebaseMessage.makeNotiDataMessage(nearHelperTockens.get(i), neederInfo, "주변에 도움이 필요한 사람이 있어요", "손수 도움을 제공해 주세요!");
            //userService.addList(userService.getNeederDetail("이순재"));
        }


        resBody.put("message", "success to request");
        return ResponseEntity.ok().body(resBody);
    }


    // 도움요청자와의 거리 계산 -> 10분 거리 내에 있는 클라이언트 토큰 리스트 반환
    public List<String> calculDist(List<Helper> userLocations, int helperLocation){
        List<String> resultDist = new ArrayList<>();

        //거리계산
        for(int i=0;i<userLocations.size();i++){
            if(distance(37.504198, 127.047967, 37.501025, 127.047701, "meter")<800){//걸어서 10분==800미터
                resultDist.add(userLocations.get(i).getTockenId());
            }
        }

        return resultDist;
    }

    //-----------------
    // 도움 제공자가 나타났을 때
    public ResponseEntity<Map<String, Object>> giveHelpInfo(String helper, String needer) throws Exception {
        Map<String, Object> resBody = new HashMap<>();

        Needer neederDeatail = userService.getNeederDetail(needer);

        // 도움 요청자에게도 도움 제공자가 나타났음을 알림 -> 백그라운드에서 처리하도록
        Map<String, String> notiData = new HashMap<>();
        Helper helperDetail = userService.getHelperDetail(helper);
        notiData.put("helperName", helperDetail.getName());
        notiData.put("gender", helperDetail.getGender());
        notiData.put("age", helperDetail.getAge());
        notiData.put("report", "0");
        notiData.put("helperImg", "https://images-ext-1.discordapp.net/external/Gfq3iqgyXFZ816LzSMm9sLrU3sgZgf5vHiKxajHtHq4/https/cdn.topstarnews.net/news/photo/201808/462415_115839_2441.jpg");
        firebaseMessage.makeDataMessage(neederDeatail.getTockenId(), "도움제공자 등장", "거기서 기다리슈", notiData);

        // 도움 제공자에게 처리 완료를 알림
        resBody.put("helpKeyword1", neederDeatail.getHelpKeyword1());
        resBody.put("helpKeyword2", neederDeatail.getHelpKeyword2());
        resBody.put("helpKeyword3", neederDeatail.getHelpKeyword3());
        return ResponseEntity.ok().body(resBody);
    }

    // 도움 제공자가 도착했을 때
    public ResponseEntity<Map<String, Object>> arriveInfo(String needer, String helper){
        Map<String,Object> resBody = new HashMap<>();

        return ResponseEntity.ok().body(resBody);
    }

    // 도움이 끝났을 때
    public ResponseEntity<Map<String, Object>> finishInfo(String needer, String helper) throws Exception {
        Map<String,Object> resBody = new HashMap<>();

        Map<String, String> notiData = new HashMap<>();
        Helper helperDetail = userService.getHelperDetail(helper);

        Needer neederDetail = userService.getNeederDetail(needer);
        notiData.put("neederName", neederDetail.getName());
        notiData.put("age", neederDetail.getAge());
        notiData.put("detail", neederDetail.getDetail());
        notiData.put("gender", neederDetail.getGender());

        //helpcount 1 올려주기
        userService.addHelperCount(helperDetail);

        firebaseMessage.makeNotiDataMessage(helperDetail.getTockenId(), notiData, "손 내밀어 주셔서 감사합니다.", "다음 손길을 위해 후기를 작성해 주세요!");

        return ResponseEntity.ok().body(resBody);
    }

    //notification test------------------------------
    public ResponseEntity<String> testNotification(String tockenNum) throws IOException {
        firebaseMessage.sendMessageTo(tockenNum, "nsjnfksnfk?", "why");

        return ResponseEntity.ok().body("success");
    }

    // 거리계산
    private static double distance(double lat1, double lon1, double lat2, double lon2, String unit) {

        double theta = lon1 - lon2;
        double dist = Math.sin(deg2rad(lat1)) * Math.sin(deg2rad(lat2)) + Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) * Math.cos(deg2rad(theta));

        dist = Math.acos(dist);
        dist = rad2deg(dist);
        dist = dist * 60 * 1.1515;

        if (unit == "kilometer") {
            dist = dist * 1.609344;
        } else if(unit == "meter"){
            dist = dist * 1609.344;
        }

        return (dist);
    }

    // This function converts decimal degrees to radians
    private static double deg2rad(double deg) {
        return (deg * Math.PI / 180.0);
    }

    // This function converts radians to decimal degrees
    private static double rad2deg(double rad) {
        return (rad * 180 / Math.PI);
    }

}
