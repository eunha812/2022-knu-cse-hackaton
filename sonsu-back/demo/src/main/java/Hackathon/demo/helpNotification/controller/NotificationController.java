package Hackathon.demo.helpNotification.controller;

import Hackathon.demo.helpNotification.service.NotificationService;
import com.google.firebase.messaging.FirebaseMessagingException;
import lombok.AllArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ExecutionException;


@RestController
@AllArgsConstructor
public class NotificationController {
    private NotificationService notificationService;

    // notification test

    @GetMapping("/test/testnoti")
    public String testnoti() throws IOException {
        notificationService.testNotification("e34WQNB0RbqPFyVALvS7Nv:APA91bEQ3tlC1OK1kWM_cDfvmorffgxlzMoajFoT4sN-n1aNrT7zRxtmdD7Qjcz_IBsgas0o8rTrCmQ7eVDu6krmLnSEwktmfNhXkZwXHxOWyuMh_IEo3XxuJHhohGBXOCGJDcLTGkM0");
        return "success";

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
    public ResponseEntity<Map<String, Object>> requestHelp(Map<String, String> userInfo) throws FirebaseMessagingException, ExecutionException, InterruptedException, IOException {
        return notificationService.getHelp(userInfo); //근처 헬퍼에게 요청을 보냈는지 여부만(구했다는건 이후에 알 수 있음)

    }

    // 도움 제공자가 나타나면 -> response : 도움 필요자 정보(프로필, 도움 요청 위치)
    @PostMapping("/needhelp/give")
    public ResponseEntity<Map<String, Object>> giveHelp(@RequestBody Map<String, String> userInfo) throws Exception {
        System.out.println(userInfo.get("neederName"));
        return notificationService.giveHelpInfo(userInfo.get("name"), userInfo.get("neederName"));

    }

    // 도움 제공자가 도착하면
    @PostMapping("/needhelp/arrive")
    public ResponseEntity<Map<String, Object>> arriveHelp(Map<String, String> userInfo) throws IOException, FirebaseMessagingException {
        return notificationService.arriveInfo("", "");

    }

    //도움이 끝나면
    @PostMapping("/needhelp/finish")

    public ResponseEntity<Map<String, Object>> finishHelp(@RequestBody Map<String, String> userInfo) throws Exception {
        return notificationService.finishInfo(userInfo.get("name"), userInfo.get("helperName"));

    }
}
