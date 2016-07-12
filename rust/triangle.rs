fn triangle(n: i32) -> i32 {
    (0..n+1).fold(0, |sum, i| sum + i)
}

fn main() {
    println!("{}",triangle(10));
}
