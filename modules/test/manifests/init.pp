class test () {
  if ! $::test_variable {
    $test_variable = 'Hello World'
  }
  notify {$::test_variable:}
    notify {"I`m ok":}
}