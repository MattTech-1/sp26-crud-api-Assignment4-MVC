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
    <h1 id="indexTitle">New Character Form</h1>

    <div class="containerNew">
        <div class="newCard">

            <!--
                POST to /characters/create.
                Input 'name' attributes MUST match the field names in the Characters entity
                so Spring can bind them automatically via @ModelAttribute.
            -->
            <form action="/characters/create" method="post">

                <h3>Character Name <span style="color:red;">*</span></h3>
                <div class="search">
                    <input class="search-input" type="text" name="name"
                           placeholder="e.g., Mario, Link, Samus" required>
                </div>
                <hr>

                <h3>Role <span style="color:red;">*</span></h3>
                <div class="search">
                    <input class="search-input" type="text" name="role"
                           placeholder="e.g., Hero, Villain, Bounty Hunter" required>
                </div>
                <p style="font-size:smaller;">What is this character's role in their universe?</p>
                <hr>

                <h3>Universe / Franchise <span style="color:red;">*</span></h3>
                <select name="universe" class="select" required>
                    <option disabled selected value="">Choose a franchise / universe</option>
                    <option value="Super Mario Bros">Super Mario Bros</option>
                    <option value="The Legend of Zelda">The Legend of Zelda</option>
                    <option value="Pokemon">Pokemon</option>
                    <option value="Kirby">Kirby</option>
                    <option value="Metroid">Metroid</option>
                    <option value="Donkey Kong Country">Donkey Kong Country</option>
                    <option value="Star Fox">Star Fox</option>
                    <option value="Fire Emblem">Fire Emblem</option>
                    <option value="Animal Crossing">Animal Crossing</option>
                    <option value="Other">Other</option>
                </select>
                <hr>

                <h3>Species <span style="color:red;">*</span></h3>
                <div class="search">
                    <input class="search-input" type="text" name="species"
                           placeholder="e.g., Human, Hylian, Pokémon" required>
                </div>
                <hr>

                <h3>Age <span style="color:red;">*</span></h3>
                <div class="search">
                    <input class="search-input" type="number" name="age"
                           step="0.1" min="0" placeholder="e.g., 25" required>
                </div>
                <hr>

                <h3>Active Date <span style="color:red;">*</span></h3>
                <div class="search">
                    <input class="search-input" type="date" name="activeDate" required>
                </div>
                <p style="font-size:smaller;">Date this character first appeared / became active</p>
                <hr>

                <button id="infoButton" type="submit">➕ Add Character</button>
                <a href="/characters">
                    <button id="infoButton" type="button">⬅️ Cancel</button>
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
