[![Build Status](http://jenkins.sonata-nfv.eu/buildStatus/icon?job=son-gkeeper)](http://jenkins.sonata-nfv.eu/job/son-gkeeper)

# SON-GKEEPER
This is [SONATA](http://www.sonata-nfv.eu)'s Service Platform Gatekeeper's repository.

The Gatekeeper is the component that implements all the **Northbound Interface** (NBI) of the Servive Platform.
 
This NBI provides systems like the [son-push](http://github.com/sonata-nfv/son-push), [son-gui](http://github.com/sonata-nfv/son-gui) and [son-bss](http://github.com/sonata-nfv/son-bss) access to the **Service Platform**, for features like:

 * **accepting new developers**' to be part of the contributors of new developed services;
 * **accepting new services**, in the **package format**, to be deployed in the platform;
 * **validating submited packages**, both in terms of file format and developer submitting the package;
 * **accepting new service instance requests** from customers interested in instantiating a service;
 * **following a service performance** through automatically monitoring each on-boarded service or function;
 * etc..

## Development
This section details what is needed for developing the Gatekeeper.

This repository is organized by **micro-service**.

Micro-services currently implemented are the following:

1. [`son-gtkapi`](https://github.com/sonata-nfv/son-gkeeper/tree/master/son-gtkapi): the only 'door' to the Gatekeeper, where the API is exposed;
1. [`son-gtkpkg`](https://github.com/sonata-nfv/son-gkeeper/tree/master/son-gtkpkg): where all Packages features are implemented;
1. [`son-gtksrv`](https://github.com/sonata-nfv/son-gkeeper/tree/master/son-gtksrv): where all Services features are implemented;
1. [`son-gtkfnct`](https://github.com/sonata-nfv/son-gkeeper/tree/master/son-gtkfnct): where all Functions features are implemented;
1. [`son-gtkvim`](https://github.com/sonata-nfv/son-gkeeper/tree/master/son-gtkvim): where all Vims features are implemented;
1. [`son-gtkrec`](https://github.com/sonata-nfv/son-gkeeper/tree/master/son-gtkrec): where all Records§ features are implemented;

The remaining micro-services ([`son-gtkusr`](https://github.com/sonata-nfv/son-gkeeper/tree/master/son-gtkusr), [`son-gtklic`](https://github.com/sonata-nfv/son-gkeeper/tree/master/son-gtklic) and [`son-gtkkpi`](https://github.com/sonata-nfv/son-gkeeper/tree/master/son-gtkkpi), and eventually others), will be implemented in the course of the project.

### Building
Describe briefly how to build the software.

### Dependencies
Name all the dependencies needed by the software, including version, license (!), and a link. For example

* [`activerecord`](https://github.com/rails/rails/tree/master/activerecord) >=5.0.0 (MIT)
* [`addressable`](https://github.com/sporkmonger/addressable) >=2.4.0 (Apache 2.0)
* [`bunny`](https://github.com/ruby-amqp/bunny) >=2.4.0 (MIT)
* [`ci_reporter`](https://github.com/ci-reporter/ci_reporter) >=2.0.0 (MIT)
* [`ci_reporter_rspec`](https://github.com/ci-reporter/ci_reporter_rspec) >=1.0.0 (MIT)
* [`foreman`](https://github.com/ddollar/foreman) >=0.82.0 (MIT)
* [`pg`](https://bitbucket.org/ged/ruby-pg/wiki/Home) >=0.18.4 (MIT)
* [`pry`](https://github.com/pry/pry) 0.10.3 (MIT)
* [`puma`](https://github.com/puma/puma) >=3.4.0 (BSD-3-CLAUSE)
* [`rack-parser`](https://github.com/achiu/rack-parser) >=0.7.0 (MIT)
* [`rack-test`](https://github.com/brynary/rack-test) >=0.6.3 (MIT)
* [`rake`](https://github.com/ruby/rake) >=11.2.2 (MIT)
* [`rest-client`](https://github.com/rest-client/rest-client) >=2.0.0 (Apache 2.0)
* [`rspec`](https://github.com/rspec/rspec) >=3.5.0 (MIT)
* [`rspec-core`](https://github.com/rspec/rspec-core) >=3.5.1 (MIT)
* [`rspec-expectations`](https://github.com/rspec/rspec-expectations) >=3.5.0 (MIT)
* [`rspec-its`](https://github.com/rspec/rspec-its) >=1.2.0 (MIT)
* [`rspec-mocks`](https://github.com/rspec/rspec-mocks) >=3.5.0 (MIT)
* [`rspec-support`](https://github.com/rspec/rspec-support) >=3.5.0 (MIT)
* [`rubocop`](https://github.com/bbatsov/rubocop) >=0.41.2 (MIT)
* [`rubocop-checkstyle_formatter`](https://github.com/eitoball/rubocop-checkstyle_formatter) >=0.2.0 MIT()
* [`rubyzip`](https://github.com/rubyzip/rubyzip) >=1.2.0 (BSD-2-CLAUSE)
* [`sinatra`](https://github.com/sinatra/sinatra) >=1.4.7 (MIT)
* [`sinatra-active-model-serializers`](https://github.com/SauloSilva/sinatra-active-model-serializers) 0.2.0 (MIT)
* [`sinatra-activerecord`](https://github.com/SauloSilva/sinatra-activerecord) 2.0.4 (MIT)
* [`sinatra-contrib`](https://github.com/sinatra/sinatra-contrib) >=1.4.7 (MIT)
* [`sinatra-cross_origin`](https://github.com/britg/sinatra-cross_origin) >=0.3.2 (MIT)
* [`sinatra-logger`](https://github.com/kematzy/sinatra-logger) >=0.1.1 (MIT)
* [`webmock`](https://github.com/bblimke/webmock) >=2.1.0 (MIT)

### Contributing
Contributing to the Gatekeeper is really easy. You must:

1. Clone [this repository](http://github.com/sonata-nfv/son-gkeeper);
1. Work on your proposed changes, preferably through submiting [issues](https://github.com/sonata-nfv/son-gkeeper/issues);
1. Submit a Pull Request;
1. Follow/answer related [issues](https://github.com/sonata-nfv/son-gkeeper/issues) (see Feedback-Chanel, below).

## Installation
Installing the Gatekeeper is really easy. You'll need:

1. the [ruby](http://www.ruby-lang.org) programming language: we prefer doing this by using a version manager tool such as [rvm](https://rvm.io) or [rbenv](http://rbenv.org) (we are using version **2.2.3**);
1. in each one of the subfolders, just run:
  1. `bundle install`
  1. please follow each specific folder's instructions on which environment variables to set
1. ...

The installation of this component can be done using the [son-install](https://github.com/sonata-nfv/son-install) script.

## Usage
(if applicable) Describe briefly how to use the software.

## License

#### Useful Links

* Any useful link and brief description. For example:
* http://www.google/ Don't be evil.

---
#### Lead Developers

The following lead developers are responsible for this repository and have admin rights. They can, for example, merge pull requests.

* José Bonnet ([jbonnet](https://github.com/jbonnet))
* Name of lead developer (GitHub-username)

#### Feedback-Chanel

* Mailing list
* [GitHub issues](https://github.com/sonata-nfv/son-gkeeper/issues)
