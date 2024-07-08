(defmodule kindergarten-garden-tests
  (behaviour ltest-unit)
  (export all))

(include-lib "ltest/include/ltest-macros.lfe")

(deftest garden-with-single-student
  (is-equal '("radishes" "clover" "grass" "grass")
            (kindergarten-garden:plants "RC\nGG" "Alice")))

(deftest different-garden-with-single-student
  (is-equal '("violets" "clover" "radishes" "clover")
            (kindergarten-garden:plants "VC\nRC" "Alice")))

(deftest garden-with-two-students
  (is-equal '("clover" "grass" "radishes" "clover")
            (kindergarten-garden:plants "VVCG\nVVRC" "Bob")))

(deftest second-students-garden
  (is-equal '("clover" "clover" "clover" "clover")
            (kindergarten-garden:plants "VVCCGG\nVVCCGG" "Bob")))

(deftest third-students-garden
  (is-equal '("grass" "grass" "grass" "grass")
            (kindergarten-garden:plants "VVCCGG\nVVCCGG" "Charlie")))

(deftest for-Alice
  (is-equal '("violets" "radishes" "violets" "radishes")
            (kindergarten-garden:plants "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV"
                                        "Alice")))

(deftest for-Bob
  (is-equal '("clover" "grass" "clover" "clover")
            (kindergarten-garden:plants "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV"
                                        "Bob")))

(deftest for-Charlie
  (is-equal '("violets" "violets" "clover" "grass")
            (kindergarten-garden:plants "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV"
                                        "Charlie")))

(deftest for-David
  (is-equal '("radishes" "violets" "clover" "radishes")
            (kindergarten-garden:plants "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV"
                                        "David")))

(deftest for-Eve
  (is-equal '("clover" "grass" "radishes" "grass")
            (kindergarten-garden:plants "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV"
                                        "Eve")))

(deftest for-Fred
  (is-equal '("grass" "clover" "violets" "clover")
            (kindergarten-garden:plants "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV"
                                        "Fred")))

(deftest for-Ginny
  (is-equal '("clover" "grass" "grass" "clover")
            (kindergarten-garden:plants "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV"
                                        "Ginny")))

(deftest for-Harriet
  (is-equal '("violets" "radishes" "radishes" "violets")
            (kindergarten-garden:plants "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV"
                                        "Harriet")))

(deftest for-Ileana
  (is-equal '("grass" "clover" "violets" "clover")
            (kindergarten-garden:plants "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV"
                                        "Ileana")))
(deftest for-Joseph
  (is-equal '("violets" "clover" "violets" "grass")
            (kindergarten-garden:plants "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV"
                                        "Joseph")))

(deftest for-Kincaid-second-to-last-students-garden
  (is-equal '("grass" "clover" "clover" "grass")
            (kindergarten-garden:plants "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV"
                                        "Kincaid")))

(deftest for-Larry-last-students-garden
  (is-equal '("grass" "violets" "clover" "violets")
            (kindergarten-garden:plants "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV"
                                        "Larry")))
