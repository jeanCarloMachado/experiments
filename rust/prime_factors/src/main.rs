fn prime_factors(mut num: i64) -> Vec<i64> {
    let mut result = vec![];
    let mut i  = 2;
    while num > 1 {
        while num % i == 0 {
            result.push(i);
            num /= i;
        }
        i +=1;
    }

    result
}

#[test]
fn prime_factors_of_two() {
    assert_eq!(prime_factors(2), [2]);
}

#[test]
fn prime_factors_of_tree() {
    assert_eq!(prime_factors(3), [3]);
}

#[test]
fn prime_factors_of_four() {
    assert_eq!(prime_factors(4), [2, 2]);
}

#[test]
fn prime_factors_of_six() {
    assert_eq!(prime_factors(6), [2, 3]);
}

#[test]
fn prime_factors_of_nine() {
    assert_eq!(prime_factors(9), [3, 3]);
}

#[test]
fn prime_factors_of_48() {
    assert_eq!(prime_factors(48), [2, 2, 2, 2, 3]);
}

#[test]
fn prime_factors_of_101() {
    assert_eq!(prime_factors(101), [101]);
}

