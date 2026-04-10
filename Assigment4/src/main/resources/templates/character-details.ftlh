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
    <!-- Details page for a single character. -->
    <h1 id="detailTitle" style="color: rgb(214, 52, 52);">${character.name}</h1>
    <p style="margin-left:5px;">${character.role} &bull; ${character.universe}</p>
    <hr>

    <!-- Image + stat grid -->
    <div class="containerDetail">
        <img id="biggerMario"
             src="/Pictures/${character.name}.jpg"
             onerror="this.onerror=null; this.src='/Pictures/Nintendo.png';"
             alt="${character.name}">

        <div class="detailCard">
            <div class="universe">
                <h3>🏰 Universe</h3>
                <p style="font-size:smaller;">${character.universe}</p>
            </div>
            <div class="role">
                <h3>👤 Role</h3>
                <p style="font-size:smaller;">${character.role}</p>
            </div>
            <div class="species">
                <h3>🧬 Species</h3>
                <p style="font-size:smaller;">${character.species}</p>
            </div>
            <div class="powerLevel">
                <h3>🎂 Age</h3>
                <p style="font-size:smaller;">${character.age?string["0.##"]} yrs</p>
            </div>
        </div>
    </div>

    <!-- Active date -->
    <div class="containerDetail">
        <div class="detailTemplate">
            <h3>📅 Active Since</h3>
            <p>${character.activeDate?string("MMMM dd, yyyy")}</p>
        </div>
    </div>

    <!-- Actions -->
    <div class="containerDetail">
        <div class="detailTemplate">
            <h3>⚙️ Actions</h3>

            <a href="/characters/updateForm/${character.id?c}">
                <button id="detailsButton" type="button">✏️ Edit Character</button>
            </a>

            <a href="/characters/delete/${character.id?c}"
               onclick="return confirm('Delete ${character.name}? This cannot be undone.');">
                <button id="detailsButton" type="button"
                        style="background:#ffe5e5; border:1px solid #d63434;">
                    🗑️ Delete Character
                </button>
            </a>

            <hr>

            <a href="/characters">
                <button id="detailsButton" type="button">⬅️ Back to Gallery</button>
            </a>
            <a href="/characters/create">
                <button id="detailsButton" type="button">➕ Create New Character</button>
            </a>
        </div>
    </div>
</main>

<footer class="footer">
    <p>© 2026 Nintendo Character Gallery. All characters are property of Nintendo.</p>
</footer>

</body>
</html>
