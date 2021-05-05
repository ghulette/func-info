open Cil_types

module Self = Plugin.Register (struct
  let name = "Function Info"
  let shortname = "finfo"
  let help = "output info about function definitions"
end)

class print_info = object
  inherit Visitor.frama_c_inplace

  method! vglob_aux = function
    | GFun (f, (p1,p2)) ->
      let file_name = p1.pos_path in
      let func_name = f.svar.vname in
      let start_line = p1.pos_lnum in
      let end_line = p2.pos_lnum in
      Self.result "%s:%d:%d" func_name start_line end_line;
      Cil.SkipChildren
    | _ -> Cil.SkipChildren
  end

module Enabled = Self.False (struct
  let option_name = "-finfo"
  let help = "when enabled print info"
end)

let run () =
  if Enabled.get () then
    let visitor = new print_info in
    let ast = Ast.get () in
    Visitor.visitFramacFileSameGlobals visitor ast

let () =
  Db.Main.extend run
