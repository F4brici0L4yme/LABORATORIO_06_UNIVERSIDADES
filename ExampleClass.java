/**
 * Esta clase representa un ejemplo simple de una clase en Java.
 * La clase contiene atributos y métodos que pueden ser representados en un diagrama UML.
 */
public class ExampleClass {

    // Atributos de la clase
    private String name;
    private int age;

    /**
     * Constructor que inicializa el nombre y la edad de la persona.
     * 
     * @param name El nombre de la persona.
     * @param age La edad de la persona.
     */
    public ExampleClass(String name, int age) {
        this.name = name;
        this.age = age;
    }

    /**
     * Obtiene el nombre de la persona.
     * 
     * @return El nombre de la persona.
     */
    public String getName() {
        return name;
    }

    /**
     * Establece el nombre de la persona.
     * 
     * @param name El nuevo nombre de la persona.
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * Obtiene la edad de la persona.
     * 
     * @return La edad de la persona.
     */
    public int getAge() {
        return age;
    }

    /**
     * Establece la edad de la persona.
     * 
     * @param age La nueva edad de la persona.
     */
    public void setAge(int age) {
        this.age = age;
    }

    /**
     * Método que devuelve una descripción de la persona.
     * 
     * @return Una cadena que describe a la persona.
     */
    public String describePerson() {
        return "Nombre: " + name + ", Edad: " + age;
    }

    /**
     * Método estático que muestra un saludo general.
     */
    public static void greet() {
        System.out.println("¡Hola desde ExampleClass!");
    }

    public static void main(String[] args) {
        ExampleClass person = new ExampleClass("Juan", 30);
        System.out.println(person.describePerson());
        greet();
    }
}
