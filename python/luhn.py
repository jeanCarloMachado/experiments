def digits_of(number):
    return list(map(int, str(number)))

def luhn_checksum(card_number):
    digits = digits_of(card_number)
    odd_digits = digits[-1::-2]
    even_digits = digits[-2::-2]
    total = sum(odd_digits)
    for digit in even_digits:
        total += sum(digits_of(2 * digit))
    return total % 10

def is_luhn_valid(card_number):
    return luhn_checksum(card_number) == 0

def calculate_luhn(partial_card_number): 
    check_digit = luhn_checksum(int(partial_card_number) * 10)   # Append a zero check digit to the partial number and calculate checksum
    return check_digit if check_digit == 0 else 10 - check_digit


result = is_luhn_valid( 56987349363408994915924013822247590575711173866387417527665411573457087566987569714093207249239846201) 
print(result)
