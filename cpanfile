requires 'perl', '5.10.0';

requires 'OrePAN2';
requires 'Mojolicious';

on 'test' => sub {
  requires 'Test::More', '0.98';
};
