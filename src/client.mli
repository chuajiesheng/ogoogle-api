(* gapi.client.load(name, version, callback) *)
val load : Js.js_string Js.t ->
  Js.js_string Js.t -> ('a, unit -> unit) Js.meth_callback -> unit

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
  method callback_ : ('a, 'b -> unit) Js.meth_callback (* function *)
end

val empty_request_args : unit -> 'a

val request : request_args Js.t -> httpRequest Js.t
