// Рівень 2 (варіант B). Компілятор не може сам вивести, з яким із двох входів пов'язаний
// результат, і відмовляє з E0106. Додай коректну анотацію часу життя `'a`.

pub fn pick_longer_coordinate(a: &str, b: &str) -> &str {
    if a.len() >= b.len() {
        a
    } else {
        b
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn picks_the_longer_one() {
        assert_eq!(pick_longer_coordinate("50.45N", "30.5234E"), "30.5234E");
    }
}
