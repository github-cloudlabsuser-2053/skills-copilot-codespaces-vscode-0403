// Function to perform the calculation
function calculate(num1, num2, operator) {
    switch (operator) {
        case '+':
            return num1 + num2;
        case '-':
            return num1 - num2;
        case '*':
            return num1 * num2;
        case '/':
            if (num2 === 0) {
                return "Error: Division by zero is not allowed.";
            }
            return num1 / num2;
        default:
            return "Error: Invalid operator.";
    }
}

// Main function to run the calculator
function runCalculator() {
    console.log("Welcome to the Calculator!");

    // Get user input
    const num1 = parseFloat(prompt("Enter the first number:"));
    const operator = prompt("Enter an operator (+, -, *, /):");
    const num2 = parseFloat(prompt("Enter the second number:"));

    // Perform the calculation
    const result = calculate(num1, num2, operator);

    // Display the result
    console.log(`Result: ${result}`);
}

// Run the calculator
runCalculator();