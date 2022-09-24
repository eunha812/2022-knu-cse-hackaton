package Hackathon.demo.user.domain.entity;

import lombok.*;

import java.util.Date;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class Helper {

    private String id;
    private String name;
    private String age;
    private String gender;
    private String tockenId;
    private int locationLat;
    private int locationLon;
    private String helpCount;
}
