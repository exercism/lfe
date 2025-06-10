(defmodule robot-simulator
  (export (create 0)
          (place 3)
          (direction 1)
          (position 1)
          (left 1)
          (right 1)
          (advance 1)
          (control 2)

          ;; gen_server stuff
          (init 1)
          (handle_cast 2)
          (handle_call 3))
  (behaviour gen_server))

; Please implement the exported function(s).
