package Xymon::Server;
use strict;

BEGIN {
    use Exporter ();
    use vars qw($VERSION @ISA @EXPORT @EXPORT_OK %EXPORT_TAGS);
    $VERSION     = '0.02';
    @ISA         = qw(Exporter);
    #Give a hoot don't pollute, do not export more than needed by default
    @EXPORT      = qw();
    @EXPORT_OK   = qw();
    %EXPORT_TAGS = ();
}


#################### subroutine header end ####################


sub new
{
    my ($class, $parameters) = @_;

    my $self = bless ({}, ref ($class) || $class);


    $self->{'HOME'} = $parameters->{HOME};

	my $fh;
	open($fh, "<",$self->{HOME}."/etc/hobbitserver.cfg");
	while(<$fh>) {
		chomp;
		if(!m/^#/ && m/\w+/) {
			s/\"//g;
			s/\#.*$//g;
			my @fields = (split(/=|\s+/));
			my $field = shift @fields;

			if( @fields > 1 ) {
				$self->{$field} = \@fields;
			} else {
				$self->{$field} = $fields[0];
			}

		}
	}

    return $self;
}



#################### main pod documentation begin ###################
## Below is the stub of documentation for your module. 
## You better edit it!


=head1 NAME

Xymon::Server - Xymon Server Interface

=head1 SYNOPSIS

  use Xymon::Server;

  my $server = Xymon::Server->({ HOME => '/home/hobbit/server' });

  print $server->{BBPORT};




=head1 DESCRIPTION

Provides a base interface for retriving configuration variables from
the hobbit server (taken from hobbitserver.cfg).


=head1 METHODS

Xymon::Server->hobbitserver();

Returns a hash of configuration items from hobbitserver.cfg;


=head1 BUGS



=head1 SUPPORT



=head1 AUTHOR

    David Peters
    CPAN ID: DAVIDP
    http://www.electronf.com

=head1 COPYRIGHT

This program is free software; you can redistribute
it and/or modify it under the same terms as Perl itself.

The full text of the license can be found in the
LICENSE file included with this module.


=head1 SEE ALSO

perl(1).

=cut

#################### main pod documentation end ###################


1;
# The preceding line will help the module return a true value

