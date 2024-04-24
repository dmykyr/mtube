package com.mtube.mtube.services;

import com.mtube.mtube.models.Track;
import com.mtube.mtube.repositories.ITrack;
import com.mtube.mtube.repositories.ITrackDb;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class TrackService implements ITrack {

    @Autowired
    ITrackDb repository;
    @Override
    public List<Track> getTracks() {
        return (List<Track>) repository.findAll();
    }

    @Override
    public List<Track> getTracks(String status) {
        return repository.getTracks(status);
    }

    @Override
    public Track getTrackById(int id) {
        return repository.findById(id).orElse(null);
    }

    @Override
    public List<Track> getUserTracks(int userId) {
        return repository.getUserTracks(userId);
    }

    @Override
    public void changeStatus(int trackId, String status) {
        repository.changeStatus(trackId, status);
    }

    @Override
    public boolean addTrack(Track track) {
        try {
            repository.save(track);
            return true;
        }
        catch(Exception ex){
            return false;
        }
    }

    @Override
    public List<Track> filterTracks(String artist) {
        return repository.filterTracks(artist);
    }

    @Override
    public void deleteTrack(int id) {
        repository.deleteById(id);
    }
}
