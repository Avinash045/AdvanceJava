package com.example.hotel.response;

import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@AllArgsConstructor
@NoArgsConstructor
@Data
public class BookingResponse {

	private Long id;
	
	private LocalDate checkInDate;
	
	private LocalDate checkOutDate;
	
	private String guestName;
	
	private String guestEmail;
	
	private int numOfAdults;
	
	private int numOfChildren;
	
	private int totalNumOfGuests;
	
	private String BookingConfirmationCode;
	
	private RoomResponse room;

	public BookingResponse(Long id, LocalDate checkInDate, LocalDate checkOutDate,
			String bookingConfirmationCode) {
		super();
		this.id = id;
		this.checkInDate = checkInDate;
		this.checkOutDate = checkOutDate;
		this.BookingConfirmationCode = bookingConfirmationCode;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public LocalDate getCheckInDate() {
		return checkInDate;
	}

	public void setCheckInDate(LocalDate checkInDate) {
		this.checkInDate = checkInDate;
	}

	public LocalDate getCheckOutDate() {
		return checkOutDate;
	}

	public void setCheckOutDate(LocalDate checkOutDate) {
		this.checkOutDate = checkOutDate;
	}

	public String getGuestName() {
		return guestName;
	}

	public void setGuestName(String guestName) {
		this.guestName = guestName;
	}

	public String getGuestEmail() {
		return guestEmail;
	}

	public void setGuestEmail(String guestEmail) {
		this.guestEmail = guestEmail;
	}

	public int getNumOfAdults() {
		return numOfAdults;
	}

	public void setNumOfAdults(int numOfAdults) {
		this.numOfAdults = numOfAdults;
	}

	public int getNumOfChildren() {
		return numOfChildren;
	}

	public void setNumOfChildren(int numOfChildren) {
		this.numOfChildren = numOfChildren;
	}

	public int getTotalNumOfGuests() {
		return totalNumOfGuests;
	}

	public void setTotalNumOfGuests(int totalNumOfGuests) {
		this.totalNumOfGuests = totalNumOfGuests;
	}

	public String getBookingConfirmationCode() {
		return BookingConfirmationCode;
	}

	public void setBookingConfirmationCode(String bookingConfirmationCode) {
		BookingConfirmationCode = bookingConfirmationCode;
	}

	public RoomResponse getRoom() {
		return room;
	}

	public void setRoom(RoomResponse room) {
		this.room = room;
	}
	
	
	
}
