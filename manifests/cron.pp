# == Define: types::cron
#
define types::cron (
  $command,
  $ensure      = 'present',
  $environment = undef,
  $hour        = undef,
  $minute      = undef,
  $month       = undef,
  $monthday    = undef,
  $provider    = undef,
  $special     = undef,
  $target      = undef,
  $user        = undef,
  $weekday     = undef,
  $before      = undef,
  $notify      = undef,
  $require     = undef,
  $subscribe   = undef,
  $tag         = undef,
) {

  # validate params
  validate_re($ensure, '^(present)|(absent)$',
    "types::cron::${name}::ensure is invalid and does not match the regex.")

  cron { $name:
    ensure      => $ensure,
    command     => $command,
    environment => $environment,
    hour        => $hour,
    minute      => $minute,
    month       => $month,
    monthday    => $monthday,
    provider    => $provider,
    special     => $special,
    target      => $target,
    user        => $user,
    weekday     => $weekday,
    before      => $before,
    notify      => $notify,
    require     => $require,
    subscribe   => $subscribe,
    tag         => $tag,
  }
}
