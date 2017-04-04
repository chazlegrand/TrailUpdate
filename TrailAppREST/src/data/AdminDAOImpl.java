package data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import entities.Report;
import entities.Trail;

@Transactional
@Repository
public class AdminDAOImpl implements AdminDAO {

	@PersistenceContext
	EntityManager em;
	
	@Override
	public boolean deleteReport(int id) {
		try {
			Report toDelete = em.find(Report.class, id);
			toDelete.getUser().getReports().remove(toDelete);
			toDelete.getTrail().getReports().remove(toDelete);
			em.remove(toDelete);
			em.flush();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public Trail addTrail(Trail trail) {
		em.persist(trail);
		em.flush();
		return trail;
	}

	@Override
	public Trail updateTrail(int id, Trail trail) {
		Trail managedTrail = em.find(Trail.class, id);
		managedTrail.setCity(trail.getCity());
		managedTrail.setState(trail.getState());
		managedTrail.setName(trail.getName());
		managedTrail.setApiId(trail.getApiId());
		managedTrail.setDirections(trail.getDirections());
		managedTrail.setLatitude(trail.getLatitude());
		managedTrail.setLongitude(trail.getLongitude());
		managedTrail.setDescription(trail.getDescription());
		managedTrail.setLength(trail.getLength());
		managedTrail.setImageUrl(trail.getImageUrl());
		em.persist(managedTrail);
		em.flush();
		return managedTrail;
	}

	@Override
	public boolean deleteTrail(int id) {
		Trail toDelete = em.find(Trail.class, id);
		try {
			em.remove(toDelete);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public List<Report> indexReports() {
		String query = "SELECT r FROM Report r";
		return em.createQuery(query, Report.class).getResultList();
	}

	@Override
	public List<Trail> indexTrails() {
		String query = "SELECT t FROM Trail t";
		return em.createQuery(query, Trail.class).getResultList();
	}

}
