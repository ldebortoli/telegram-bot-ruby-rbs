# TODO

- [2026-07-18] [BLOCKED: RubyGems.org no tiene una sesión autenticada en el
  navegador disponible y no existe una credencial local; un propietario debe
  iniciar sesión y crear el pending trusted publisher para
  `ldebortoli/telegram-bot-ruby-rbs`, workflow `release.yml`, entorno
  `release`] Publicar y verificar `telegram-bot-ruby-rbs` 0.1.0.

# IN PROGRESS

- No hay tareas activas mientras se espera la autenticación RubyGems.

# DONE

- [2026-07-18] Inicializar la memoria persistente del proyecto.
- [2026-07-18] Implementar, generar y validar las firmas para
  `telegram-bot-ruby` 2.7.0 contra Telegram Bot API 10.2.
- [2026-07-18] Construir e instalar aisladamente
  `telegram-bot-ruby-rbs-0.1.0.gem`; el paquete contiene 275 archivos RBS y
  pasa `rbs validate` como dependencia instalada.
- [2026-07-18] Crear el repositorio público
  `ldebortoli/telegram-bot-ruby-rbs` y configurar `origin`.
- [2026-07-18] Publicar `main` y validar el CI de GitHub en Ruby 3.3 y 3.4; el
  head `c3e884a` pasa generación, pruebas, validación y construcción.
