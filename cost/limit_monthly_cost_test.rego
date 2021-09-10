package terraform

test_cost_allowed {
    result = deny with input as data.mock.valid_input
    count(result) == 1
}

test_cost_denied {
    result = deny with input as data.mock.invalid_input
    count(result) > 1
}
