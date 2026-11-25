// Мертвий лог: уламок коду творців, який не компілюється.
//
// Рівень 1 — виправ src/level1_ownership.rs.
// Рівень 2 (варіант B) — розкоментуй `mod level2_lifetimes;`, і компілятор покаже E0106.
// Рівень 3 (варіант B) — розкоментуй `mod level3_refactor;` і виклик `measure()` у main.
mod level1_ownership;
mod level2_lifetimes;
mod level3_refactor;

fn main() {
    let fragment = String::from("sector-a4-hotel");
    println!("{}", level1_ownership::decode_fragment(fragment));
    level3_refactor::measure();
}