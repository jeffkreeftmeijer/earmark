Definitions.

WS          = \s
WSS         = {WS}+

UNDERSCORE  = _
STAR        = \*
DASH        = -
HASH        = #
EQUAL       = =
TILDE       = ~
LBRACKET    = \[
RBRACKET    = \]
LPAREN      = \(
RPAREN      = \)
LACCOLADE   = \{
RACCOLADE   = \}
QUOTE       = '
DQUOTE      = "
BAR         = \|
CARET       = \^
COLON       = :
LANGLE      = <
RANGLE      = >
AMP         = &
SEMICOLON   = ;
PLUS        = \+
EXCLAM      = !
SLASH       = /
AT          = @
DOT         = \.

DIGIT       = [0-9]
NUMBER      = {DIGIT}+

DEFAULTS    = [^0-9{WS}{UNDERSCORE}{STAR}\{DASH}{HASH}{EQUAL}{TILDE}{LBRACKET}{RBRACKET}{LPAREN}{RPAREN}{LACCOLADE}{RACCOLADE}{QUOTE}{DQUOTE}{BAR}{CARET}{COLON}{LANGLE}{RANGLE}{AMP}{SEMICOLON}{PLUS}{DOT}{EXCLAM}{SLASH}{AT}`\\]+
ESCAPEDBTX  = \\`
ESCAPED     = \\.
ESCAPE      = \\
BACKTIX     = `+

Rules.


{WSS}        : {token, {ws, TokenChars}}.
{AT}         : {token, {at, TokenChars}}.
{SLASH}      : {token, {slash, TokenChars}}.
{EXCLAM}     : {token, {exclam, TokenChars}}.
{DOT}        : {token, {dot, TokenChars}}.
{PLUS}       : {token, {plus, TokenChars}}.
{SEMICOLON}  : {token, {semicolon, TokenChars}}.
{AMP}        : {token, {amp, TokenChars}}.
{RANGLE}     : {token, {rangle, TokenChars}}.
{LANGLE}     : {token, {langle, TokenChars}}.
{COLON}      : {token, {colon, TokenChars}}.
{CARET}      : {token, {caret, TokenChars}}.
{NUMBER}     : {token, {number, TokenChars}}.
{BAR}        : {token, {bar, TokenChars}}.
{DQUOTE}     : {token, {dquote, TokenChars}}.
{QUOTE}      : {token, {quote, TokenChars}}.
{RACCOLADE}  : {token, {raccolade, TokenChars}}.
{LACCOLADE}  : {token, {laccolade, TokenChars}}.
{RPAREN}     : {token, {rparen, TokenChars}}.
{LPAREN}     : {token, {lparen, TokenChars}}.
{RBRACKET}   : {token, {rbracket, TokenChars}}.
{LBRACKET}   : {token, {lbracket, TokenChars}}.
{TILDE}      : {token, {tilde, TokenChars}}.
{EQUAL}      : {token, {equal, TokenChars}}.
{HASH}       : {token, {hash, TokenChars}}.
{DASH}       : {token, {dash, TokenChars}}.
{UNDERSCORE} : {token, {underscore, TokenChars}}.
{STAR}       : {token, {star, TokenChars}}.
{DEFAULTS}   : {token, {verbatim, TokenChars}}.
{ESCAPEDBTX} : {token, {verbatim, '`'}}.
{ESCAPED}    : {token, {verbatim, TokenChars}}.
{BACKTIX}    : {token, {backtix, TokenChars}}.
{ESCAPE}     : {token, {verbatim, TokenChars}}.

Erlang code.
