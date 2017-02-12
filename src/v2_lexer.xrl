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

DEFAULTS    = [^{WS}{UNDERSCORE}{STAR}\{DASH}{HASH}{EQUAL}{TILDE}{LBRACKET}{RBRACKET}{LPAREN}{RPAREN}{LACCOLADE}{RACCOLADE}{QUOTE}{DQUOTE}`\\]+
ESCAPEDBTX  = \\`
ESCAPED     = \\.
ESCAPE      = \\
BACKTIX     = `+

Rules.


{WSS}         : {token, {ws, TokenChars}}.
{DQUOTE} : {token, {dquote, TokenChars}}.
{QUOTE} : {token, {quote, TokenChars}}.
{RACCOLADE} : {token, {raccolade, TokenChars}}.
{LACCOLADE} : {token, {laccolade, TokenChars}}.
{RPAREN} : {token, {rparen, TokenChars}}.
{LPAREN} : {token, {lparen, TokenChars}}.
{RBRACKET} : {token, {rbracket, TokenChars}}.
{LBRACKET} : {token, {lbracket, TokenChars}}.
{TILDE} : {token, {tilde, TokenChars}}.
{EQUAL} : {token, {equal, TokenChars}}.
{HASH} : {token, {hash, TokenChars}}.
{DASH} : {token, {dash, TokenChars}}.
{UNDERSCORE}  : {token, {underscore, TokenChars}}.
{STAR}        : {token, {star, TokenChars}}.
{DEFAULTS}    : {token, {verbatim, TokenChars}}.
{ESCAPEDBTX}  : {token, {verbatim, '`'}}.
{ESCAPED}     : {token, {verbatim, TokenChars}}.
{BACKTIX}     : {token, {backtix, TokenChars}}.
{ESCAPE}      : {token, {verbatim, TokenChars}}.

Erlang code.
