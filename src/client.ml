(* gapi.client.load(name, version, callback) *)
let load
    (name : Js.js_string Js.t)
    (ver : Js.js_string Js.t)
    (callback : ('a, unit -> unit) Js.meth_callback) : unit =
  Js.Unsafe.fun_call
    (Js.Unsafe.variable "gapi.client.load")
    [|Js.Unsafe.inject name; Js.Unsafe.inject ver; Js.Unsafe.inject callback|]
