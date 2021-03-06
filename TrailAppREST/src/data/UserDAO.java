package data;

import java.util.Set;

import entities.Trail;
import entities.User;

public interface UserDAO extends EntityCrudDAO<User>{

	public String ping();
	
	public Set<Trail> userFavorites(int id);
	public Set<Trail> addUserFavorite(int tid, int uid);
	public Set<Trail> removeUserFavorite(int tid, int uid);
	
}
