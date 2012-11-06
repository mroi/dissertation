#!/usr/bin/perl -w

my @list;

while (<>) {
	s/^ //;
	push @list, [ split(/[\t\n]/) ];
}

print <<EOF;
\\lyxformat 413
\\begin_document
\\begin_header
\\textclass tufte-book
\\inputencoding utf8-plain
\\end_header

\\begin_body

\\begin_layout Plain Layout
EOF

for my $row (0 .. $#list) {
	print <<EOF;
\\begin_inset FormulaMacro
\\newcommand{\\$list[$row][0]}{$list[$row][1]}{$list[$row][1]}
\\end_inset
EOF
}

print <<EOF;
\\end_layout

\\end_body
\\end_document
EOF
