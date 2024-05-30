package com.funfit.service;

import java.util.List;

import com.funfit.bean.Participants;
import com.funfit.dao.ParticipantsDao;

public class ParticipantsService {
	ParticipantsDao pd = new ParticipantsDao();
	
	public String addParticipants(Participants participants) {
		if(pd.addParticipants(participants)>0) {
			return "Participants details added successfully";
		}else {
			return "Participants details didn't add";
		}
	}
	
	public List<Participants> viewAllParticipants() {
		return pd.viewAllParticipants();
	}
	
	public List<Participants> viewAllParticipants(int bid) {
		return pd.viewAllParticipants(bid);
	}
	
	public String deleteParticipants(Participants participants) {
		if(pd.deleteParticipants(participants)>0) {
			return "Participants deleted successfully";
		}else {
			return "Participants wasn't deleted";
		}
	}
	
	public String updateParticipants(Participants participants) {
		if(pd.updateParticipants(participants)>0) {
			return "Participants updated successfully";
		}else {
			return "Participants wasn't updated";
		}
	}
	
}
