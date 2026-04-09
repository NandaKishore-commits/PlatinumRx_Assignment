def convert_minutes(minutes: int) -> str:
    if minutes < 0:
        return "Minutes cannot be negative"

    hours = minutes // 60
    remaining = minutes % 60

    if hours == 0:
        return f"{remaining} minutes"
    if remaining == 0:
        return f"{hours} hrs"

    return f"{hours} hrs {remaining} minutes"


if __name__ == "__main__":
    user_input = input("Enter minutes: ")
    
    try:
        minutes = int(user_input)
        result = convert_minutes(minutes)
        print("Output:", result)
    except ValueError:
        print("Invalid input! Please enter a number.")