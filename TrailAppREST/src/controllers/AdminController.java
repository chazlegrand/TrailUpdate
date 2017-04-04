package controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;

import data.AdminDAO;
import entities.Report;
import entities.Trail;

@RestController
public class AdminController {

	@Autowired
	AdminDAO adminDAO;
	
	@GetMapping("admin/reports")
	List<Report> indexReports() {
		return adminDAO.indexReports();
	}
	
	@DeleteMapping("admin/reports/{id}")
	boolean deleteReport(@PathVariable int id, HttpServletResponse res) {
		return adminDAO.deleteReport(id);
	}
	
	@GetMapping("admin/trails")
	List<Trail> indexTrails() {
		return adminDAO.indexTrails();
	}
	
	@PostMapping("admin/trails")
	Trail createTrail(@RequestBody String trailJSON, HttpServletResponse res) {
		Trail trail = null;
		ObjectMapper mapper = new ObjectMapper();
		try {
			trail = mapper.readValue(trailJSON, Trail.class);
		} catch (IOException e) {
			e.printStackTrace();
			res.setStatus(400);
			return null;
		}
		
		trail = adminDAO.addTrail(trail);
		res.setStatus(201);
		return trail;
	}
	
	@PutMapping("admin/trails/{id}")
	Trail updateTrail(@PathVariable int id, @RequestBody String trailJSON, HttpServletResponse res) {
		Trail trail = null;
		ObjectMapper mapper = new ObjectMapper();
		try {
			trail = mapper.readValue(trailJSON, Trail.class);
		} catch (IOException e) {
			e.printStackTrace();
			res.setStatus(400);
			return null;
		}
		
		trail = adminDAO.updateTrail(id, trail);
		res.setStatus(202);
		return trail;
	}
	
	@DeleteMapping("admin/trails/{id}")
	boolean deleteTrail(@PathVariable int id, HttpServletResponse res) {
		return adminDAO.deleteTrail(id);
	}
}
