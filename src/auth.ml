(* gapi.auth.authorize(params, callback) *)
class type params = object
  method client_id_ : Js.js_string Js.t Js.writeonly_prop
  method immediate_ : bool Js.t Js.prop
  method response_type_ : Js.js_string Js.t Js.writeonly_prop
  method scope_ : Js.js_string Js.t Js.js_array Js.t Js.prop
end

let empty_params () = Js.Unsafe.obj [||]

let authorize
    (p : params Js.t)
    (m : (('a, (Token.oauth_token Js.t) -> unit) Js.meth_callback)) : unit =
  Js.Unsafe.fun_call
    (Js.Unsafe.variable "gapi.auth.authorize")
    [|Js.Unsafe.inject p; Js.Unsafe.inject m|]

(* gapi.auth.init(callback) *)
let init
    (m : ('a, unit -> unit) Js.meth_callback) : unit =
  Js.Unsafe.fun_call
    (Js.Unsafe.variable "gapi.auth.init")
    [|Js.Unsafe.inject m|]

(* gapi.auth.getToken() *)
let get_token () : Token.oauth_token Js.t =
  Js.Unsafe.fun_call (Js.Unsafe.variable "gapi.auth.getToken") [||]

(* gapi.auth.setToken(token) *)
let set_token (t : Token.oauth_token Js.t) : unit =
  Js.Unsafe.fun_call
    (Js.Unsafe.variable "gapi.auth.setToken") [|Js.Unsafe.inject t|]

(* gapi.client.setApiKey(apiKey) *)
let set_api_key (key : Js.js_string Js.t) : unit =
  Js.Unsafe.fun_call (Js.Unsafe.variable "gapi.client.setApiKey")
    [|Js.Unsafe.inject key |]
