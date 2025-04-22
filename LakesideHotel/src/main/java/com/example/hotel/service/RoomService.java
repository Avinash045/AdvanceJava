package com.example.hotel.service;

import java.math.BigDecimal;
import java.sql.Blob;
import java.sql.*;
import javax.sql.rowset.serial.SerialBlob;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.example.hotel.model.Room;
import com.example.hotel.repository.RoomRepository;
import com.example.hotel.service.IRoomService;
import java.io.*;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class RoomService implements IRoomService {

    private final RoomRepository roomRepository;
    
    @Override
    public Room addNewRoom(MultipartFile file, String roomType, BigDecimal roomPrice) {
        Room room = new Room();
        room.setRoomType(roomType);
        room.setRoomPrice(roomPrice);
        
        if(!file.isEmpty()) {
            byte[] photoBytes = file.getBytes();
            Blob photoBlob = new SerialBlob(photoBytes);
            room.setPhoto(photoBlob);
        }
        
        return roomRepository.save(room);
    }
}
