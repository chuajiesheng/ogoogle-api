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

(*
   gapi.client.RpcRequest
   Similar to gapi.client.HttpRequest except this object encapsulates
   requests generated by registered methods.
   It defines one method:
   gapi.client.RpcRequest.execute(callback)
   Executes the request and runs the supplied callback with the response.
*)
class type rpcRequest = object
  method execute : ('a, 'b -> 'c -> unit) Js.meth_callback -> 'd Js.meth
end

(* gapi.client.rpcRequest(method,name,rpcParams) *)
let empty_rpc_request_args () = Js.Unsafe.obj [||]

let rpc_request (meth : Js.js_string Js.t) (version : Js.js_string Js.t)
    (rpc_params : 'a Js.t) : rpcRequest Js.t =
  Js.Unsafe.fun_call
    (Js.Unsafe.variable "gapi.client.rpcRequest")
    [| Js.Unsafe.inject meth; Js.Unsafe.inject version;
       Js.Unsafe.inject rpc_params|]

(* gapi.client.HttpBatch *)
let empty_opt_params () = Js.Unsafe.obj [||]

class type opt_params = object
  method id_ : Js.js_string Js.t Js.prop
  method callback_ : ('a, 'b -> 'c -> unit) Js.meth_callback
end

class type httpBatch = object
  method add_ : httpRequest Js.t -> opt_params Js.t -> unit Js.meth
  method execute_ : ('a, 'b -> 'c -> unit) Js.meth_callback -> 'd Js.meth
end

let new_http_batch () : httpBatch Js.t =
    Js.Unsafe.fun_call
      (Js.Unsafe.variable "gapi.client.newHttpBatch") [||]
