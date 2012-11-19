if ! $enc_localfile {
  notify {"Using node config from: $enc_localfile":
    stage => 'pre', 
  }
} else {
  notify {"Using node config from: Dashboard":}
}

stage { 'pre':
  before => Stage['main'],
}

notify {"Message: $test_var":}

filebucket { "main":
  server => "puppet",
  path => false,
}

File { backup => "main" }