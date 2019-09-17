package Pod::Weaver::Plugin::PERLANCAR::SortSections;

# DATE
# VERSION

use 5.010001;
use Moose;

with 'Pod::Weaver::Role::Finalizer';
with 'Pod::Weaver::Role::SortSections';

use namespace::autoclean;

sub finalize_document {
    my ($self, $document, $input) = @_;

    $self->sort_sections(
        $document,
        [
            # preamble
            'NAME',
            'SPECIFICATION VERSION',
            'VERSION',
            'SYNOPSIS',

            # main content
            'DESCRIPTION',

            # Bencher::Scenario::*
            'BENCHMARKED MODULES',
            'BENCHMARK PARTICIPANTS',
            'BENCHMARK DATASETS',
            'SAMPLE BENCHMARK RESULTS',

            # everything else that are uncategorized go here
            sub { 1 },

            # reference section
            'FUNCTIONS',
            'ATTRIBUTES',
            'METHODS',

            # reference section (CLI)
            'SUBCOMMANDS',
            'OPTIONS',

            # other content (CLI)
            'COMPLETION',

            # FAQ (after all content & references)
            'FAQ',
            'FAQS',

            # links/pointers (CLI)
            'CONFIGURATION FILE',
            'CONFIGURATION FILES',
            'ENVIRONMENT',
            'ENVIRONMENT VARIABLES',
            'FILES',

            # todos
            'TODO',
            'TODOS',

            # links/pointers/extra information
            'HISTORY',
            'HOMEPAGE',
            'SOURCE',
            qr/^.+'S BUGS$/i, # in a forked module, i put the original module's BUGS in ORIGMODULE'S BUGS
            'BUGS',
            'SEE ALSO',

            # author & copyright
            qr/^.+'S AUTHORS?$/i, # in a forked module, i put the original module's AUTHOR in ORIGMODULE'S AUTHOR
            qr/^AUTHORS?/,
            qr/^.+'S COPYRIGHT( AND LICENSE)?$/i, # in a forked module, i put the original module's COPYRIGHT in ORIGMODULE'S COPYRIGHT
            'COPYRIGHT AND LICENSE',
            'COPYRIGHT',
        ],
    );
}

__PACKAGE__->meta->make_immutable;
1;
# ABSTRACT: Sort POD sections like PERLANCAR

=for Pod::Coverage ^(finalize_document)$

=head1 SYNOPSIS

In your F<weaver.ini>:

 [-PERLANCAR::SortSections]


=head1 SEE ALSO

L<Pod::Weaver::Plugin::SortSections>, the generic/configurable version

L<Pod::Weaver::Role::SortSections>
