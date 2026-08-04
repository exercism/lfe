(defmodule diamond-tests
  (behaviour ltest-unit)
  (export all))

(include-lib "ltest/include/ltest-macros.lfe")

(deftest degenerate-case-with-a-single-a-row
  (is-equal '("A")
            (diamond:rows "A")))

(deftest degenerate-case-with-no-row-containing-three-distinct-groups-of-spaces
  (is-equal '(" A "
              "B B"
              " A ")
            (diamond:rows "B")))

(deftest smallest-non-degenerate-case-with-odd-diamond-side-length
  (is-equal '("  A  "
              " B B "
              "C   C"
              " B B "
              "  A  ")
            (diamond:rows "C")))

(deftest smallest-non-degenerate-case-with-even-diamond-side-length
  (is-equal '("   A   "
              "  B B  "
              " C   C "
              "D     D"
              " C   C "
              "  B B  "
              "   A   ")
            (diamond:rows "D")))

(deftest largest-possible-diamond
  (is-equal '("                         A                         "
              "                        B B                        "
              "                       C   C                       "
              "                      D     D                      "
              "                     E       E                     "
              "                    F         F                    "
              "                   G           G                   "
              "                  H             H                  "
              "                 I               I                 "
              "                J                 J                "
              "               K                   K               "
              "              L                     L              "
              "             M                       M             "
              "            N                         N            "
              "           O                           O           "
              "          P                             P          "
              "         Q                               Q         "
              "        R                                 R        "
              "       S                                   S       "
              "      T                                     T      "
              "     U                                       U     "
              "    V                                         V    "
              "   W                                           W   "
              "  X                                             X  "
              " Y                                               Y "
              "Z                                                 Z"
              " Y                                               Y "
              "  X                                             X  "
              "   W                                           W   "
              "    V                                         V    "
              "     U                                       U     "
              "      T                                     T      "
              "       S                                   S       "
              "        R                                 R        "
              "         Q                               Q         "
              "          P                             P          "
              "           O                           O           "
              "            N                         N            "
              "             M                       M             "
              "              L                     L              "
              "               K                   K               "
              "                J                 J                "
              "                 I               I                 "
              "                  H             H                  "
              "                   G           G                   "
              "                    F         F                    "
              "                     E       E                     "
              "                      D     D                      "
              "                       C   C                       "
              "                        B B                        "
              "                         A                         ")
            (diamond:rows "Z")))
