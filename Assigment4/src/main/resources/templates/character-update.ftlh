<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${title}</title>
    <link rel="stylesheet" href="/Stylesheet.css">
</head>
<body>

<nav class="navbar">
    <ul>
        <li><a href="/characters">Home</a></li>
        <li><a href="/characters/about">About</a></li>
        <li><a href="/characters/create">Create a New Character</a></li>
    </ul>
</nav>

<main>
    <!-- Form used to edit an existing character. -->
    <h1 id="indexTitle">Edit Character: ${character.name}</h1>

    <div class="containerNew">
        <div class="newCard">

            <!--
                POST to /characters/update.
                The hidden 'id' field is critical — it tells the controller which DB row to update.
                All other input names match Characters entity fields for @ModelAttribute binding.
            -->
            <form action="/characters/update" method="post">

                <!-- HIDDEN: carries the character ID to the POST handler -->
                <input type="hidden" name="id" value="${character.id?c}">

                <h3>Character Name <span style="color:red;">*</span></h3>
                <div class="search">
                    <input class="search-input" type="text" name="name"
                           value="${character.name}" required>
                </div>
                <hr>

                <h3>Role <span style="color:red;">*</span></h3>
                <div class="search">
                    <input class="search-input" type="text" name="role"
                           value="${character.role}" required>
                </div>
                <hr>

                <h3>Universe / Franchise <span style="color:red;">*</span></h3>
                <select name="universe" class="select" required>
                    <option value="Super Mario Bros"     <#if character.universe == "Super Mario Bros">selected</#if>>Super Mario Bros</option>
                    <option value="The Legend of Zelda"  <#if character.universe == "The Legend of Zelda">selected</#if>>The Legend of Zelda</option>
                    <option value="Pokemon"              <#if character.universe == "Pokemon">selected</#if>>Pokemon</option>
                    <option value="Kirby"                <#if character.universe == "Kirby">selected</#if>>Kirby</option>
                    <option value="Metroid"              <#if character.universe == "Metroid">selected</#if>>Metroid</option>
                    <option value="Donkey Kong Country"  <#if character.universe == "Donkey Kong Country">selected</#if>>Donkey Kong Country</option>
                    <option value="Star Fox"             <#if character.universe == "Star Fox">selected</#if>>Star Fox</option>
                    <option value="Fire Emblem"          <#if character.universe == "Fire Emblem">selected</#if>>Fire Emblem</option>
                    <option value="Animal Crossing"      <#if character.universe == "Animal Crossing">selected</#if>>Animal Crossing</option>
                    <option value="Other"                <#if character.universe == "Other">selected</#if>>Other</option>
                </select>
                <hr>

                <h3>Species <span style="color:red;">*</span></h3>
                <div class="search">
                    <input class="search-input" type="text" name="species"
                           value="${character.species}" required>
                </div>
                <hr>

                <h3>Age <span style="color:red;">*</span></h3>
                <div class="search">
                    <input class="search-input" type="number" name="age"
                           step="0.1" min="0" value="${character.age?string["0.##"]}" required>
                </div>
                <hr>

                <h3>Active Date <span style="color:red;">*</span></h3>
                <div class="search">
                    <input class="search-input" type="date" name="activeDate"
                           value="${character.activeDate?string("yyyy-MM-dd")}" required>
                </div>
                <hr>

                <button id="infoButton" type="submit">💾 Save Changes</button>
                <a href="/characters/${character.id?c}">
                    <button id="infoButton" type="button">❌ Cancel</button>
                </a>

            </form>
        </div>
    </div>
</main>

<footer class="footer">
    <p>© 2026 Nintendo Character Gallery. All characters are property of Nintendo.</p>
</footer>

</body>
</html>
