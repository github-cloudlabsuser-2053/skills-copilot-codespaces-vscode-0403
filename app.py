def calculator():
    """
    A simple calculator function that allows the user to perform basic arithmetic operations.

    The user can select one of the following operations:
    1. Addition
    2. Subtraction
    3. Multiplication
    4. Division
    5. Percentage

    The function prompts the user to input their choice of operation and two numbers.
    It then performs the selected operation and displays the result.

    Features:
    - Handles division by zero with an appropriate error message.
    - Validates user input for operation choice.

    Usage:
    Call the `calculator()` function to start the interactive calculator.

    Returns:
    None
    """
    print("Select operation:")
    print("1. Add")
    print("2. Subtract")
    print("3. Multiply")
    print("4. Divide")
    print("5. Percentage")

    choice = input("Enter choice (1/2/3/4/5): ")

    if choice in ['1', '2', '3', '4', '5']:
        num1 = float(input("Enter first number: "))
        num2 = float(input("Enter second number: "))

        if choice == '1':
            print(f"The result is: {num1 + num2}")
        elif choice == '2':
            print(f"The result is: {num1 - num2}")
        elif choice == '3':
            print(f"The result is: {num1 * num2}")
        elif choice == '4':
            if num2 != 0:
                print(f"The result is: {num1 / num2}")
            else:
                print("Error! Division by zero.")
        elif choice == '5':
            if num2 != 0:
                print(f"The result is: {(num1 / num2) * 100}%")
            else:
                print("Error! Division by zero.")
    else:
        print("Invalid input")

if __name__ == "__main__":
    calculator()