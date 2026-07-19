# TODO

- [2026-07-18] [BLOCKED: la sesión RubyGems.org ya está autenticada, pero la
  página de Pending Trusted Publishers exige reconfirmar la contraseña; el
  usuario debe ingresarla en la pestaña abierta y avisar cuando termine]
  Crear el publisher para `ldebortoli/telegram-bot-ruby-rbs`, workflow
  `release.yml`, entorno `release`, y publicar/verificar la versión 0.1.0.

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
