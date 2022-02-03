# Install `puppet-lint` using puppet
package { 'puppet-lint':
  ensure => '2.5.0',
  prover => 'gem',
}
