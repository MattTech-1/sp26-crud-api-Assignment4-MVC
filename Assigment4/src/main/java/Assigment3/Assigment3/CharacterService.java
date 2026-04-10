package Assigment3.Assigment3;

import java.util.List;

import org.springframework.stereotype.Service;

/** Contains the business logic for character operations. */
@Service
public class CharacterService {

	private final CharacterRepository characterRepository;

	public CharacterService(CharacterRepository characterRepository) {
		this.characterRepository = characterRepository;
	}

	public List<Characters> getAllCharacters() {
		return characterRepository.findAll();
	}

	public Characters getCharacterById(Long characterId) {
		return characterRepository.findById(characterId).orElse(null);
	}

	public Characters createCharacter(Characters character) {
		character.setId(null); // ensure new record
		return characterRepository.save(character);
	}

	public Characters updateCharacter(Long characterId, Characters updatedCharacter) {
		Characters existing = getCharacterById(characterId);
		if (existing == null) return null;

		existing.setName(updatedCharacter.getName());
		existing.setRole(updatedCharacter.getRole());
		existing.setAge(updatedCharacter.getAge());
		existing.setUniverse(updatedCharacter.getUniverse());
		existing.setSpecies(updatedCharacter.getSpecies());
		existing.setActiveDate(updatedCharacter.getActiveDate());
		return characterRepository.save(existing);
	}

	public boolean deleteCharacter(Long characterId) {
		if (!characterRepository.existsById(characterId)) return false;
		characterRepository.deleteById(characterId);
		return true;
	}

	public List<Characters> getCharactersByUniverse(String universe) {
		return characterRepository.findByUniverseIgnoreCase(universe);
	}

	public List<Characters> getCharactersBySpecies(String species) {
		return characterRepository.findBySpeciesIgnoreCase(species);
	}

	public List<Characters> searchCharactersByName(String namePart) {
		return characterRepository.findByName(namePart);
	}
}
