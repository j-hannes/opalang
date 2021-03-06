/*
    Copyright © 2011 MLstate

    This file is part of OPA.

    OPA is free software: you can redistribute it and/or modify it under the
    terms of the GNU Affero General Public License, version 3, as published by
    the Free Software Foundation.

    OPA is distributed in the hope that it will be useful, but WITHOUT ANY
    WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
    FOR A PARTICULAR PURPOSE.  See the GNU Affero General Public License for
    more details.

    You should have received a copy of the GNU Affero General Public License
    along with OPA.  If not, see <http://www.gnu.org/licenses/>.
*/

/*
POSIX characters classes.
Remember that these classes must depend of the localization of the user.
That's why I only included the first 128 characters.

TODO if we do localization : Equivalence classes. See the POSIX doc.
[=e=] ----> parser r=[eéèêë...] -> r

Class           Meaning
[:alnum:]       Alphanumeric characters.
[:alpha:]       Alphabetic characters.
[:blank:]       Space and TAB characters.
[:cntrl:]       Control characters.
[:digit:]       Numeric characters.
[:graph:]       Characters that are both printable and visible. (A space is printable but not visible, whereas an ‘a’ is both.)
[:lower:]       Lowercase alphabetic characters.
[:print:]       Printable characters (characters that are not control characters).
[:punct:]       Punctuation characters (characters that are not letters, digits, control characters, or space characters).
[:space:]       Space characters (such as space, TAB, and formfeed, to name a few).
[:upper:]       Uppercase alphabetic characters.
[:xdigit:]      Characters that are hexadecimal digits.
*/

Posix = {{
  alnum = parser r=(alpha | digit) -> r
  alpha = parser r=(lower | upper) -> r
  blank = parser r=[ 	]-> r
  cntrl = parser r=[ --] -> r
  digit = parser r=[0-9] -> r
  graph = parser r=(alnum | punct) -> r
  lower = parser r=[a-z] -> r
  print = parser r=(graph | space) -> r
  punct = parser r=[!-/:-@[-`{-~] -> r
  space = parser r=[	-] -> r
  upper = parser r=[a-Z] -> r
  xdigit = parser r=(digit | [a-fA-F]) -> r
}}
