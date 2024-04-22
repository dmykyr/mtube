package com.mtube.mtube.repositories;

import com.mtube.mtube.models.Track;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface ITrackDb extends CrudRepository<Track, Integer> {

    @Query("from Track t where t.trackStatus = :status")
    List<Track> getTracks(@Param("status") String status);

    @Query("from Track t where t.artist = :artist")
    List<Track> filterTracks(@Param("artist")String artist);

    @Query("from Track t where t.userid = :userId")
    List<Track> getUserTracks(@Param("userId") int userId);

    @Modifying
    @Transactional
    @Query("update Track t set t.trackStatus = :status where t.id = :trackId")
    void changeStatus(@Param("trackId") int trackId, @Param("status") String status);
}
