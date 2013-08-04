(** gapi.auth.authorize(params, callback) **)

module ParamsMap = Map.Make (String)

let create_params =
  ParamsMap.empty

let add_client_id id m =
  ParamsMap.add "client_id" id m

let add_immediate immediate m =
  ParamsMap.add "immediate" (string_of_bool immediate) m

let add_response_type response_type m =
  ParamsMap.add "response_type" response_type m

let add_scope (scope : Js.js_string Js.js_array) m =
  ParamsMap.add "scope" scope m

let authorize (p : Js.js_string Js.js_array ParamsMap.t) (m : (Token.oauth_token Js.callback) ) : unit =
  Js.Unsafe.fun_call
    (Js.Unsafe.variable "gapi.auth.authorize")
    [|Js.Unsafe.inject p; Js.Unsafe.inject m|]
