package Assigment3.Assigment3;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

/** Provides database access methods for characters. */
@Repository
public interface CharacterRepository extends JpaRepository<Characters, Long> {

	List<Characters> findByUniverseIgnoreCase(String universe);

	List<Characters> findBySpeciesIgnoreCase(String species);

	@Query(value = "SELECT c.* FROM characters c WHERE c.name ILIKE %?1%", nativeQuery = true)
	List<Characters> findByName(String name);
}
