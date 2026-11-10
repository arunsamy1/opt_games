# Dune Buggy — offline

The Flash game from the miniplay.com page, running locally in your browser through
[Ruffle](https://ruffle.rs) (an open-source Flash emulator). No internet needed once set up.

## Play

```sh
./play.sh
```

It starts a small local web server and opens the game in your default browser.
Press `Ctrl+C` in the terminal when you're finished.

Opening `index.html` directly by double-clicking will **not** work — browsers refuse to
load Ruffle's WebAssembly over `file://`, so the page has to come from `localhost`.

## Controls

Click the game once so it takes keyboard focus, then drive with the **arrow keys**.

- **Fullscreen** — the toolbar button, or press `F`. `Esc` exits.
  Right-clicking the game opens Ruffle's own menu, which also has a fullscreen option.
- **Restart** — reloads the game from scratch.

## Layout

```
index.html              the player page (fullscreen, restart, letterboxed scaling)
play.sh                 local server + browser launcher
game/dunebuggy.swf      the game itself (1.7 MB, Flash 7, 500x350 @ 24fps)
ruffle/                 Ruffle 0.7.1 self-hosted web build (MIT / Apache-2.0)
```

## Notes

- The page sets Ruffle's `allowNetworking: "none"`, so the game never reaches out to the
  network. That keeps it genuinely offline and stops it hanging on the dead 2006-era ad and
  leaderboard servers it was built against. The in-game online scoreboard therefore does
  nothing — local play and scoring work fine. To allow those calls, change that line in
  `index.html` to `"all"`.
- To update Ruffle later, replace the `ruffle/` folder with a newer
  *web-selfhosted* build from <https://github.com/ruffle-rs/ruffle/releases>.
- The game is Miniclip/Iriysoft's; this is just a local copy for your own play, so don't
  redistribute or host it publicly.
