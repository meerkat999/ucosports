package co.com.meerkats.ucosports.application;

import javax.enterprise.context.Dependent;
import javax.enterprise.inject.Produces;
import javax.persistence.EntityManager;
import javax.persistence.FlushModeType;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceContextType;

public class DependencyConfig {

	@PersistenceContext(name = "ucosportsDS", type=PersistenceContextType.TRANSACTION)
	private EntityManager entityManager;
	
	@Produces
	@Dependent
	public EntityManager getEntityManager() {
		entityManager.setFlushMode(FlushModeType.COMMIT);
		entityManager.getProperties().forEach((x,y) -> {
			System.out.println(x + " " + y);
		});
		System.out.println("Entity manager");
		return entityManager;
	}
	
}
