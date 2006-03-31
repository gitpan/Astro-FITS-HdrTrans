# -*-perl-*-

package Astro::FITS::HdrTrans::MICHELLE;

=head1 NAME

Astro::FITS::HdrTrans::MICHELLE - UKIRT Michelle translations

=head1 SYNOPSIS

  use Astro::FITS::HdrTrans::MICHELLE;

  %gen = Astro::FITS::HdrTrans::MICHELLE->translate_from_FITS( %hdr );

=head1 DESCRIPTION

This class provides a generic set of translations that are specific to
the MICHELLE camera and spectrometer of the United Kingdom Infrared
Telescope.

=cut

use 5.006;
use warnings;
use strict;
use Carp;

# Inherit from UKIRT
# Inherit from FITS to get X_BASE and Y_BASE
# UKIRTNew must come first because of DATE-OBS handling
use base qw/ Astro::FITS::HdrTrans::UKIRTNew
	     Astro::FITS::HdrTrans::FITS
	     /;

use vars qw/ $VERSION /;

$VERSION = sprintf("%d.%03d", q$Revision: 1.19 $ =~ /(\d+)\.(\d+)/);

# for a constant mapping, there is no FITS header, just a generic
# header that is constant
my %CONST_MAP = (

		);

# unit mapping implies that the value propogates directly
# to the output with only a keyword name change

my %UNIT_MAP = (
		# Michelle Specific
		CHOP_ANGLE           => "CHPANGLE",
		CHOP_THROW           => "CHPTHROW",
		GRATING_DISPERSION   => "GRATDISP",
		GRATING_NAME         => "GRATNAME",
		GRATING_ORDER        => "GRATORD",
		GRATING_WAVELENGTH   => "GRATPOS",
		SAMPLING             => "SAMPLING",
		SLIT_ANGLE           => "SLITANG",
		# CGS4 compatible
		NSCAN_POSITIONS      => "DETNINCR",
		SCAN_INCREMENT       => "DETINCR",
		# UIST compatible
		DETECTOR_READ_TYPE   => "DET_MODE",
		NUMBER_OF_READS      => "NREADS",
		POLARIMETRY          => "POLARISE",
		SLIT_NAME            => "SLITNAME",
		OBSERVATION_MODE     => "INSTMODE",
		# UIST + WFCAM compatible
		EXPOSURE_TIME        => "EXP_TIME",
		# UFTI + IRCAM compatible
		SPEED_GAIN           => "SPD_GAIN",
		# CGS4 + UIST + WFCAM
		CONFIGURATION_INDEX  => 'CNFINDEX',
	       );


# Create the translation methods
__PACKAGE__->_generate_lookup_methods( \%CONST_MAP, \%UNIT_MAP );

=head1 METHODS

=over 4

=item B<this_instrument>

The name of the instrument required to match (case insensitively)
against the INSTRUME/INSTRUMENT keyword to allow this class to
translate the specified headers. Called by the default
C<can_translate> method.

  $inst = $class->this_instrument();

Returns "MICHELLE".

=cut

sub this_instrument {
  return "MICHELLE";
}

=back

=head1 REVISION

 $Id: MICHELLE.pm,v 1.19 2005/04/06 03:42:10 timj Exp $

=head1 SEE ALSO

C<Astro::FITS::HdrTrans>, C<Astro::FITS::HdrTrans::UKIRT>.

=head1 AUTHOR

Brad Cavanagh E<lt>b.cavanagh@jach.hawaii.eduE<gt>,
Tim Jenness E<lt>t.jenness@jach.hawaii.eduE<gt>.

=head1 COPYRIGHT

Copyright (C) 2003-2005 Particle Physics and Astronomy Research Council.
All Rights Reserved.

This program is free software; you can redistribute it and/or modify it under
the terms of the GNU General Public License as published by the Free Software
Foundation; either version 2 of the License, or (at your option) any later
version.

This program is distributed in the hope that it will be useful,but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with
this program; if not, write to the Free Software Foundation, Inc., 59 Temple
Place,Suite 330, Boston, MA  02111-1307, USA

=cut

1;
