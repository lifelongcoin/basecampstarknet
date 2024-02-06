// move_semantics6.cairo
// Execute `starklings hint move_semantics6` or use the `hint` watch subcommand for a hint.
// You can't change anything except adding or removing references.

// I AM NOT DONE

use debug::PrintTrait;

#[derive(Drop)]
struct Number {
    value: u32,
}

fn main() {
    let mut number = Number { value: 1111111 };

    get_value(@number.value); // Pass a snapshot of the value field of `number`.
    set_value(&mut number); // Pass a mutable reference to `number`.
}

// Should not take ownership and not modify the variable passed.
fn get_value(number: @u32) {
    number.print(); // Print the value directly.
}

// Should take ownership
fn set_value(number: &mut Number) {
    let value = 2222222;
    number.value = value; // Modify the value of `number`.
    number.value.print(); // Print the modified value.
}
