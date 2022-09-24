package Hackathon.demo.user.domain.entity;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class Needer {
    private String id;
    private String name;
    private String age;
    private String detail;
    private String gender;
    private String tockenId;
    private String helpKeyword1;
    private String helpKeyword2;
    private String helpKeyword3;
    private int locationLat;
    private int locationLon;
}
