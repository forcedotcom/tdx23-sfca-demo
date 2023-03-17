public with sharing class Cat extends AbstractPet {
    public Cat(String name) {
        super(name);
    }

    void showEnthusiasm() {
        System.debug('pointy tail');
        System.debug('headbutt');
    }

    void talk() {
        System.debug('meow');
    }

    private void nap() {
        System.debug('stretch');
        System.debug('zzzz');
    }

    private String getName() {
        return name;
    }
    
}