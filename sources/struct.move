module MyAddr::Person{
    use std::debug;

    struct Empty {}

    struct Person has drop {
        id:u64,
        age:u8,
        build_in_bear:bool
    }

    struct Class<t1, t2> {
        quality:t1,
        learning:t2
    }

    public fun new_Person(id:u64, age:u8, bib:bool) :Person {
        return Person{id, age, build_in_bear:bib}
    }

    public fun get_id(person:Person) :u64 {
        return person.id
    }

    #[test(account = @0x1)]
    public entry fun script_fn() {
        let person = MyAddr::Person::new_Person(5000, 23, false);

        let id = MyAddr::Person::get_id(person);
        
        debug::print(&id);
    }
}