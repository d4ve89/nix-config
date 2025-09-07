spaces_update() {
  CURRENT_SPACES="$(yabai -m query --displays | jq -r '.[].spaces | @sh')"

  args=(--set spaces_bracket drawing=off
        --set '/space\..*/' background.drawing=on
        --animate sin 10)

  while read -r line; do
    for space in $line; do
      apps="$(yabai -m query --windows --space "$space" | jq -r '.[].app')"

      if [ -n "$apps" ]; then
        args+=(--set space.$space drawing=on)

        icon_strip=" "
        while IFS= read -r app; do
          icon_strip+=" $("$CONFIG_DIR/plugins/icon_map.sh" "$app")"
        done <<< "$apps"

        args+=(--set space.$space label="$icon_strip" label.drawing=on)
      else
        # Kein Fenster -> Space ausblenden
        args+=(--set space.$space drawing=off label="" label.drawing=off)
      fi
    done
  done <<< "$CURRENT_SPACES"

  sketchybar -m "${args[@]}"
}
