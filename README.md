# mojo-orepan2

Simple Mojolicious::Lite application to serve a [OrePAN2](https://metacpan.org/pod/OrePAN2) repository with support for a PAUSE-like upload interface.

## Usage

```
# Start the server and point to repo
export OREPAN2_PATH=/var/local/orepan
./mojo-orepan2

# mojo-orepan2 will return redirects to a fallback CPAN mirror if the module isn't present. This defaults to MetaCPAN by default but can be overwritten.

export CPAN_MIRROR=http://cpan.cpantesters.org
./mojo-orepan2
```

This project is largely for me to use in the [Minilla](https://metacpan.org/pod/Minilla#release.pause_config) workflow as OrePAN2::Server doesn't seem to be maintained much anymore and tests for the version in CPAN are failing.

## Uploading

```
# .pause
upload_uri http://localhost:3000/upload
user ccakes
password doesnt-matter
```


