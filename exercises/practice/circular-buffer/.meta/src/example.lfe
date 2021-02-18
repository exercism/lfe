(defmodule circular-buffer
  (export (create 1)
          (read 1)
          (size 1)
          (write 2)
          (write-attempt 2)))

(defun create (size) (spawn (lambda () (loop 0 size (queue:new)))))

(defun read (pid) (request pid 'read))

(defun size (pid) (request pid 'size))

(defun write (pid item) (! pid `#(write ,item)))

(defun write-attempt (pid item)
  (! pid `#(write-attempt ,item ,(self)))
  (receive
    (`#(write-attempt true  ,pid) 'ok)
    (`#(write-attempt false ,pid) #(error full))))

(defun write-attempt
  ([current max _item queue] (when (=:= current max))
   `#(,max ,queue))
  ([current max item queue]
   (write current max item queue)))

(defun write
  ([current max item queue] (when (< current max))
   `#(,(+ current 1) ,(queue:in item queue)))
  ([current max item queue]
   (let ((`#(,_old ,new-queue) (queue:out queue)))
     `#(,max ,(queue:in item new-queue)))))

(defun handle
  ([`#(read ,pid) `#(0 ,max-size ,queue)]
   (! pid `#(read empty ,(self))))
  ([`#(read ,pid) `#(,current-size ,max-size ,queue)]
   (let ((`#(,result ,new-queue) (queue:out queue)))
     (! pid `#(read ,result ,(self)))
     `#(,(- current-size 1) ,max-size ,new-queue)))
  ([`#(write ,item) `#(,current-size ,max-size ,queue)] (when (=:= current-size max-size))
   (let* ((`#(,_old ,tmp-queue) (queue:out queue))
          (new-queue (queue:in item tmp-queue)))
     `#(,current-size ,max-size ,new-queue)))
  ([`#(write ,item) `#(,current-size ,max-size ,queue)]
   (let ((new-queue (queue:in item queue)))
     `#(,(+ current-size 1) ,max-size ,new-queue)))
  ([`#(write-attempt ,_item ,pid) `#(,current-size ,max-size ,queue)] (when (=:= current-size max-size))
   (! pid `#(write-attempt false ,(self))))
  ([`#(write-attempt ,item ,pid) `#(,current-size ,max-size ,queue)]
   (! pid `#(write-attempt true ,(self)))
   (let ((new-queue (queue:in item queue)))
     `#(,(+ current-size 1) ,max-size ,new-queue)))
  ([`#(size ,pid) `#(,current-size ,max-size ,queue)]
   (! pid `#(size ,max-size ,queue))
   `#(,current-size ,max-size ,queue)))

(defun loop (state)
  (receive
    (request
     (loop (handle request state)))))

(defun loop (current-size max-size queue)
  (receive
    (`#(read ,pid)
     (let ((`#(,result ,new-queue) (queue:out queue)))
       (! pid `#(read ,result ,(self)))
       (loop (- current-size 1) max-size new-queue)))
    (`#(size ,pid)
     (! pid `#(size ,max-size ,(self)))
     (loop current-size max-size queue))
    (`#(write ,item)
     (let ((`#(,new-size ,new-queue) (write current-size max-size item queue)))
       (loop new-size max-size new-queue)))
    (`#(write-attempt ,item ,pid)
     (! pid `#(write-attempt ,(< current-size max-size) ,(self)))
     (let ((`#(,new-size ,new-queue) (write-attempt current-size max-size item queue)))
       (loop new-size max-size new-queue)))))

(defun request (pid request)
  (! pid `#(,request ,(self)))
  (receive
    (`#(,request empty ,pid)            `#(error empty))
    (`#(,request #(value ,answer) ,pid) `#(ok ,answer))
    (`#(,request ,answer ,pid)          `#(ok ,answer))))
