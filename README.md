# HackneySslTest

This is a quick test for https://github.com/benoitc/hackney/issues/362 that just outputs the result of calling `:hackney.get("https://s3-us-west-2.amazonaws.com")`. There are compiled escripts that just differ in the version of hackney included (1.6.1, 1.6.3, 1.6.5).

The docker build compiles erlang with the `-DOPENSSL_NO_EC=1` flag set.

```
[hackney-ssl-test]$ docker run ef0a06b00c5b /hackney_ssl_test_161
{:ok, 307, [{"x-amz-id-2", "3rTwhh8+yVgOedE07VlPv8/YJcFjtRG12U1IIand3tHc+6wX/aP4qNvZ/0b+ZCZ7Umjeky+iD4s="}, {"x-amz-request-id", "602432495D860152"}, {"Date", "Tue, 10 Jan 2017 17:03:27 GMT"}, {"Location", "https://aws.amazon.com/s3/"}, {"Content-Length", "0"}, {"Server", "AmazonS3"}], #Reference<0.0.2.243>}

[hackney-ssl-test]$ docker run ef0a06b00c5b /hackney_ssl_test_163
17:03:30.601 [error] SSL: :certify: tls_connection.erl:704:Fatal error: handshake failure - malformed_handshake_data

{:error, {:tls_alert, 'handshake failure'}}

[hackney-ssl-test]$ docker run ef0a06b00c5b /hackney_ssl_test_165
17:03:34.165 [warn]  hackney_ssl: ECC not enabled
{:ok, 307, [{"x-amz-id-2", "YTNrML7VuHFIDWd9u1UMBzvnsnqAz3V+7VtE765c7DVh12UbnfvHX/P0ipEcZulbI/x0SUwOWaw="}, {"x-amz-request-id", "066F4639A5D71A28"}, {"Date", "Tue, 10 Jan 2017 17:03:35 GMT"}, {"Location", "https://aws.amazon.com/s3/"}, {"Content-Length", "0"}, {"Server", "AmazonS3"}], #Reference<0.0.2.246>}
```
