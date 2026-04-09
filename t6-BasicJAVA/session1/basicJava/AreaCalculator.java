// Write a program to calculate the area of a circle, rectangle, or triangle based on user input.
import java.util.Scanner;

public class AreaCalculator {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);

		System.out.println("Choose shape to calculate area:");
		System.out.println("1. Circle");
		System.out.println("2. Rectangle");
		System.out.println("3. Triangle");
		System.out.print("Enter your choice (1-3): ");

		int choice = sc.nextInt();
		double area;

		switch (choice) {
			case 1:
				System.out.print("Enter radius: ");
				double radius = sc.nextDouble();
				area = Math.PI * radius * radius;
				System.out.println("Area of circle: " + area);
				break;

			case 2:
				System.out.print("Enter length: ");
				double length = sc.nextDouble();
				System.out.print("Enter width: ");
				double width = sc.nextDouble();
				area = length * width;
				System.out.println("Area of rectangle: " + area);
				break;

			case 3:
				System.out.print("Enter base: ");
				double base = sc.nextDouble();
				System.out.print("Enter height: ");
				double height = sc.nextDouble();
				area = 0.5 * base * height;
				System.out.println("Area of triangle: " + area);
				break;

			default:
				System.out.println("Invalid choice.");
		}

		sc.close();
	}
}