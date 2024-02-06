// dict3.cairo
// Custom data structure using dicts
// Using Felt252Dict in structs allow us to simulate mutable data structures
// In this exercise we have a struct Team where a Felt252Dict maps the name of a player to its level and keeps track of
// the number of player.
// Using the methods set and get from the Felt252DictTrait, implement the required functions to interact with the team
// Make me compile and pass the test!
// Execute `starklings hint dict3` or use the `hint` watch subcommand for a hint.





#[derive(Destruct)]
struct Team {
  level: Felt252Dict<usize>,
  players_count: usize 
}

#[generate_trait]
impl TeamImpl of TeamTrait {
    fn new() -> Team {
        Team { level: Felt252Dict::new(), players_count: 0 }
    }

    fn get_level(ref self: Team, name: felt252) -> usize {
        match self.level.get(name) 
            Some(&level) => level,
            None => 0, // Return 0 if the player is not found
        
    }

    fn add_player(ref mut self: Team, name: felt252, level: usize) -> () {

        if let Some(_) = self.level.set(name, level) {
            self.players_count += 1; // Increment the players count if the player is added successfully
        }
    }

    fn level_up(ref mut self: Team, name: felt252) {
        if let Some(current_level) = self.level.get_mut(name) {
            *current_level += 1; // Increment the level if the player exists
        }

    }

    fn players_count(ref self: @Team) -> usize {
       self.players_count 
    }
}



#[test]
#[available_gas(200000)]
fn test_add_player() {

    let mut team = TeamTrait::new();
    team.add_player('bob', 10);
    team.add_player('alice', 20);

    assert(team.players_count == 2, 'Wrong number of player');
    assert(team.get_level('bob') == 10, 'Wrong level');
    assert(team.get_level('alice') == 20, 'Wrong level');
}

#[test]
#[available_gas(200000)]
fn test_level_up() {

    let mut team = TeamTrait::new();
    team.add_player('bobby',10);
    team.level_up('bobby');

    assert(team.level.get('bobby') == 11, 'Wrong level');
}
