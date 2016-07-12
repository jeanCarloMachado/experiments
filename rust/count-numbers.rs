use std::collections::BTreeMap;
use std::io::BufRead;

fn main() {
    let mut counts = BTreeMap::new();
    let stdin = std::io::stdin();

    for line_or_error in stdin.lock().lines() {
        let line  = line_or_error.unwrap();
        *counts.entry(line).or_insert(0);
    }

    for (line, count) in counts.iter() {
        println!("{} {}", count, line);
    }
}
