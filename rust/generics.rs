use std::ops::Mul;

trait HasArea<T> {
    fn area(&self)->T;
}

struct Square<T> {
    x: T,
    y: T,
    side: T,
}

impl<T> HasArea<T> for Square<T>
    where T: Mul<Output=T> + Copy {
        fn area(&self) -> T {
            self.y * self.x
        }
}

fn main() {
    let s = Square {
        x: 3.0f64,
        y: 1.0f64,
        side: 3.0f64,
    };

    println!("Area of s: {}",s.area());
}
