# About

**Lisp Flavoured Erlang** (AKA LFE) is a lisp syntax **front-end** to the **Erlang compiler**. 
Code produced with it is compatible with "normal" Erlang code. 
LFE is a (proper) Lisp based on the features and limitations of the Erlang VM.
LFE is useful in applications that require the **robustness** and **concurrency** handling of Erlang, combined with the **flexibility** of a Lisp-family language.

**Key Benefits:**
- **Lisp Syntax**: LFE uses a syntax based on S-expressions (symbolic expressions), characteristic of Lisp-family languages. This allows easy manipulation of programs as data, a powerful feature for metaprogramming.
- **Erlang Concurrency**: It leverages Erlang's actor-based concurrency model. Processes in Erlang are lightweight and can be used in large numbers without significant performance costs.
- **Fault Tolerance**: LFE inherits Erlang's capability to create distributed and fault-tolerant systems. This includes features such as process restarts and supervisors to handle errors robustly.
- **Interoperability**: It can easily integrate with existing Erlang code, allowing developers to use libraries and applications written in Erlang without issues.
- **Lisp Macros**: Like other Lisp languages, LFE allows developers to write macros, which are programs that write other programs. This facilitates the creation of new abstractions and language extensions.

LFE has many origins, depending upon whether you're looking at Lisp, Erlang, or LFE-proper. 
The LFE community of contributors embraces all of these and more.

LFE is a Lisp-2. 
In Lisp-2, the rules for evaluation in the functional position of a form are distinct from those for evaluation in the argument positions of the form. 
In addition, LFE not only has separate value and function space but also allows multiple function definitions for the same name, as Erlang does.
