module MyAddr::example{
    use std::debug;
    use std::signer;

    public fun add(num1:u64, num2:u8) :u64 {
        num1+(num2 as u64)
    }

    public fun whilen(num:u64) :u128 {
        let i:u64 = 1;
        let sum:u128 = 0;
        while(num >= i) {
            sum = sum + (i as u128);
            i = i + 1;
        };
        sum
    }

    #[test(account = @0x1)]
    public entry fun whilenex(account: signer) {
        let num:u128 = whilen(8);
        debug::print<u128>(&num);
        debug::print<address>(&signer::address_of(&account));
    }
    
    #[test(account = @0x1)]
    public entry fun addex(account: signer) {
        let num:u64 = add(8, 9);
        debug::print<u64>(&num);
        debug::print<address>(&signer::address_of(&account));
    }

    #[test(account = @MyAddr)]
    public entry fun debugger(account: signer) {
        let num:u8 = 76;
        let addr = signer::address_of(&account);
        debug::print<address>(&addr);
        debug::print<u8>(&num);
    } 
}