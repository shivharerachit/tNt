// Create a class to represent a student with attributes like name, roll number, and marks.
// Implement inheritance to create a "GraduateStudent" class that extends the "Student" class with additional features.
// Demonstrate polymorphism by creating methods with the same name but different parameters in a parent and child class.
// Explain the concept of encapsulation with a suitable example.

import java.util.Scanner;

class Student {
    private String name;
    private int rollNumber;
    private double marks;

    public Student(String name, int rollNumber, double marks) {
        this.name = name;
        this.rollNumber = rollNumber;
        this.marks = marks;
    }

    public String showData() {
        return "Name: " + name + ", Roll Number: " + rollNumber + ", Marks: " + marks;
    }

    public void setData(double marks) {
        this.marks = marks;
    }
}

class GraduateStudent extends Student {
    private boolean placementStatus;
    private String companyName;
    private double salary;
    public GraduateStudent(String name, int rollNumber, double marks, boolean placementStatus, String companyName, double salary) {
        super(name, rollNumber, marks);
        if (placementStatus) {
            this.placementStatus = true;
            this.companyName = companyName;
            this.salary = salary;
        } else {
            this.placementStatus = false;
            this.companyName = "N/A";
            this.salary = 0.0;
        }
    }

    @Override
    public String showData() {
        String placementInfo = placementStatus ? "Placed at " + companyName + " with a salary of " + salary : "Not Placed";
        return super.showData() + ", " + placementInfo;
    }

    public void setData(double marks, boolean placementStatus, String companyName, double salary) {
        super.setData(marks);
        this.placementStatus = placementStatus;
        this.companyName = companyName;
        this.salary = salary;
    }
}

public class Oop {
    public static void main(String[] args) {
        GraduateStudent gSt = new GraduateStudent("Alice", 101, 85.5, true, "TechCorp", 75000);
        System.out.println(gSt.showData());
        gSt.setData(90.0, false, "AnotherCompany", 80000);
        System.out.println(gSt.showData());
    }
}