use std::sync::{Arc, Mutex};
use std::thread;
use std::time::Duration;

fn main() {
    //arc keeps the internal reference cont safe
    //mutex allows passage of mutable data with locking mechaanism
    let data = Arc::new(Mutex::new(vec![1,2,3]));

    for i in 0..3 {
        let data = data.clone();
        thread::spawn(move || {
            let mut data = data.lock().unwrap();
            data[0] += i;
        });
    }

    thread::sleep(Duration::from_millis(50));
}
