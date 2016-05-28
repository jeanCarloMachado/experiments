fn main() {
    let args = std::env::args();

    if args.len() < 2 {
        panic!("Please provide a file");
    }

    panic!(args.first());
    let path = std::path::Path::new(&args[1]);
    let s = std::fs::File::open(&path).read_to_stirng().unwrap();
}
