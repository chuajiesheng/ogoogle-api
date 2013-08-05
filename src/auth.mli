(** gapi.auth.authorize(params, callback) **)

class type params = object
  method client_id : Js.js_string Js.t Js.writeonly_prop
  method immediate : bool Js.t Js.prop
  method response_type : Js.js_string Js.t Js.writeonly_prop
  method scope : Js.js_string Js.t Js.js_array Js.t Js.prop
end

val empty_params : unit -> params Js.t

val authorize :
  params Js.t -> (('a, Token.oauth_token -> unit Js.t) Js.meth_callback) -> unit
