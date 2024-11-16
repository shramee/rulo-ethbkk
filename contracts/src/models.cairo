use starknet::ContractAddress;

#[derive(Copy, Drop, Serde, Debug, Introspect)]
#[dojo::model]
pub struct Behaviour {
    #[key]
    pub id: felt252,
    pub call: (ContractAddress, felt252),
}

#[derive(Copy, Drop, Serde, Debug)]
#[dojo::model]
pub struct Rule {
    #[key]
    pub block: felt252,
    pub behaviours: Array<felt252>, // behavior ids
}

#[derive(Copy, Drop, Serde, Debug)]
pub struct Block {
    pub pos: Vec2,
    pub name: felt252,
    pub owner: ContractAddress,
}

#[derive(Copy, Drop, Serde, IntrospectPacked, Debug)]
pub struct Vec2 {
    pub x: u32,
    pub y: u32
}
