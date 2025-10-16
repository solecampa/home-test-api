package examples.users;

import com.intuit.karate.junit5.Karate;

class InventoryRunner {
    
    @Karate.Test
    Karate testInventory() {
        return Karate.run("inventory").relativeTo(getClass());
    }    

}
