#reader(lib "docreader.ss" "scribble")
@require[(lib "manual.ss" "scribble")]
@require[(lib "eval.ss" "scribble")]
@require["guide-utils.ss"]

@title[#:tag "characters"]{Characters (Unicode)}

A Scheme @defterm{character} corresponds to a Unicode @defterm{scalar
value}. Roughly, a scalar value is an unsigned integer whose
representation fits into 21 bits, and that maps to some notion of a
natural-language character or piece of a character. Technically, a
scalar value is a simpler notion that the concept called a
``character'' in the Unicode standard, but it's an approximation that
works well for many purposes. For example, any accented Roman letter
can be represented as a scalar value, as can any Chinese character.

Although each Scheme character corresponds to an integer, the
character datatype is separate from numbers. The
@scheme[char->integer] and @scheme[integer->char] procedures convert
between scalar-value numbers and the corresponding character.

A printable character normally prints as @schemefont["#\\"] followed
by the represented character. An unprintable character normally prints
as @schemefont{#\u} followed by the scalar value as hexdecimal
number. A few characters are printed specially; for example, the space
and linefeed characters print as @scheme[#\space] and
@scheme[#\newline], respectively.

@refdetails["mz:parse-character"]{the syntax of characters}

@examples[
(integer->char 65)
(char->integer #\A)
#\u03BB
(eval:alts #, @schemevalfont["#\\u03BB"] #\u03BB)
(integer->char 17)
(char->integer #\space)
]

The @scheme[display] procedure directly writes a character to the
current output stream, in contrast to the character-constant syntax
used to print a character result.

@examples[
#\A
(display #\A)
]

Scheme provides several classification and conversion procedures on
characters. Beware, however, that conversions on some Unicode
characters work as a human would expect only when they are in a string
(e.g., upcasing ``@elem["\uDF"]'' or downcasing ``@elem["\u03A3"]'').

@examples[
(char-alphabetic? #\A)
(char-numeric? #\0)
(char-whitespace? #\newline)
(char-downcase #\A)
(char-upcase #\uDF)
]

The @scheme[char=?] procedure compares two or more characters, and
@scheme[char-ci=?] compares characters ignoring case. The
@scheme[eqv?] and @scheme[equal?] procedures behave the same as
@scheme[char=?] on characters; use @scheme[char=?] when you want to
more specifically declare that the values being compared are
characters.

@examples[
(char=? #\a #\A)
(char-ci=? #\a #\A)
(eqv? #\a #\A)
]

@refdetails["mz:characters"]{characters and character procedures}
