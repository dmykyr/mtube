package com.mtube.mtube.repositories;

import com.mtube.mtube.models.Track;

import java.util.List;

public interface ITrack {
    List<Track> getTracks();
    List<Track> getTracks(String status);
    Track getTrackById(int id);
    List<Track> getUserTracks(int userId);
    void changeStatus(int trackId, String status);
    boolean addTrack(Track track);
    List<Track> filterTracks(String artist);
    void deleteTrack(int id);
}
