package com.Nikhil308.NikTube.Service;

import com.Nikhil308.NikTube.Model.Song;
import com.Nikhil308.NikTube.Model.Video;
import com.Nikhil308.NikTube.NikTubeData;
import com.Nikhil308.NikTube.Repo.SongRepository;
import com.Nikhil308.NikTube.Repo.VideoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Optional;


@Component
public class FetchService {

    private final SongRepository mdataRepository;
    private final VideoRepository vdataRepository;

    @Autowired
    public FetchService(SongRepository mdataRepository,VideoRepository vdataRepository) {
        this.mdataRepository = mdataRepository;
        this.vdataRepository = vdataRepository;
    }


    public Object fetchFromID(Long id,String type) {

        if (type.equals("music")) {
            Optional<Song> optionalMediaEntity = mdataRepository.findById(id);
            if (optionalMediaEntity.isPresent()) {
                Song mediaEntity = optionalMediaEntity.get();
                return mediaEntity;
            } else {
                return null;
            }
        }
        if (type.equals("video")) {
            Optional<Video> optionalMediaEntity = vdataRepository.findById(id);
            if (optionalMediaEntity.isPresent()) {
                Video mediaEntity = optionalMediaEntity.get();
                return mediaEntity;
            }
            else {
                return null;
            }
        }
      return null;
    }

    public Collection<?> fetchFromNameList(String query, String type){

        boolean exactMatch = false;
        if (query.startsWith("\"") && query.endsWith("\"")) {
            exactMatch = true;
            // Extract the quotes
            query = query.substring(1, query.length() - 1);
        } else {
            // Handle case-insensitivity by converting to lowercase first
            query = query.toLowerCase();
        }

        if (type.equals("music")){
            Iterable<Song> allItems = this.mdataRepository.findAll();
            List<Song> itemList = new ArrayList<>();
            // For each item... This is written for simplicity to be read/understood not necessarily maintain or extend
            for (Song item : allItems) {
                boolean nameMatches;
                boolean descMatches;
                // Check if we are doing exact match or not
                if (exactMatch) {
                    // Check if name is an exact match
                    nameMatches = query.equals(item.getVname());
                    // Check if description is an exact match
                    descMatches = query.equals(item.getVdescription());
                } else {
                    // We are doing a contains ignoring case check, normalize everything to lowercase
                    // Check if name contains query
                    nameMatches = item.getVname().toLowerCase().contains(query);
                    // Check if description contains query
                    descMatches = item.getVdescription().toLowerCase().contains(query);
                }

                // If either one matches, add to our list
                if (nameMatches || descMatches) {
                    itemList.add(item);
                }
            }
            // Return results
            return itemList;
        }

        if ("video".equals("video")){
            Iterable<Video> allItems = this.vdataRepository.findAll();
            List<Video> itemList = new ArrayList<>();
            // For each item... This is written for simplicity to be read/understood not necessarily maintain or extend
            for (Video item : allItems) {
                boolean nameMatches;
                boolean descMatches;
                // Check if we are doing exact match or not
                if (exactMatch) {
                    // Check if name is an exact match
                    nameMatches = query.equals(item.getVname());
                    // Check if description is an exact match
                    descMatches = query.equals(item.getVdescription());
                } else {
                    // We are doing a contains ignoring case check, normalize everything to lowercase
                    // Check if name contains query
                    nameMatches = item.getVname().toLowerCase().contains(query);
                    // Check if description contains query
                    descMatches = item.getVdescription().toLowerCase().contains(query);
                }

                // If either one matches, add to our list
                if (nameMatches || descMatches) {
                    itemList.add(item);
                }
            }
            // Return results
            return itemList;

        }
        return null;
    }


}
