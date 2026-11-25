// Рівень 3 (варіант B). Компілюється, але «втік» від конфліктів через зайві `.clone()`.
// Прибери зайві копії, працюючи з позиками, і порівняй час до й після (`cargo run --release`).
use std::time::Instant;

pub fn decode_all(fragments: Vec<String>) -> Vec<String> {
    let mut result = Vec::with_capacity(fragments.len());
    for f in &fragments {
        let up = f.to_uppercase();
        result.push(up);
    }
    result
}

pub fn measure() {
    let fragments: Vec<String> = (0..50_000).map(|i| format!("fragment-{i}")).collect();
    let t = Instant::now();
    let decoded = decode_all(fragments);
    println!("decode_all: {} фрагментів за {:?}", decoded.len(), t.elapsed());
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn decode_all_keeps_order_and_case() {
        let out = decode_all(vec![String::from("a1"), String::from("b2")]);
        assert_eq!(out, vec![String::from("A1"), String::from("B2")]);
    }
}