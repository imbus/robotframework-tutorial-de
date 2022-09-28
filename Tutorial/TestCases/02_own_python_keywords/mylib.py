### Just a Python function will be a Keyword on Robot side

def check_string_length(string: str, length: int):
    if len(string) != length:
        raise ValueError(f"Length of '{string}' is '{len(string)}' but should be '{length}'")