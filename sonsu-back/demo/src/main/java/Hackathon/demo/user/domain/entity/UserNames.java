package Hackathon.demo.user.domain.entity;

import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class UserNames {
    private String neederName;
    private String helperName;


    @Builder
    public UserNames(String neederName, String helperName) {
        this.neederName = neederName;
        this.helperName = helperName;
    }


}