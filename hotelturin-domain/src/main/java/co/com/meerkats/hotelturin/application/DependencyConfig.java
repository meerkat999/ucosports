package co.com.meerkats.hotelturin.application;

import javax.enterprise.context.Dependent;
import javax.enterprise.inject.Produces;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceContextType;

public class DependencyConfig {

	@PersistenceContext(name = "hotelturinDS", type=PersistenceContextType.TRANSACTION)
	private EntityManager entityManager;
	
	@Produces
	@Dependent
	public EntityManager getEntityManager() {
		return entityManager;
	}
	
}
