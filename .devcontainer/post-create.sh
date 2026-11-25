#!/usr/bin/env bash
# ЗГЕНЕРОВАНО з content/sp/environment/lab05.yml — E11-9, ADR 022.
#
# Цей скрипт навмисно ЗАВЖДИ завершується кодом 0. Його запускає postCreateCommand, а
# postCreateCommand, що впав, ламає створення Codespace — студент бачить лише «щось пішло
# не так» і не має де працювати. Тому кожен крок тут доповідає про себе, але не валить
# простір; справжня перевірка — .devcontainer/verify.sh, і її запускає людина.
set -u

# Утиліти з `tools` — у РОБОЧОМУ просторі. Усередині навчальних контейнерів студент
# ставить їх сам: це частина роботи, а не зручність.
if ! sudo apt-get update \
  || ! sudo apt-get install -y --no-install-recommends git rust-toolchain rustup rustup component add clippy rustup component add rust-analyzer rustup component add rustfmt; then
  printf '%s\n' 'не вдалося поставити частину утиліт — перевір bash .devcontainer/verify.sh' >&2
fi
sudo rm -rf /var/lib/apt/lists/*

# Підказка про квоту — у власному терміналі студента, бо жодного важеля з нашого боку
# немає: простір тарифікується його особистому акаунту, і політики організації на нього
# не поширюються. Друкується при кожному відкритті оболонки, дописується один раз.
grep -qF 'printf '\''%s\n%s\n'\'' '\''Здав роботу? Видали цей простір: https://github.com/codespaces'\'' '\''Сховище витрачає твою квоту, доки простір існує, — навіть зупинений.'\'' # vtfk:quota' "$HOME"/.bashrc 2>/dev/null || printf '%s\n' 'printf '\''%s\n%s\n'\'' '\''Здав роботу? Видали цей простір: https://github.com/codespaces'\'' '\''Сховище витрачає твою квоту, доки простір існує, — навіть зупинений.'\'' # vtfk:quota' >> "$HOME"/.bashrc

# Пам'ятка про здачу — там, де студент її побачить: у власному терміналі, при кожному
# відкритті. `bash <скрипт>`, а не `./<скрипт>`: генератор кладе файли режимом 644.
grep -qF 'printf '\''%s\n%s\n%s\n'\'' '\''ЛР5 · Набір програм, що не компілюються (borrow checker)'\'' '\''Здати роботу:  bash .devcontainer/submit.sh    (або Ctrl+Shift+B)'\'' '\''Стан здач:     Releases цього репозиторію'\'' # vtfk:howto' "$HOME"/.bashrc 2>/dev/null || printf '%s\n' 'printf '\''%s\n%s\n%s\n'\'' '\''ЛР5 · Набір програм, що не компілюються (borrow checker)'\'' '\''Здати роботу:  bash .devcontainer/submit.sh    (або Ctrl+Shift+B)'\'' '\''Стан здач:     Releases цього репозиторію'\'' # vtfk:howto' >> "$HOME"/.bashrc

# Пасхалка середовища. Не критична: якщо не вдалася — простір усе одно робочий.
sudo mkdir -p "$(dirname '/work/.sid/E0382.txt')" && sudo chown "$(id -u):$(id -g)" "$(dirname '/work/.sid/E0382.txt')"
printf '%s\n' 'error[E0382]: borrow of moved value: `creators`
 --> technova/b7.rs:-3:101
  |
  |     let internship = technova.take(creators);   // value moved here
  |     ...
  = note: значення переміщено у фургон, але власник не змінився. Позичене повертають.
  = note: шлагбаум піднято для одного: `&runner`. // Прикордонник
' > '/work/.sid/E0382.txt' || printf '%s\n' 'error[E0382]: borrow of moved value: `creators`
 --> technova/b7.rs:-3:101
  |
  |     let internship = technova.take(creators);   // value moved here
  |     ...
  = note: значення переміщено у фургон, але власник не змінився. Позичене повертають.
  = note: шлагбаум піднято для одного: `&runner`. // Прикордонник
' | sudo tee '/work/.sid/E0382.txt' >/dev/null

printf '\n%s\n' 'Простір готовий. Перевір середовище: bash .devcontainer/verify.sh'
exit 0
