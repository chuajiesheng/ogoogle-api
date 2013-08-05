(** gapi.auth.authorize(params, callback) **)

class type params = object
  method client_id : Js.js_string Js.t Js.writeonly_prop
  method immediate : bool Js.t Js.prop
  method response_type : Js.js_string Js.t Js.writeonly_prop
  method scope : Js.js_string Js.t Js.js_array Js.t Js.prop
end

let empty_params () = Js.Unsafe.obj [||]

let authorize
    (p : params Js.t)
    (m : (('a, Token.oauth_token -> unit) Js.meth_callback)) : unit =
  Js.Unsafe.fun_call
    (Js.Unsafe.variable "gapi.auth.authorize")
    [|Js.Unsafe.inject p|]
