# Install

`brew install rainbowbarf`

# Setup

Put this into a script on path called `tmux-spotify-info`.

```bash
#!/usr/bin/env osascript
# Returns the current playing song in Spotify for OSX

tell application "Spotify"
  if it is running then
    if player state is playing then
      set track_name to name of current track
      set artist_name to artist of current track

      "#[fg=colour39,nobold]#[fg=colour16, bg=colour39, nobold] " & artist_name & " - " & track_name & " #[bg=colour39]"
    end if
  end if
end tell
```

