Definitions.

WS          = \s+
DEFAULTS    = [^\s`\\]+
ESCAPEDBTX  = \\`
ESCAPED     = \\.
ESCAPE      = \\
BACKTIX     = `+

Rules.


{WS}          : {token, {ws, TokenChars}}.
{DEFAULTS}    : {token, {verbatim, TokenChars}}.
{ESCAPEDBTX}  : {token, {verbatim, '`'}}.
{ESCAPED}     : {token, {verbatim, TokenChars}}.
{BACKTIX}     : {token, {backtix, TokenChars}}.
{ESCAPE}      : {token, {verbatim, TokenChars}}.

Erlang code.
