" Vim syntax file for ArangoDB AQL (ArangoDB Query Language)
" Language: AQL (ArangoDB Query Language)
" Maintainer: Jure Bajic
" Latest Revision: 2025

if exists("b:current_syntax")
  finish
endif

" Case sensitivity
syn case ignore

" Keywords - High-level operations
syn keyword aqlKeyword FOR RETURN FILTER SEARCH SORT LIMIT LET COLLECT WINDOW INSERT UPDATE REPLACE REMOVE UPSERT WITH

" Additional keywords
syn keyword aqlKeyword AGGREGATE ALL_SHORTEST_PATHS ASC DESC DISTINCT GRAPH INTO K_PATHS K_SHORTEST_PATHS LIKE NOT NULL OUTBOUND SHORTEST_PATH

" Context-dependent keywords (not reserved but keyword-like)
syn keyword aqlKeyword KEEP COUNT OPTIONS PRUNE TO

" Special variables (case-sensitive)
syn keyword aqlSpecial CURRENT NEW OLD

" Operators
syn keyword aqlOperator AND OR NOT IN ANY NONE
syn match aqlOperator "=="
syn match aqlOperator "!="
syn match aqlOperator ">="
syn match aqlOperator "<="
syn match aqlOperator ">"
syn match aqlOperator "<"
syn match aqlOperator "="
syn match aqlOperator "+"
syn match aqlOperator "-"
syn match aqlOperator "*"
syn match aqlOperator "/"
syn match aqlOperator "%"
syn match aqlOperator "&&"
syn match aqlOperator "||"
syn match aqlOperator "!"
syn match aqlOperator "?"

" Comments
syn region aqlComment start="/\*" end="\*/" contains=aqlTodo
syn match aqlComment "//.*$" contains=aqlTodo

" Strings
syn region aqlString start='"' end='"' skip='\\"'
syn region aqlString start="'" end="'" skip="\\'"

" Numbers
syn match aqlNumber "\<[0-9]\+\([Ee][+-]\?[0-9]\+\)\?\>"
syn match aqlNumber "\<[0-9]\+\.[0-9]\+\([Ee][+-]\?[0-9]\+\)\?\>"
syn match aqlNumber "\<[0-9]\+\>"

" Booleans
syn keyword aqlBoolean true false

" Null
syn keyword aqlNull null

" Collection names (quoted with backticks or forward ticks)
syn region aqlCollection start="`" end="`" skip="\\`"
syn region aqlCollection start="´" end="´" skip="\\´"

" Variables (following AQL naming rules)
syn match aqlVariable "\<[a-zA-Z_][a-zA-Z0-9_]*\>"
syn match aqlVariable "\$[a-zA-Z][a-zA-Z0-9_]*\>"

" Type check functions
syn keyword aqlFunction IS_DATESTRING IS_IPV4 IS_KEY TYPENAME IS_LIST IS_DOCUMENT IS_NULL IS_BOOL IS_NUMBER IS_STRING IS_ARRAY IS_OBJECT

" Type cast functions
syn keyword aqlFunction TO_NUMBER TO_STRING TO_BOOL TO_ARRAY TO_LIST

" String functions
syn keyword aqlFunction CONTAINS
syn keyword aqlFunction LENGTH CONCAT SUBSTRING UPPER LOWER TRIM SPLIT JOIN CONCAT_SEPARATOR CHAR_LENGTH SUBSTRING_BYTES LIKE REGEX_MATCHES REGEX_SPLIT REGEX_TEST REGEX_REPLACE LEFT RIGHT LTRIM RTRIM FIND_FIRST FIND_LAST SUBSTITUTE IPV4_TO_NUMBER IPV4_FROM_NUMBER MD5 SHA1 SHA256 SHA512 CRC32 FNV64 HASH TO_BASE64 TO_HEX TO_CHAR REPEAT ENCODE_URI_COMPONENT SOUNDEX LEVENSHTEIN_DISTANCE LEVENSHTEIN_MATCH NGRAM_MATCH NGRAM_SIMILARITY NGRAM_POSITIONAL_SIMILARITY MINHASH_MATCH IN_RANGE RANDOM_TOKEN

" Numeric functions
syn keyword aqlFunction FLOOR CEIL ROUND ABS SQRT POW LOG LOG2 LOG10 EXP EXP2 SIN COS TAN ASIN ACOS ATAN ATAN2 RADIANS DEGREES PI BIT_AND BIT_OR BIT_XOR BIT_NEGATE BIT_TEST BIT_POPCOUNT BIT_SHIFT_LEFT BIT_SHIFT_RIGHT BIT_CONSTRUCT BIT_DECONSTRUCT BIT_TO_STRING BIT_FROM_STRING MINHASH_ERROR MINHASH_COUNT

