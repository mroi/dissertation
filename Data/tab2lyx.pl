#!/usr/bin/perl -w

my @table;

while (<>) {
	push @table, [ split(/[\t\n]/) ];
}

my $rows = @table - 1;
my $columns = @{$table[0]} - 1;

print <<EOF;
\\lyxformat 544
\\begin_document
\\begin_header
\\textclass tufte-book
\\use_default_options true
\\use_non_tex_fonts true
\\inputencoding utf8-plain
\\end_header

\\begin_body

\\begin_layout Plain Layout
\\begin_inset Tabular

<lyxtabular version="3" rows="$rows" columns="$columns">
<features booktabs="true" tabularvalignment="middle">
EOF

for my $col (1 .. $#{$table[0]}) {
	my $align = $table[0][$col];
	print <<EOF;
<column alignment="$align" valignment="top" width="0pt">
EOF
}

for my $row (1 .. $#table) {
	print "<row>\n";
	for my $col (1 .. $#{$table[0]}) {
		my $align = $table[0][$col];
		my $top = ($table[$row][0] =~ /t/) ? "true" : "false";
		my $bottom = ($table[$row][0] =~ /b/) ? "true" : "false";
		my $content = $table[$row][$col];
		if ($content =~ /^\$/) {
			$content = '\begin_inset Formula ' . $content . "\n\\end_inset";
		}
		print <<EOF;
<cell alignment="$align" valignment="top" topline="$top" bottomline="$bottom" usebox="none">
\\begin_inset Text
\\begin_layout Plain Layout
$content
\\end_layout
\\end_inset
</cell>
EOF
	}
	print "</row>\n";
}

print <<EOF;
</lyxtabular>

\\end_inset
\\end_layout

\\end_body
\\end_document
EOF
