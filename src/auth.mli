(* gapi.auth.authorize(params, callback) *)
class type params = object
  method client_id_ : Js.js_string Js.t Js.writeonly_prop
  method immediate_ : bool Js.t Js.prop
  method response_type_ : Js.js_string Js.t Js.writeonly_prop
  method scope_ : Js.js_string Js.t Js.js_array Js.t Js.prop
end

val empty_params : unit -> params Js.t

val authorize :
  params Js.t -> (('a, (Token.oauth_token Js.t) -> unit) Js.meth_callback) -> unit

(* gapi.auth.init(callback) *)
val init :
  ('a, unit -> unit) Js.meth_callback -> unit

(* gapi.auth.getToken() *)
val get_token : unit -> Token.oauth_token Js.t

(* gapi.auth.setToken(token) *)
val set_token : Token.oauth_token Js.t -> unit

(* gapi.client.setApiKey(apiKey) *)
val set_api_key:
  Js.js_string Js.t -> unit
