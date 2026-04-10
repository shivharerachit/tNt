// Write a program to demonstrate the use of arithmetic, logical, and relational operators.

public class Operators {
    public static void main(String[] args) {
        // Arithmetic Operators
        int a = 10;
        int b = 5;
        System.out.println("Arithmetic Operators:");
        System.out.println("a + b = " + (a + b)); // Addition
        System.out.println("a - b = " + (a - b)); // Subtraction
        System.out.println("a * b = " + (a * b)); // Multiplication
        System.out.println("a / b = " + (a / b)); // Division
        System.out.println("a % b = " + (a % b)); // Modulus

        // Logical Operators
        boolean x = true;
        boolean y = false;
        System.out.println("\nLogical Operators:");
        System.out.println("x && y = " + (x && y)); // Logical AND
        System.out.println("x || y = " + (x || y)); // Logical OR
        System.out.println("!x = " + (!x)); // Logical NOT

        // Relational Operators
        System.out.println("\nRelational Operators:");
        System.out.println("a == b = " + (a == b)); // Equal to
        System.out.println("a != b = " + (a != b)); // Not equal to
        System.out.println("a > b = " + (a > b)); // Greater than
        System.out.println("a < b = " + (a < b)); // Less than
        System.out.println("a >= b = " + (a >= b)); // Greater than or equal to
        System.out.println("a <= b = " + (a <= b)); // Less than or equal to
    }
}