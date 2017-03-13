# mojo-orepan2

Simple Mojolicious::Lite application to serve a [OrePAN2](https://metacpan.org/pod/OrePAN2) repository with support for a PAUSE-like upload interface.

mojo-orepan2 can be used as the singular mirror for cpanm as it will either serve modules that it knows about **or** fetch them from the CPAN, add them to the OrePAN repository and serve the module once it's been saved. This behaviour can be optionally disabled with an environment flag.

## Usage

```
# Start the server and point to repo
export OREPAN_ROOT=/var/local/orepan
./mojo-orepan2

# mojo-orepan2 will fetch and cache modules from a CPAN mirror if the module
# isn't present. This defaults to MetaCPAN by default but can be overwritten.
export OREPAN_PASSTHRU=http://cpan.cpantesters.org
./mojo-orepan2

# If you don't want the pass-through behaviour
export OREPAN_NO_PASSTHRU=1
./mojo-orepan2

# Using cpanm
cpanm --mirror http://localhost:3000 My::Module
PERL_CPANM_OPT="--mirror http://localhost:3000" cpanm My::Module

# Using carton
PERL_CARTON_MIRROR="http://localhost:3000" carton install
```

This project is largely for me to use in the [Minilla](https://metacpan.org/pod/Minilla#release.pause_config) workflow as OrePAN2::Server doesn't seem to be maintained much anymore and tests for the version in CPAN are failing.

## Uploading

```
# .pause
upload_uri http://localhost:3000/upload
user ccakes
password doesnt-matter
```

mojo-orepan2 doesn't support any auth mechanism however `cpan-upload` requires the fields be present. `user` is used as the AUTHOR.

## Using with Docker

```
docker build -t orepan .
docker run -d -p 3000:3000 -v /path/to/orepan-root:/darkpan orepan
```
