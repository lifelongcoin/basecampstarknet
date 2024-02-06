// move_semantics1.cairo
// Execute `starklings hint move_semantics1` or use the `hint` watch subcommand for a hint.



use array::{ArrayTrait, Array};
use array::ArrayTCloneImpl;
use array::SpanTrait;
use debug::PrintTrait;
use clone::Clone;

fn main() {
    let arr0 = ArrayTrait::new();

    let mut arr1 = fill_arr(arr0);

    // This is just a print statement for arrays.
    arr1.clone().print();

    // We've ensured that arr1 has been mutable borrowed in fill_arr,
    // so we can safely modify it here without directly changing this line.
    arr1.append(88);

    arr1.print();
}

fn fill_arr(mut arr: Array<felt252>) -> Array<felt252> {
    arr.append(22);
    arr.append(44);
    arr.append(66);

    arr
}
