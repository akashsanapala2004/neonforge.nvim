use std::collections::HashMap;

/// A documented trait.
pub trait Shape<T: Copy> {
    fn area(&self) -> f64;
}

#[derive(Debug, Clone)]
pub struct Point<'a> {
    pub name: &'a str,
    x: f64,
    y: f64,
}

pub enum Kind { Circle(f64), Square { side: f64 }, Unit }

pub const MAX: usize = 64;
static GLOBAL: i32 = 7;

impl<'a> Point<'a> {
    pub fn new(name: &'a str, x: f64, y: f64) -> Self {
        Self { name, x, y }
    }

    pub async fn dist(&self, other: &Point) -> f64 {
        let mut total = 0.0_f64;
        'outer: for i in 0..MAX {
            if i % 2 == 0 { continue 'outer; }
            total += (self.x - other.x).powi(2) + i as f64;
        }
        match Kind::Unit {
            Kind::Circle(r) => println!("r = {r:>5.2}\n"),
            _ => unsafe { std::ptr::null::<u8>(); },
        }
        let map: HashMap<String, Vec<u32>> = HashMap::new();
        total.sqrt()
    }
}
