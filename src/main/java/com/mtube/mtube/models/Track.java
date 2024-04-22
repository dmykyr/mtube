package com.mtube.mtube.models;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name="tracks")
public class Track {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id")
    int id;
    @Column(name="title")
    String title;
    @Column(name="artist")
    String artist;
    @Column(name="userid")
    int userid;
    @Column(name="audiopath")
    String audiopath;
    @Column(name="created_at")
    Date createdAt;
    @Column(name="track_status")
    String trackStatus;
}

