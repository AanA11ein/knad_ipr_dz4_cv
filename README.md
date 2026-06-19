# Юшко Владимир Станиславович. КНАД-253

### ДЗ №4. CV (LaTeX + Docker + GitHub Actions)

#### Сборочная система

Проект использует Docker и Makefile для воспроизводимой сборки LaTeX-документа.

По умолчанию используется базовый Docker-образ (сгенерирован из `choose_system.py`): debian:10.3

#### Локальная сборка

PDF собирается локально через Docker и Makefile командой `make build` (сборка Docker → запуск контейнера → компиляция `cv/main.tex` → генерация `output/main.pdf`, папка `output/` игнорируется Git).

#### CI (GitHub Actions)

При каждом push в `master` запускается GitHub Actions, который выполняет `make build` (checkout репозитория → сборка Docker → компиляция `cv/main.tex` → генерация `main.pdf` → сохранение результата в artifacts). Итоговый PDF можно скачать через вкладку Actions в репозитории: открыть последний workflow run и загрузить artifact `cv-pdf`, внутри которого находится `main.pdf`.
