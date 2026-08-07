ForzarSpawnAlEntrar:
  type: world
  events:
    on player joins:
      - wait 1s
      - execute as_server "spawn <player.name>"