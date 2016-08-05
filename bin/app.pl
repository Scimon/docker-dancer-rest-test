#!/usr/bin/env perl

use Modern::Perl;
use Dancer;

get '/lower/:text' => sub {
    return lc param( 'text' );
};

get '/upper/:text' => sub {
    return uc param( 'text' );
};

dance;
