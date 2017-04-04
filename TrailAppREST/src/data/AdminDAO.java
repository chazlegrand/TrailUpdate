package data;

import java.util.List;

import entities.Report;
import entities.Trail;

public interface AdminDAO {
	public List<Report> indexReports();
	public boolean deleteReport(int id);
	
	public List<Trail> indexTrails();
	public Trail addTrail(Trail trail);
	public Trail updateTrail(int id, Trail trail);
	public boolean deleteTrail(int id);
}
