package Hackathon.demo.helpNotification.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.auth.oauth2.GoogleCredentials;
import com.google.common.net.HttpHeaders;

import com.google.firebase.messaging.*;

import com.google.firebase.messaging.BatchResponse;
import com.google.firebase.messaging.FirebaseMessaging;
import com.google.firebase.messaging.FirebaseMessagingException;
import com.google.firebase.messaging.MulticastMessage;

import lombok.RequiredArgsConstructor;
import okhttp3.*;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Component;

import java.io.IOException;

import java.time.LocalTime;
import java.util.List;
import java.util.Map;


@Component
@RequiredArgsConstructor
public class FirebaseCloudMessageService {
    private final String API_URL = "https://fcm.googleapis.com/v1/projects/help-hands-453ca/messages:send";
    private final ObjectMapper objectMapper;

    public void sendMessageTo(String targetToken, String title, String body) throws IOException {
        String message = makeMessage(targetToken, title, body);

        OkHttpClient client = new OkHttpClient();
        RequestBody requestBody = RequestBody.create(message, MediaType.get("application/json; charset=utf-8"));
        Request request = new Request.Builder()
                .url(API_URL)
                .post(requestBody)
                .addHeader(HttpHeaders.AUTHORIZATION, "Bearer " + getAccessToken())
                .addHeader(HttpHeaders.CONTENT_TYPE, "application/json; UTF-8")
                .build();

        Response response = client.newCall(request)
                .execute();

        System.out.println("결과:"+response.body().string());
    }


    private String makeMessage(String targetToken, String title, String body) throws JsonProcessingException {
        FcmMessage fcmMessage = FcmMessage.builder()
                .message(FcmMessage.Message.builder()
                        .token(targetToken)
                        .notification(FcmMessage.Notification.builder()
                                .title(title)
                                .body(body)
                                .image(null)
                                .build()
                        )
                        .build()
                )
                .validate_only(false)
                .build();

        return objectMapper.writeValueAsString(fcmMessage);
    }


    public void makeDataMessage(String targetToken, String title, String body, Map<String, String> data) throws FirebaseMessagingException {
        // See documentation on defining a message payload.
        Message message = Message.builder()
                .putAllData(data)
//                .putData("helperName", "정보석")
//                .putData("gender", "남성")
//                .putData("age", "22")
//                .putData("report", "0")
//                .putData("helperImg", "https://images-ext-1.discordapp.net/external/Gfq3iqgyXFZ816LzSMm9sLrU3sgZgf5vHiKxajHtHq4/https/cdn.topstarnews.net/news/photo/201808/462415_115839_2441.jpg")
                .setToken(targetToken)
                .build();

        // Send a message to the device corresponding to the provided
        // registration token.
        String response = FirebaseMessaging.getInstance().send(message);
        // Response is a message ID string.
        System.out.println("Successfully sent message: " + response);
    }

    public void makeNotiDataMessage(String targetToken, Map<String, String> sendData) throws FirebaseMessagingException {
        // See documentation on defining a message payload.
        Message message = Message.builder()
                .putAllData(sendData)
                .putData("name", "이순재")
                .putData("age", "76")
                .putData("gender", "남성")
                .putData("detail", "거동불편")
                .putData("time", String.valueOf(LocalTime.now()))
                .setNotification(Notification.builder()
                        .setTitle("주변에 도움이 필요한 사람이 있어요")
                        .setBody("손수 도움을 내밀어주세요")
                        .build())
                .setToken(targetToken)
                .build();

        // Send a message to the device corresponding to the provided
        // registration token.
        String response = FirebaseMessaging.getInstance().send(message);
        // Response is a message ID string.
        System.out.println("Successfully sent message: " + response);
    }


    private String getAccessToken() throws IOException {
        String firebaseConfigPath = "serviceAccountKey.json";

        GoogleCredentials googleCredentials = GoogleCredentials
                .fromStream(new ClassPathResource(firebaseConfigPath).getInputStream())
                .createScoped(List.of("https://www.googleapis.com/auth/cloud-platform"));

        googleCredentials.refreshIfExpired();
        return googleCredentials.getAccessToken().getTokenValue();
    }

}
