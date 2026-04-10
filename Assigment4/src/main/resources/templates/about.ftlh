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
    <!-- About page content for the project. -->
    <h2 id="AboutTitle">About Page</h2>

    <div class="containerAbout">
        <div class="aboutCard">

            <h3 style="color: rgb(214, 52, 52);">🎮 Welcome to the Nintendo Character Gallery!</h3>
            <p>This website celebrates some of Nintendo's most iconic characters, from Mario to Link.
               These characters have shaped gaming history and continue to inspire fans of all ages.</p>
            <hr>

            <h3 style="color: rgb(214, 52, 52);">💡 Purpose</h3>
            <p>The Nintendo Character Gallery was created to highlight and share the history of
               Nintendo's most well-known characters. Inspired by growing up with these games, this
               project combines nostalgia with useful information for both longtime fans and newcomers.</p>
            <hr>

            <h3 style="color: rgb(214, 52, 52);">🎨 Design Approach</h3>
            <ul>
                <li><strong>Colors:</strong> Red, white, and gray inspired by the Nintendo brand</li>
                <li><strong>Layout:</strong> Card-based design for simple and easy browsing</li>
                <li><strong>Features:</strong> Search and hover effects for better interaction</li>
                <li><strong>Typography:</strong> Clean, readable, and slightly playful fonts</li>
            </ul>
            <hr>

            <h3 style="color: rgb(214, 52, 52);">⭐ Featured Characters</h3>
            <p>The gallery includes legendary Nintendo characters — each stored in and retrieved
               live from a PostgreSQL database. Browse them all or add your own!</p>

            <a href="/characters"><button id="infoButton" type="button">🎮 Character Gallery</button></a>
            <a href="/characters/create"><button id="infoButton" type="button">➕ Create New Character</button></a>
            <hr>

            <h3 style="color: rgb(214, 52, 52);">🏡 Back to Home</h3>
            <a href="/characters"><button id="infoButton" type="button">⬅️ Home</button></a>

        </div>
    </div>
</main>

<footer class="footer">
    <p>© 2026 Nintendo Character Gallery. All characters are property of Nintendo.</p>
</footer>

</body>
</html>
