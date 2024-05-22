import f90nml

FILEPATH = "./sample.nml"
VALUES = {
    "namelist_group1": {
        "variable1": 42,
        "variable2": 3.14,
        "variable3": "hello",
    },
    "namelist_group2": {
        "variableA": False,
        "variableB": [1, 2, 3],
    },
}


def check_namelist():
    try:
        nml = f90nml.read(FILEPATH)
    except Exception as e:
        print(f"Error reading namelist file: {e}")
        return False

    all_tests_passed = True

    for group, variables in VALUES.items():
        if group not in nml:
            print(f"Group {group} not found in the namelist file.")
            all_tests_passed = False
            continue

        for var, expected_value in variables.items():
            if var not in nml[group]:
                print(f"Variable {var} not found in group {group}.")
                all_tests_passed = False
                continue

            actual_value = nml[group][var]
            if actual_value != expected_value:
                print(
                    f"Value mismatch for {group}.{var}: "
                    f"expected {expected_value}, got {actual_value}"
                )
                all_tests_passed = False
            else:
                print(f"Value match for {group}.{var}: {expected_value}")

    return all_tests_passed


if check_namelist():
    print("All tests passed")
else:
    print("Some tests failed")
