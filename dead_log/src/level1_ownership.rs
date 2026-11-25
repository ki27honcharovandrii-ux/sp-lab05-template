// Рівень 1. Компілятор відмовляє з E0382: `log` переміщено в `process`, а потім використано
// вдруге. Виправ мінімальною зміною — запозиченням, а не `.clone()`. Сигнатуру
// `decode_fragment` і рядок `format!` з двома підстановками не змінюй.

pub fn decode_fragment(log: String) -> String {
    let decoded = process(log); // log переміщується (move) у process
    format!("{} / оригінал: {}", decoded, log) // помилка: log вже переміщено
}

fn process(s: String) -> String {
    s.to_uppercase()
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn decode_fragment_smoke() {
        let out = decode_fragment(String::from("b7-coords"));
        assert!(out.contains("B7-COORDS"), "немає декодованого фрагмента: {out}");
        assert!(out.contains("b7-coords"), "немає оригінального фрагмента: {out}");
    }
}
