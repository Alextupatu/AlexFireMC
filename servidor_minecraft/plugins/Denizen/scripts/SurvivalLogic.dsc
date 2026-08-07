# Script para manejar el teletransporte al Survival
# Asegúrate de que el nombre del mundo sea exactamente igual al tuyo en Multiverse

SurvivalTeleportTask:
  type: task
  script:
  # Verifica si el jugador ya tiene el flag de 'ya_entro'
  - if <player.has_flag[ya_entro_al_survival]>:
    # Si ya entró, lo lleva a su última posición guardada
    - teleport <player.flag[posicion_guardada]>
    - gamemode survival
    - narrate "<&a>¡Bienvenido de nuevo a tu aventura!"
  - else:
    # Si es la primera vez, hace el Random TP y marca que ya entró
    - flag player ya_entro_al_survival
    - execute as_server "rtp player <player.name> world world"
    - gamemode survival
    - narrate "<&b>¡Primera vez! Teletransportando a un lugar nuevo..."

# Script para guardar la posición cuando el jugador se desconecta
GuardarPosicionAlSalir:
  type: world
  events:
    on player quits:
      # Solo guardamos si está en el mundo survival (cambia 'survival' por el nombre de tu mundo)
      - if <player.world.name> == world:
        - flag player posicion_guardada:<player.location>

# Creamos el comando que activará el portal
IrSurvivalCommand:
  type: command
  name: ir_survival
  description: Teletransporte inteligente al survival
  usage: /ir_survival
  script:
  - run SurvivalTeleportTask