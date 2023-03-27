public with sharing class Dog extends AbstractPet {
    public Dog(String name) {
        super(name);
    }

    void showEnthusiasm() {
        System.debug('wag tail');
        System.debug('zoomiiieeessss');
    }

    void talk() {
        System.debug('woof');
    }
}