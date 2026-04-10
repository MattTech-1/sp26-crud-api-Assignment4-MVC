package Assigment3.Assigment3;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * REST API controller — returns JSON.
 * Base path: /api/characters
 */
@RestController
@RequestMapping("/api/characters")
public class CharacterController {

	private final CharacterService characterService;

	public CharacterController(CharacterService characterService) {
		this.characterService = characterService;
	}

	/** GET /api/characters/ — all characters */
	@GetMapping("/")
	public List<Characters> getAllCharacters() {
		return characterService.getAllCharacters();
	}

	/** GET /api/characters/{id} — one character */
	@GetMapping("/{id}")
	public ResponseEntity<Characters> getCharacterById(@PathVariable("id") Long characterId) {
		Characters character = characterService.getCharacterById(characterId);
		return character != null ? ResponseEntity.ok(character) : ResponseEntity.notFound().build();
	}

	/** POST /api/characters/ — create */
	@PostMapping("/")
	public ResponseEntity<Characters> createCharacter(@RequestBody Characters character) {
		Characters created = characterService.createCharacter(character);
		return created != null ? ResponseEntity.ok(created) : ResponseEntity.notFound().build();
	}

	/** PUT /api/characters/{id} — update */
	@PutMapping("/{id}")
	public ResponseEntity<Characters> updateCharacter(@PathVariable("id") Long characterId,
			@RequestBody Characters character) {
		Characters updated = characterService.updateCharacter(characterId, character);
		return updated != null ? ResponseEntity.ok(updated) : ResponseEntity.notFound().build();
	}

	/** DELETE /api/characters/{id} — delete */
	@DeleteMapping("/{id}")
	public ResponseEntity<Void> deleteCharacter(@PathVariable("id") Long characterId) {
		return characterService.deleteCharacter(characterId)
				? ResponseEntity.noContent().build()
				: ResponseEntity.notFound().build();
	}

	/** GET /api/characters/category/{category}?value=... — filter by universe or species */
	@GetMapping("/category/{category}")
	public ResponseEntity<List<Characters>> getCharactersByCategory(@PathVariable String category,
			@RequestParam String value) {
		if ("universe".equalsIgnoreCase(category)) return ResponseEntity.ok(characterService.getCharactersByUniverse(value));
		if ("species".equalsIgnoreCase(category))  return ResponseEntity.ok(characterService.getCharactersBySpecies(value));
		return ResponseEntity.badRequest().build();
	}

	/** GET /api/characters/search?name=... — search by name */
	@GetMapping("/search")
	public List<Characters> searchCharactersByName(@RequestParam("name") String namePart) {
		return characterService.searchCharactersByName(namePart);
	}
}
