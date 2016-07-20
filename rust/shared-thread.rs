use std::thread;
use std::sync::{Arc, Mutex};
use std::time::Duration;
use std::old_io::timer;

fn main() {
    let buf = Arc::new(Mutex::new(Vec::<String>::new()));
    let res = test(buf);
    println!("{:?}", *res.lock().unwrap());
}

fn test(buf: Arc<Mutex<Vec<String>>>) -> Arc<Mutex<Vec<String>>> {
    let guards: Vec<_> = (0..3).map( |i| {
        let mtx = buf.clone();
        thread::scoped(|| {
            println!("Thread: {}", i);
            let mut res = mtx.lock().unwrap();
            timer::sleep(Duration::seconds(5));
            res.push(format!("thread {}", i));
        });
    }).collect();
    buf
}
