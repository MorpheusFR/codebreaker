module Codebreaker
  ATTEMPTS = 6
  HINTS = 4

  RULES =
  " The code-breaker then gets some number of chances to break the code.\n " \
  " In each turn, the code-breaker makes a guess of four numbers.\n "        \
  " The code-maker then marks the guess with up to four + and - signs.\n "   \
  "\n"                                                                       \
  "You have #{ATTEMPTS} attempts and game answers with"                                \
  " up to four pluses and minuses        \n "                                \
  "       \n"                                                                \
  " + (plus) indicates an exact match: \n"                                   \
  "   one of the numbers in the guess is the same as one of the numbers  \n" \
  "   in the secret code and in the same position. \n"                       \
  " - (minus) indicates a number match: \n"                                  \
  "   one of the numbers in the guess is the same as one of the numbers  \n" \
  "   in the secret code but in a different position. \n"                    \
  "                            Tips & Tricks                             \n" \
  "HINTS: type 'h' and game will show one  number from code to you       \n" \
  "RULES: if you forget the rules, just enter 'rules' "                      \
  .freeze

  GREETING_MESSAGE =
  "#######################################################################\n"\
  "    CODEBREACKER is a logic game in which a code-breaker tries to break\n"\
  " a secret code created by a code-maker. The code-maker creates a secret\n"\
  " code of four numbers between 1 and 6. \n #{RULES} \n  "                  \
  '                              GOOD LUCK!                                ' \
  .freeze

  PATH_TO_LOG_FILES = './tmp/log_file.txt'.freeze
end