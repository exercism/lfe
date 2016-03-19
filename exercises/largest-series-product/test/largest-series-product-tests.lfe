(defmodule largest-series-product-tests
  (behaviour ltest-unit)
  (export all))

(include-lib "ltest/include/ltest-macros.lfe")

(defmacro gen-equal (x y)
  "Given forms `x` and `y`, return a test generator to assert they are equal."
  `(_assertEqual ,x ,y))

(defmacro gen-error (x)
  "Given a form `x`, return a test generator to assert it throws an error."
  `(_assertError _ ,x))

(deftestgen largest-series
  `[#(#"can find the largest product of 2 with numbers in order"
      ,(gen-equal 72 (largest-series-product:from-string "0123456789" 2)))
    #(#"can find the largest product of 2"
      ,(gen-equal 48 (largest-series-product:from-string "576802143" 2)))
    #(#"finds the largest product if span equals length"
      ,(gen-equal 18 (largest-series-product:from-string "29" 2)))
    #(#"can find the largest product of 3 with numbers in order"
      ,(gen-equal 504 (largest-series-product:from-string "0123456789" 3)))
    #(#"can find the largest product of 3"
      ,(gen-equal 270 (largest-series-product:from-string "1027839564" 3)))
    #(#"can find the largest product of 5 with numbers in order"
      ,(gen-equal 15120 (largest-series-product:from-string "0123456789" 5)))
    #(#"can get the largest product of a big number"
      ,(let ((ds "73167176531330624919225119674426574742355349194934"))
         (gen-equal 23520 (largest-series-product:from-string ds 6))))
    #(#"can get the largest product of a big number II"
      ,(let ((ds "52677741234314237566414902593461595376319419139427"))
         (gen-equal 28350 (largest-series-product:from-string ds 6))))
    #(#"can get the largest product of a big number (Project Euler)"
      ,(let ((ds "7316717653133062491922511967442657474235534919493496983520312774506326239578318016984801869478851843858615607891129494954595017379583319528532088055111254069874715852386305071569329096329522744304355766896648950445244523161731856403098711121722383113622298934233803081353362766142828064444866452387493035890729629049156044077239071381051585930796086670172427121883998797908792274921901699720888093776657273330010533678812202354218097512545405947522435258490771167055601360483958644670632441572215539753697817977846174064955149290862569321978468622482839722413756570560574902614079729686524145351004748216637048440319989000889524345065854122758866688116427171479924442928230863465674813919123162824586178664583591245665294765456828489128831426076900422421902267105562632111110937054421750694165896040807198403850962455444362981230987879927244284909188845801561660979191338754992005240636899125607176060588611646710940507754100225698315520005593572972571636269561882670428252483600823257530420752963450"))
         (gen-equal 23514624000 (largest-series-product:from-string ds 13))))
    #(#"reports zero if the only digits are zero"
      ,(gen-equal 0 (largest-series-product:from-string "0000" 2)))
    #(#"reports zero if all spans include zero"
      ,(gen-equal 0 (largest-series-product:from-string "99099" 3)))
    #(#"rejects span longer than string length"
      ,(gen-error (largest-series-product:from-string "123" 4)))
    #(#"reports 1 for empty string and empty product (0 span)"
      ,(gen-equal 1 (largest-series-product:from-string "" 0)))
    #(#"reports 1 for nonempty string and empty product (0 span)"
      ,(gen-equal 1 (largest-series-product:from-string "123" 0)))
    #(#"rejects empty string and nonzero span"
      ,(gen-error (largest-series-product:from-string "" 1)))
    #(#"rejects invalid character in digits"
      ,(gen-error (largest-series-product:from-string "1234a5" 2)))
    #(#"rejects negative span"
      ,(gen-error (largest-series-product:from-string "12345" -1)))])
