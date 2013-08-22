(* gapi.client.load(name, version, callback) *)
let load
    (name : Js.js_string Js.t)
    (ver : Js.js_string Js.t)
    (callback : ('a, unit -> unit) Js.meth_callback) : unit =
  Js.Unsafe.fun_call
    (Js.Unsafe.variable "gapi.client.load")
    [|Js.Unsafe.inject name; Js.Unsafe.inject ver; Js.Unsafe.inject callback|]

(*
   gapi.client.HttpRequest
   An object encapsulating an HTTP request.
   This object is not instantiated directly, rather it is returned by
   gapi.client.request.

   It defines one method:
   gapi.client.HttpRequest.execute(callback)
   Executes the request and runs the supplied callback on response.
*)
class type httpRequest = object
  method execute : ('a, 'b -> 'c -> unit) Js.meth_callback -> 'd Js.meth
end

(* gapi.client.request(args) *)
class type request_args = object
  method path_ : Js.js_string Js.t Js.prop (* string *)
  method method_ : Js.js_string Js.t Js.prop (* string *)
  method params_ : 'a (* object *)
  method headers_ : 'b (* object *)
  method body_ : 'c (* string | object *)
  method callback_ : ('d, 'e -> unit) Js.meth_callback (* function *)
end

let empty_request_args () = Js.Unsafe.obj [||]

let request (args : request_args Js.t) : httpRequest Js.t =
    Js.Unsafe.fun_call
      (Js.Unsafe.variable "gapi.client.request") [| Js.Unsafe.inject args|]
