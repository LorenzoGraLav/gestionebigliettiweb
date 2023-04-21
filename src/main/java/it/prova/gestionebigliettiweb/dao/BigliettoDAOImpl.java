package it.prova.gestionebigliettiweb.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import org.apache.commons.lang3.StringUtils;

import it.prova.gestionebigliettiweb.model.Biglietto;

public class BigliettoDAOImpl implements BigliettoDAO {

	private EntityManager entityManager;

	@Override
	public List<Biglietto> list() throws Exception {
		return entityManager.createQuery("from Biglietto", Biglietto.class).getResultList();

	}

	@Override
	public Biglietto findOne(Long id) throws Exception {
		return entityManager.find(Biglietto.class, id);

	}

	@Override
	public void update(Biglietto input) throws Exception {
		if (input == null) {
			throw new Exception("Problema valore in input");
		}
		entityManager.merge(input);

	}

	@Override
	public void insert(Biglietto input) throws Exception {
		if (input == null) {
			throw new Exception("Problema valore in input");
		}
		entityManager.persist(input);
	}

	@Override
	public void delete(Biglietto input) throws Exception {
		if (input == null) {
			throw new Exception("Problema valore in input");
		}
		entityManager.remove(input);

	}

	@Override
	public void setEntityManager(EntityManager entityManager) {
		this.entityManager = entityManager;

	}

	@Override
	public List<Biglietto> findByExample(Biglietto example) throws Exception {
		Map<String, Object> paramaterMap = new HashMap<String, Object>();
		List<String> whereClauses = new ArrayList<String>();

		StringBuilder queryBuilder = new StringBuilder("select b from Biglietto b where b.id = b.id ");

		if (StringUtils.isNotEmpty(example.getProvenienza())) {
			whereClauses.add(" b.provenienza  like :provenienza ");
			paramaterMap.put("provenienza", "%" + example.getProvenienza() + "%");
		}
		if (StringUtils.isNotEmpty(example.getDestinazione())) {
			whereClauses.add(" b.destinazione  like :destinazione ");
			paramaterMap.put("destinazione", "%" + example.getDestinazione() + "%");
		}
		
		if (example.getData() != null) {
			whereClauses.add("b.data >= :data ");
			paramaterMap.put("data", example.getData());
		}
		
		if (example.getPrezzo() != null) {
			whereClauses.add("b.prezzo >= :prezzo ");
			paramaterMap.put("prezzo", example.getPrezzo());
		}
		
		
		
		queryBuilder.append(!whereClauses.isEmpty()?" and ":"");
		queryBuilder.append(StringUtils.join(whereClauses, " and "));
		TypedQuery<Biglietto> typedQuery = entityManager.createQuery(queryBuilder.toString(), Biglietto.class);

		for (String key : paramaterMap.keySet()) {
			typedQuery.setParameter(key, paramaterMap.get(key));
		}

		return typedQuery.getResultList();
	}

}
