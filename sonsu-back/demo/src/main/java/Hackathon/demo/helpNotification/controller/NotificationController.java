package Hackathon.demo.helpNotification.controller;

import Hackathon.demo.helpNotification.service.NotificationService;
import com.google.firebase.messaging.FirebaseMessagingException;
import lombok.AllArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.Map;

@RestController
@AllArgsConstructor
public class NotificationController {
    private NotificationService notificationService;

    // notification test
    @PostMapping("/test/testNotification")
    public ResponseEntity<String> testNoti(@RequestParam("tockenNum") String tockenNum){
        try {
            notificationService.testNotification(tockenNum);
        } catch (IOException e) {
            //throw new RuntimeException(e);
            return ResponseEntity.badRequest().body("fail");
        }

        return ResponseEntity.ok().body("success");
    }

    // 긴급 도움 요청이 들어오면 -> response : 근처에 도움 제공자가 있는지 여부
    @PostMapping("/needhelp/need")
    public ResponseEntity<Map<String, Object>> requestHelp(@RequestParam("clientTocken") String clientTocken, @RequestParam("userId") String userId, @RequestParam("userLocation") String userLocation) throws FirebaseMessagingException {
        return notificationService.getHelp(); //근처 헬퍼에게 요청을 보냈는지 여부만(구했다는건 이후에 알 수 있음)
    }

    // 도움 제공자가 나타나면 -> response : 도움 필요자 정보(프로필, 도움 요청 위치)
    @PostMapping("/needhelp/give")
    public ResponseEntity<Map<String, Object>> giveHelp(){
        return notificationService.giveHelpInfo();
    }

    // 도움 제공자가 도착하면
    @PostMapping("/needhelp/arrive")
    public ResponseEntity<Map<String, Object>> arriveHelp(){
        return notificationService.giveHelpInfo();
    }

    //도움이 끝나면
    @PostMapping("/needhelp/finish")
    public ResponseEntity<Map<String, Object>> finishHelp(){
        return notificationService.giveHelpInfo();
    }
}
