fn main() {
    let fib = 4;
    println!("{}", fib_recursive(4));
}

fn fib_recursive<T>(n: T) -> T {
    match n {
        0 | 1 =>  n,
        n => fib_recursive(n - 1) + fib_recursive(n - 2)
    }
}
