#ogoogle-api


A OCaml binding for [google-api-javascript-client](https://developers.google.com/api-client-library/javascript/) 
done via [Js_of_OCaml](http://ocsigen.org/js_of_ocaml) library

##Installation
    make install 

##Dependency
1. lwt ( >= 2.4 )
2. deriving-ocsigen
3. ocamlfind

Best to do the installation via [OPAM](http://opam.ocamlpro.com/index.html) in case you have dependency issues.

##Usage
Code; Link to ogoogle-api package; Generate .js

    ocamlfind ocamlc -annot -linkpkg -package js_of_ocaml -package js_of_ocaml.syntax -package lwt -package ogoogle-api -syntax camlp4o -o example.ml
    js_of_ocaml example.byte -pretty
    rm example.byte
    
Link to .JS

    <script src="https://apis.google.com/js/client.js"></script>
    <script src="example.js"></script>


##Example
There is a example for every method present in the binding. 
See [examples](https://github.com/chuajiesheng/ogoogle-api-examples) repository

##Notes
1. After add/changing .mli files, there is a need to "make distclean" to update the .depend files.
2. As the library currently bind the basic authentication function, API-specific function would still need to be done via `Js.Unsafe.fun_call`
