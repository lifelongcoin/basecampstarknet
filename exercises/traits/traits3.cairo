// traits3.cairo
//
// The previous exercise showed how to implement a trait for multiple types.
// This exercise shows how you can implement multiple traits for a single type.
// This is useful when you have types that share some common functionality, but
// also have some unique functionality.

// Execute `starklings hint traits3` or use the `hint` watch subcommand for a hint.

// I AM NOT DONE

#[derive(Copy, Drop)]
struct Fish {
    noise: felt252,
    distance: u32,
}

#[derive(Copy, Drop)]
struct Dog {
    noise: felt252,
    distance: u32,
}

trait AnimalTrait {
    fn new() -> Self;
    fn make_noise(&self) -> felt252;
    fn get_distance(&self) -> u32;
}

trait FishTrait {
    fn swim(&mut self);
}

trait DogTrait {
    fn walk(&mut self);
}

impl AnimalTrait for Fish {
    fn new() -> Fish {
        Fish { noise: 'blub', distance: 0 }
    }
    fn make_noise(&self) -> felt252 {
        self.noise
    }
    fn get_distance(&self) -> u32 {
        self.distance
    }
}

impl AnimalTrait for Dog {
    fn new() -> Dog {
        Dog { noise: 'woof', distance: 0 }
    }
    fn make_noise(&self) -> felt252 {
        self.noise
    }
    fn get_distance(&self) -> u32 {
        self.distance
    }
}

impl FishTrait for Fish {
    fn swim(&mut self) {
        self.distance += 1;
    }
}

impl DogTrait for Dog {
    fn walk(&mut self) {
        self.distance += 1;
    }
}

#[test]
fn test_traits3() {
    // Don't modify this test!
    let mut salmon: Fish = AnimalTrait::new();
    salmon.swim();
    assert(salmon.make_noise() == 'blub', 'Wrong noise');
    assert(salmon.get_distance() == 1, 'Wrong distance');

    let mut dog: Dog = AnimalTrait::new();
    dog.walk();
    assert(dog.make_noise() == 'woof', 'Wrong noise');
    assert(dog.get_distance() == 1, 'Wrong distance');
}
