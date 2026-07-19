# TODO

- No hay tareas pendientes dentro del alcance actual.

# IN PROGRESS

- No hay tareas activas.

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
- [2026-07-18] Publicar `telegram-bot-ruby-rbs` 0.1.0 en RubyGems mediante OIDC.
  El primer release detectó la ausencia de `rake release`; `f6706de` adoptó las
  tareas estándar de Bundler. CI 29666785679 y Release 29666785676 pasaron. La
  API y la descarga pública coinciden en SHA-256
  `4dc3c2f6a840d7df11611684bd47a5a66f1b31ce42167af0f126905205de6449`.
