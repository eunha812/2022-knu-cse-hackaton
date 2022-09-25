package Hackathon.demo.user.domain.entity;

import lombok.*;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.sql.Time;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.Random;


@NoArgsConstructor
@Getter
@Setter
@ToString
public class ListData {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private String id;
    private String neederName;
    private String age;
    private String detail;
    private String gender;
    private String time;

    @Builder
    public ListData(Needer needer){
        this.id = String.valueOf(new Random());
        this.neederName = needer.getName();
        this.age = needer.getAge();
        this.detail = needer.getDetail();
        this.gender = needer.getGender();
        this.time = String.valueOf(LocalDateTime.now());
    }
}