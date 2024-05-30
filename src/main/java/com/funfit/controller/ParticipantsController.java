package com.funfit.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.funfit.bean.Batch;
import com.funfit.bean.Participants;
import com.funfit.service.BatchService;
import com.funfit.service.ParticipantsService;

/**
 * Servlet implementation class ParticipantsController
 */
@WebServlet("/ParticipantsController")
public class ParticipantsController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	ParticipantsService ps = new ParticipantsService();
	public ParticipantsController() {
		super();

	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter pw = response.getWriter();
		HttpSession hs = request.getSession();
		String flagValue = request.getParameter("flag");
		String batchValue = request.getParameter("bid");
		
		List<Participants> listOfParticipants = null;
		if(batchValue != null) {
			try {
				listOfParticipants = ps.viewAllParticipants(Integer.valueOf(batchValue));
			}
			catch (Exception exc) {
				listOfParticipants = ps.viewAllParticipants();
			}
		}
		else {
			listOfParticipants = ps.viewAllParticipants();
		}
		
		if (flagValue != null) {
			if (flagValue.equals("4")) {
				int pid = Integer.valueOf(request.getParameter("pid"));
				Participants selectedParticipant = null;
				for(Participants part : listOfParticipants){
					if (part.getPid()== pid) {
						selectedParticipant = part;
						break;
					}
				}
				hs.setAttribute("selectedParticipant", selectedParticipant);
				
				BatchService bs = new BatchService();
				List<Batch> listOfBatch = bs.viewAllBatch();
				hs.setAttribute("batches", listOfBatch);
				response.sendRedirect("updateParticipants.jsp");
			}
		}
		else {
			hs.setAttribute("participants", listOfParticipants);
			response.sendRedirect("viewParticipants.jsp");
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter pw = response.getWriter();
		HttpSession hs = request.getSession();
		response.setContentType("text/html");
		RequestDispatcher rd = null;
		String flagValue = request.getParameter("flag");
		String result = "";
		Participants pp = new Participants();
		if(flagValue != null) {
			if (flagValue.equals("3")) {
		
				int pid = Integer.parseInt(request.getParameter("pid"));
				pp.setPid(pid);
				rd = request.getRequestDispatcher("viewParticipants.jsp");
				result = ps.deleteParticipants(pp);
				List<Participants> listOfParticipants = ps.viewAllParticipants();
				hs.setAttribute("participants", listOfParticipants);
			} else if (flagValue.equals("5")) {
				rd = request.getRequestDispatcher("updateParticipants.jsp");
				String fname = request.getParameter("fname");
				int age  = Integer.parseInt(request.getParameter("age"));
				String phonenumber = request.getParameter("phonenumber");
				int bid = Integer.parseInt(request.getParameter("bid"));
				int pid = Integer.valueOf(request.getParameter("pid"));
				pp.setFname(fname);
				pp.setAge(age);
				pp.setPhonenumber(phonenumber);
				pp.setBid(bid);
				pp.setPid(pid);
				result = ps.updateParticipants(pp);
			}
		}
		else {
			String fname = request.getParameter("fname");
			int age  = Integer.parseInt(request.getParameter("age"));
			String phonenumber = request.getParameter("phonenumber");
			int bid = Integer.parseInt(request.getParameter("bid"));
			pp.setFname(fname);
			pp.setAge(age);
			pp.setPhonenumber(phonenumber);
			pp.setBid(bid);

			rd = request.getRequestDispatcher("addParticipants.jsp");
			result = ps.addParticipants(pp);
		}
		pw.print(result);
		rd.include(request, response);
	}
	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}
	@Override
	protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}
}
