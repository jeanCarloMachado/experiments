extern crate phrases;

use phrases::english::{greetings,farewells};
use phrases::japanese;

fn main() {
    println!("Hello in english {}", greetings::hello());
    println!("goodbye in english {}", farewells::goodbye());

    println!("hello in japanese {}", japanese::hello());
    println!("goodbye in japanese {}", japanese::goodbye());
}
