package Assigment3.Assigment3;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * MVC Controller — returns FreeMarker view names, not JSON.
 * Base path: /characters
 *
 * URL Map:
 *   GET  /characters                  → character-list  (all characters)
 *   GET  /characters/{id}             → character-details (one character)
 *   GET  /characters/search?name=...  → character-list  (filtered)
 *   GET  /characters/create           → character-create (blank form)
 *   POST /characters/create           → saves new, redirects to details
 *   GET  /characters/updateForm/{id}  → character-update (pre-filled form)
 *   POST /characters/update           → saves edit, redirects to details
 *   GET  /characters/delete/{id}      → deletes, redirects to list
 *   GET  /characters/about            → about page
 */
@Controller
@RequestMapping("/characters")
public class CharacterMvcController {

	private final CharacterService characterService;

	public CharacterMvcController(CharacterService characterService) {
		this.characterService = characterService;
	}

	// ── LIST ─────────────────────────────────────────────────────────────────

	@GetMapping({"", "/"})
	public String getCharacterList(Model model) {
		model.addAttribute("title", "Nintendo Character Gallery");
		model.addAttribute("characterList", characterService.getAllCharacters());
		return "character-list";
	}

	// ── DETAILS ──────────────────────────────────────────────────────────────

	@GetMapping("/{id}")
	public String getCharacterDetails(@PathVariable("id") Long id, Model model) {
		Characters character = characterService.getCharacterById(id);
		if (character == null) return "redirect:/characters";
		model.addAttribute("title", character.getName() + " – Details");
		model.addAttribute("character", character);
		return "character-details";
	}

	// ── SEARCH ───────────────────────────────────────────────────────────────

	@GetMapping("/search")
	public String searchCharacters(@RequestParam("name") String namePart, Model model) {
		List<Characters> results = characterService.searchCharactersByName(namePart);
		model.addAttribute("title", "Search results for: " + namePart);
		model.addAttribute("characterList", results);
		model.addAttribute("query", namePart);
		return "character-list";
	}

	// ── CREATE ───────────────────────────────────────────────────────────────

	@GetMapping("/create")
	public String showCreateForm(Model model) {
		model.addAttribute("title", "Create New Character");
		model.addAttribute("character", new Characters());
		return "character-create";
	}

	@PostMapping("/create")
	public String createCharacter(@ModelAttribute Characters character) {
		Characters created = characterService.createCharacter(character);
		return "redirect:/characters/" + created.getId();
	}

	// ── UPDATE ───────────────────────────────────────────────────────────────

	@GetMapping("/updateForm/{id}")
	public String showUpdateForm(@PathVariable("id") Long id, Model model) {
		Characters character = characterService.getCharacterById(id);
		if (character == null) return "redirect:/characters";
		model.addAttribute("title", "Edit: " + character.getName());
		model.addAttribute("character", character);
		return "character-update";
	}

	// The update form posts to /characters/update.
	// A hidden <input name="id"> carries the character's ID so the service knows which row to update.
	@PostMapping("/update")
	public String updateCharacter(@ModelAttribute Characters character) {
		Characters updated = characterService.updateCharacter(character.getId(), character);
		if (updated == null) return "redirect:/characters";
		return "redirect:/characters/" + updated.getId();
	}

	// ── DELETE ───────────────────────────────────────────────────────────────

	// Using GET so a plain HTML link/button can trigger it (no JS needed).
	@GetMapping("/delete/{id}")
	public String deleteCharacter(@PathVariable("id") Long id) {
		characterService.deleteCharacter(id);
		return "redirect:/characters";
	}

	// ── ABOUT ────────────────────────────────────────────────────────────────

	@GetMapping("/about")
	public String aboutPage(Model model) {
		model.addAttribute("title", "About – Nintendo Character Gallery");
		return "about";
	}
}