" List functions
syn keyword aqlFunction FLATTEN RANGE UNION UNION_DISTINCT MINUS OUTERSECTION INTERSECTION JACCARD COUNT_DISTINCT COUNT_UNIQUE PRODUCT SORTED_UNIQUE SORTED SLICE REVERSE NTH POSITION CONTAINS_ARRAY PUSH APPEND POP SHIFT UNSHIFT REMOVE_VALUES REMOVE_NTH REPLACE_NTH INTERLEAVE DECAY_GAUSS DECAY_EXP DECAY_LINEAR MINHASH L1_DISTANCE CALL APPLY

" Document functions
syn keyword aqlFunction HAS ATTRIBUTES KEYS VALUES VALUE MERGE MERGE_RECURSIVE MATCHES UNSET UNSET_RECURSIVE KEEP KEEP_RECURSIVE TRANSLATE ZIP ENTRIES JSON_STRINGIFY JSON_PARSE

" Geo functions
syn keyword aqlFunction DISTANCE IS_IN_POLYGON GEO_DISTANCE GEO_CONTAINS GEO_INTERSECTS GEO_EQUALS GEO_AREA GEO_IN_RANGE
syn keyword aqlFunction GEO_POINT GEO_MULTIPOINT GEO_POLYGON GEO_MULTIPOLYGON GEO_LINESTRING GEO_MULTILINESTRING

" Vector index functions
syn keyword aqlFunction APPROX_NEAR_L2 APPROX_NEAR_COSINE APPROX_NEAR_INNER_PRODUCT

" Date functions
syn keyword aqlFunction DATE_NOW DATE_ISO8601 DATE_TIMESTAMP DATE_ADD DATE_SUBTRACT DATE_DAYOFWEEK DATE_YEAR DATE_MONTH DATE_DAY DATE_HOUR DATE_MINUTE DATE_SECOND DATE_MILLISECOND DATE_DAYOFYEAR DATE_ISOWEEK DATE_ISOWEEKYEAR DATE_LEAPYEAR DATE_QUARTER DATE_DAYS_IN_MONTH DATE_DIFF DATE_COMPARE DATE_FORMAT DATE_TRUNC DATE_UTCTOLOCAL DATE_LOCALTOUTC DATE_TIMEZONE DATE_TIMEZONES DATE_ROUND

" Misc functions
syn keyword aqlFunction PASSTHRU NOT_NULL FIRST_LIST FIRST_DOCUMENT PARSE_IDENTIFIER PARSE_KEY PARSE_COLLECTION DECODE_REV SHARD_ID V8 SCHEMA_GET SCHEMA_VALIDATE VERSION FAIL NOOPT NOEVAL SLEEP COLLECTIONS CURRENT_USER CURRENT_DATABASE CHECK_DOCUMENT COLLECTION_COUNT ASSERT WARN NEAR WITHIN WITHIN_RECTANGLE FULLTEXT MAKE_DISTRIBUTE_INPUT MAKE_DISTRIBUTE_INPUT_WITH_KEY_CREATION MAKE_DISTRIBUTE_GRAPH_INPUT SELECT_SMART_DISTRIBUTE_GRAPH_INPUT INTERNAL
syn keyword aqlFunction DOCUMENT EDGES VERTICES NEIGHBORS PATHS
syn keyword aqlFunction COUNT SUM AVG MIN MAX FIRST LAST UNIQUE
syn keyword aqlFunction RAND RANDOM UUID
syn keyword aqlFunction L2_DISTANCE COSINE_SIMILARITY
syn keyword aqlFunction REMOVE_VALUE IS_SAME_COLLECTION

" Graph traversal keywords
syn keyword aqlGraphTraversal INBOUND OUTBOUND ANY SHORTEST_PATH ALL_SHORTEST_PATHS K_SHORTEST_PATHS K_PATHS

" Nested queries in parentheses - must be defined before bracket regions
syn region aqlNestedParen start="(" end=")" contains=ALL

" Nested queries and attribute access in square brackets - handles both cases
syn region aqlNestedQuery start="\[" end="\]" contains=ALL

" Nested
syntax region aqlNested start="//{{{\s---" end="//}}}" fold contains=xFold

" Highlighting groups
hi def link aqlKeyword Statement
hi def link aqlSpecial Special
hi def link aqlOperator Operator
hi def link aqlComment Comment
hi def link aqlTodo Todo
hi def link aqlString String
hi def link aqlNumber Number
hi def link aqlBoolean Boolean
hi def link aqlNull Type
hi def link aqlCollection Identifier
hi def link aqlVariable Identifier
hi def link aqlFunction Function
hi def link aqlGraphTraversal Keyword
hi def link aqlNestedQuery Structure
hi def link aqlNestedParen Structure

let b:current_syntax = "aql" 
