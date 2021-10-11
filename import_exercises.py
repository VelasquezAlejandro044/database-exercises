# 1 Import and test 3 of the functions from your functions exercise file. Import each function in a different way:

# Run an interactive python session and import the module. Call the is_vowel function using the . syntax.
def is_vowel():
    s = str(input('Enter character'))
    return s in "aeiouAEIOU"

def is_consonant():
    s = str(input('Enter character'))
    return s not in "aeiouAEIOU"
# Create a file named import_exericses.py. Within this file, use from to import the calculate_tip function directly. Call this function with values you choose and print the result.
def calculate_tip(tip_percentage, bill_total):
    if tip_percentage > 0 and tip_percentage < 1:
        return tip_percentage * bill_total
    else:
        return "Can't work under this conditions"
