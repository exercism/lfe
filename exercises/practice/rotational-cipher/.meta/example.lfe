(defmodule rotational-cipher
  (export (rotate 2)))

(defun rotate (text shift)
  (do-rotate text shift ""))

(defun do-rotate
  (('() _ acc)
   (unicode:characters_to_list (lists:reverse acc)))
  (((cons head tail) shift acc)
    (let ((chr (rotate-char head shift)))
      (do-rotate tail shift (cons chr acc)))))

(defun rotate-char (chr shift)
  (cond ((and (>= chr #\A) (=< chr #\Z))
          (let* ((relative-offset (+ (- chr #\A) shift))
                 (codepoint (+ (rem relative-offset 26) #\A)))
            codepoint))
        ((and (>= chr #\a) (=< chr #\z))
          (let* ((relative-offset (+ (- chr #\a) shift))
                 (codepoint (+ (rem relative-offset 26) #\a)))
            codepoint))
        (else chr)))
