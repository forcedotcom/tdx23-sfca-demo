public with sharing abstract class AbstractPet {
    protected String name;
    public AbstractPet(String name) {
        this.name = name;
    }

    abstract void showEnthusiasm();

    abstract void talk();
}