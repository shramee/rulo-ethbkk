use dojo_starter::models::{Rule, Block, Behaviour};
use starknet::ContractAddress;

// Mechanics editing interface
// @TODO implement this later
#[starknet::interface]
trait ICRUDMechanics<T> {
    fn get_rules(self: @T, block: felt252) -> Array<Rule>;
    fn add_rule(ref self: T, block: felt252, behaviour: felt252);
    fn get_behaviour(self: @T, id: felt252) -> Behaviour;
    fn add_behaviour(ref self: T, id: felt252, call: (ContractAddress, felt252));
}

#[starknet::interface]
trait IEngine<T> {
    fn iterate(ref self: T, blocks: Array<Block>);
    fn iterate_get(self: @T, blocks: Array<Block>) -> Array<Block>;
}

#[dojo::contract]
pub mod actions {
    use super::{IActions, Direction, Position, next_position};
    use starknet::{ContractAddress, get_caller_address};
    use dojo::model::{ModelStorage, ModelValueStorage};
    use dojo::event::EventStorage;


    #[generate_trait]
    impl InternalImpl of InternalTrait {
        /// Use the default namespace "dojo_starter". This function is handy since the ByteArray
        /// can't be const.
        fn world_default(self: @ContractState) -> dojo::world::WorldStorage {
            self.world(@"dojo_starter");
        }
    }
}

// Define function like this:
fn next_position(mut position: Position, direction: Direction) -> Position {
    match direction {
        Direction::None => { return position; },
        Direction::Left => { position.vec.x -= 1; },
        Direction::Right => { position.vec.x += 1; },
        Direction::Up => { position.vec.y -= 1; },
        Direction::Down => { position.vec.y += 1; },
    };
    position
}
