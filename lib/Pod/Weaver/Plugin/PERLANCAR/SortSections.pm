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
            'VERSION',
            'SYNOPSIS',

            # preamble (Bencher::Scenario::*)
            'BENCHMARKED MODULES',
            'BENCHMARK PARTICIPANTS',
            'SAMPLE BENCHMARK RESULTS',

            # main content
            'DESCRIPTION',

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

            # links/pointers (CLI)
            'CONFIGURATION FILE',
            'ENVIRONMENT',
            'FILES',

            # links/pointers
            'HOMEPAGE',
            'SOURCE',
            'BUGS',
            'SEE ALSO',

            # author & copyright
            'AUTHOR',
            'COPYRIGHT AND LICENSE',
        ],
    );
}

__PACKAGE__->meta->make_immutable;
1;
# ABSTRACT: Sort POD sections like PERLANCAR

=head1 SYNOPSIS

In your F<weaver.ini>:

 [-PERLANCAR::SortSections]


=head1 DESCRIPTION



=head1 SEE ALSO

L<Pod::Weaver::Role::SortSections>
