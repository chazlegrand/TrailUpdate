package data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import entities.User;

@Transactional
@Repository
public class UserDaoJpaImpl implements UserDAO {

	@PersistenceContext
	EntityManager em;
		
	public List<User> index() {
		String query = 
			"SELECT u " + 
			"FROM User u";
		
		return em.createQuery(query, User.class)
				.getResultList();
	}
}
