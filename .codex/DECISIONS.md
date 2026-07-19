# Decisiones tecnicas

No borrar decisiones anteriores. Si una decision cambia, agregar una nueva entrada que indique cual reemplaza.

## D-001 - Memoria persistente del proyecto

- Estado: vigente.
- Fecha: 2026-07-18.
- Decision: usar `.codex/` como fuente de verdad entre sesiones, modelos y agentes.
- Motivo: continuidad independiente del historial del chat.

## D-002 - Firmas separadas y reproducibles

- Estado: vigente.
- Fecha: 2026-07-18.
- Decisión: publicar las firmas como la gema independiente
  `telegram-bot-ruby-rbs`, con dependencia compatible sobre
  `telegram-bot-ruby` y sin modificar ni bifurcar su comportamiento Ruby.
- Fuente: usar el código de la versión objetivo para la superficie realmente
  disponible y la documentación oficial de Telegram para nombres, parámetros,
  campos y tipos; informar por separado novedades oficiales aún no soportadas
  por el wrapper.
- Motivo: evitar firmas que prometan constantes o conversiones inexistentes y
  permitir regeneración y auditoría cuando cambie cualquiera de las dos APIs.

## D-003 - Publicación sin claves persistentes

- Estado: vigente.
- Fecha: 2026-07-18.
- Decisión: publicar tags `v*` mediante `.github/workflows/release.yml` y
  `rubygems/release-gem@v1`, usando OIDC y el entorno GitHub `release`.
- Motivo: evitar API keys de RubyGems en el repositorio o en secretos de larga
  duración y permitir el alta inicial mediante pending trusted publisher.

## D-004 - Las tareas de publicación provienen de Bundler

- Estado: vigente.
- Fecha: 2026-07-18.
- Decisión: cargar `bundler/gem_tasks` en el Rakefile para ofrecer las tareas
  estándar `build`, `install` y `release` que consume `release-gem@v1`.
- Motivo: la acción oficial obtiene credenciales OIDC y ejecuta
  `bundle exec rake release`; una tarea de build propia no completa ese contrato.
