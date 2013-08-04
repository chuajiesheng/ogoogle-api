class type oauth_token = object
  method access_token : Js.js_string Js.t Js.prop
  method error : Js.js_string Js.t Js.prop
  method expires_in : Js.js_string Js.t Js.prop
  method state : Js.js_string Js.t Js.prop
end
