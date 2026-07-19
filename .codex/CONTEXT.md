# telegram-bot-ruby-rbs - Contexto del proyecto

## Descripcion general

Gema independiente y de código abierto que distribuye firmas RBS para
`telegram-bot-ruby`. Su primera versión apunta a `telegram-bot-ruby` 2.7.0 y
contrasta tipos, campos, parámetros y retornos con la documentación oficial de
Telegram Bot API.

## Estado detectado

- Ruta: `C:\Users\calei\Documents\telegram-bot-ruby-rbs`
- Stack: Ruby, RBS y Bundler
- Git: True
- Rama detectada: `main`
- Remoto origin: `https://github.com/ldebortoli/telegram-bot-ruby-rbs.git`
- RubyGems: `https://rubygems.org/gems/telegram-bot-ruby-rbs`
- Versión pública actual: `0.1.0`

## Arquitectura

- `sig/` contiene solamente las firmas que consumen RBS/Steep.
- `script/` genera y audita las firmas desde el código publicado del wrapper y
  una instantánea estructurada de la documentación oficial.
- `test/` verifica parseo, cobertura de constantes/campos/endpoints y uso real
  junto con `telegram-bot-ruby`.
- La gema no agrega comportamiento de ejecución al wrapper.

## Ejecucion y tests

- `bundle exec rake update_api`: refresca la instantánea oficial de Telegram.
- `bundle exec rake generate`: regenera firmas e informe de compatibilidad.
- `bundle exec rake`: ejecuta 5 pruebas, 12 aserciones y valida RBS.
- `bundle exec rake build`: construye `pkg/telegram-bot-ruby-rbs-0.1.0.gem`.

La instantánea actual es Bot API 10.2. Las firmas cubren 271 tipos concretos,
21 aliases/uniones y 169 endpoints presentes en `telegram-bot-ruby` 2.7.0.

## Convenciones

- Preservar cambios ajenos y secretos locales.
- Actualizar este archivo solo cuando cambie informacion estable.
- La memoria persistente vive en `.codex/` y se carga siguiendo `AGENTS.md`.
- Si el proyecto tiene una UI para controlar un bot, servidor o proceso en segundo plano, cerrar esa UI debe detener el proceso administrado cuando sea tecnicamente posible.
