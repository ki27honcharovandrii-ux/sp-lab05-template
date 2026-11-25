// Мертвий лог: уламок коду творців, який не компілюється.
//
// Рівень 1 — виправ src/level1_ownership.rs.
// Рівень 2 (варіант B) — розкоментуй `mod level2_lifetimes;`, і компілятор покаже E0106.
// Рівень 3 (варіант B) — розкоментуй `mod level3_refactor;` і виклик `measure()` у main.
mod level1_ownership;
// mod level2_lifetimes;
// mod level3_refactor;

fn main() {
    let fragment = String::from("b7-sublevel-3 :: 50.4501N 30.5234E");
    println!("{}", level1_ownership::decode_fragment(fragment));
    // level3_refactor::measure();
}
