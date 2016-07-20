fn main() {
    let fib: i32 = 4;
    println!("{}", fib_recursive(4));
}

fn fib_recursive(n: i32) -> i32 {
    match n {
        0 | 1 =>  n,
        n => fib_recursive(n - 1) + fib_recursive(n - 2)
    }
}
