class test {
  if ! $::test_variable {
    $test_variable = 'Hello World'
  }
  notice ($::test_variable)
}