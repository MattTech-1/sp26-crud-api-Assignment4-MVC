<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${title}</title>
    <link rel="stylesheet" href="/Stylesheet.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200&icon_names=search"/>
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
    <!-- Gallery page that lists all characters or search results. -->
    <h1 id="indexTitle">Nintendo Character Gallery</h1>
    <h2 id="indexTitle">Explore the legendary heroes of the Mushroom Kingdom and beyond!</h2>

    <!-- Search Bar -->
    <form id="searchBar" action="/characters/search" method="get">
        <div class="search">
            <span class="search-icon material-symbols-outlined">search</span>
            <input class="search-input" type="search" name="name" placeholder="Search characters by name"
                <#if query??>value="${query}"</#if>>
        </div>
    </form>

    <#if characterList?size == 0>
        <p style="text-align:center; margin-top:40px; font-size:1.1em;">
            No characters found.
            <a href="/characters">← Back to gallery</a>
        </p>
    <#else>
    <!-- Character Cards -->
    <div class="containerIndex">
        <#list characterList as character>
        <div class="characterCard">
            <h3>${character.name}</h3>

            <!-- Try the character's own image; fall back to Nintendo logo -->
            <img class="pictures"
                 src="/Pictures/${character.name}.jpg"
                 onerror="this.onerror=null; this.src='/Pictures/Nintendo.png';"
                 alt="${character.name}">

            <div class="characterInfo">
                <p><strong>Universe:</strong> ${character.universe}</p>
                <p><strong>Role:</strong> ${character.role}</p>
                <p><strong>Species:</strong> ${character.species}</p>
                <p><strong>Age:</strong> ${character.age?string["0.##"]}</p>
                <p><strong>Active Since:</strong> ${character.activeDate?string("yyyy-MM-dd")}</p>
            </div>

            <a href="/characters/${character.id?c}">
                <button id="infoButton" type="button">More Info</button>
            </a>
        </div>
        </#list>
    </div>
    </#if>
</main>

<footer class="footer">
    <p>© 2026 Nintendo Character Gallery. All characters are property of Nintendo.</p>
</footer>

</body>
</html>
