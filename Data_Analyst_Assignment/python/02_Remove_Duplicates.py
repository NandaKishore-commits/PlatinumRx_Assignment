def remove_duplicates(text: str) -> str:
    result = ""
    for char in text:
        if char not in result:
            result += char
    return result


if __name__ == "__main__":
    user_input = input("Enter string: ")
    print("Output:", remove_duplicates(user_input))