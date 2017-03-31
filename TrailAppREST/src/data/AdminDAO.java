package data;

import entities.Report;
import entities.Trail;

public interface AdminDAO {
	public boolean deleteReport(int id);
	public Trail addTrail(Trail trail);
	public Trail updateTrail(int id, Trail trail);
	public boolean deleteTrail(int id);
}
