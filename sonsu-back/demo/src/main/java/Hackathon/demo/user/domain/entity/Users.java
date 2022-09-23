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
public class Users {

    private String id;
    private String name;
    private String age;
    private String info;
    private String gender;
    private String tockenId;

}
