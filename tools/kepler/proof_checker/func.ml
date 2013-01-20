open Intv

exception FuncException of string

type t = Basic.exp

let rec apply (e : Env.t) (f : t) : Intv.t
    = match f with
      Basic.Var x -> Env.find x e
    | Basic.Num n -> Intv.make n n
    | Basic.Neg f' -> ~-$ (apply e f')
    | Basic.Add (f1, f2) -> (apply e f1) +$ (apply e f2)
    | Basic.Sub (f1, f2) -> (apply e f1) -$ (apply e f2)
    | Basic.Mul (f1, f2) -> (apply e f1) *$ (apply e f2)
    | Basic.Div (f1, f2) -> (apply e f1) /$ (apply e f2)
    | Basic.Ite _ -> raise (FuncException "ITE is not supported!")
    | Basic.Pow (f', n) -> (apply e f') **$. n
    | Basic.Sqrt f' -> sqrt_I (apply e f')
    | Basic.Abs f' -> abs_I (apply e f')
    | Basic.Log f' -> log_I (apply e f')
    | Basic.Exp f' -> exp_I (apply e f')
    | Basic.Sin f' -> sin_I (apply e f')
    | Basic.Cos f' -> cos_I (apply e f')
    | Basic.Tan f' -> tan_I (apply e f')
    | Basic.Asin f' -> asin_I (apply e f')
    | Basic.Acos f' -> acos_I (apply e f')
    | Basic.Atan f' -> atan_I (apply e f')
    | Basic.Sinh f' -> sinh_I (apply e f')
    | Basic.Cosh f' -> cosh_I (apply e f')
    | Basic.Tanh f' -> tanh_I (apply e f')

(*   = *)
(* let out = BatIO.stdout in *)
(* match f with *)
(* | Basic.Var x -> *)
(*   begin *)
(*     let r = Env.find x e in *)
(*     BatString.print out (x ^ " = "); *)
(*     Intv.print out r; *)
(*     BatString.println out ""; *)
(*     r *)
(*   end *)
(* | Basic.Num n -> *)
(*   begin *)
(*     let r = Intv.make n n in *)
(*     BatString.print out ("Number "); *)
(*     Intv.print out r; *)
(*     BatString.println out ""; *)
(*     r *)
(*   end *)
(* | Basic.Neg f' -> *)
(*   let v1 = (apply e f') in *)
(*   let r = ~-$ v1 in *)
(*   begin *)
(*     BatString.print out "-"; *)
(*     Intv.print out v1; *)
(*     BatString.print out " = "; *)
(*     Intv.print out r; *)
(*     BatString.println out ""; *)
(*     r *)
(*   end *)
(* | Basic.Add (f1, f2) -> *)
(*   let v1 = (apply e f1) in *)
(*   let v2 = (apply e f2) in *)
(*   let r = v1 +$ v2 in *)
(*   begin *)
(*     Intv.print out v1; *)
(*     BatString.print out " + "; *)
(*     Intv.print out v1; *)
(*     BatString.print out " = "; *)
(*     Intv.print out r; *)
(*     BatString.println out ""; *)
(*     r *)
(*   end *)
(* | Basic.Sub (f1, f2) -> *)
(*   let v1 = (apply e f1) in *)
(*   let v2 = (apply e f2) in *)
(*   let r = v1 -$ v2 in *)
(*   begin *)
(*     Intv.print out v1; *)
(*     BatString.print out " - "; *)
(*     Intv.print out v1; *)
(*     BatString.print out " = "; *)
(*     Intv.print out r; *)
(*     BatString.println out ""; *)
(*     r *)
(*   end *)
(* | Basic.Mul (f1, f2) -> *)
(*   let v1 = (apply e f1) in *)
(*   let v2 = (apply e f2) in *)
(*   let r = v1 *$ v2 in *)
(*   begin *)
(*     Intv.print out v1; *)
(*     BatString.print out " * "; *)
(*     Intv.print out v2; *)
(*     BatString.print out " = "; *)
(*     Intv.print out r; *)
(*     BatString.println out ""; *)
(*     r *)
(*   end *)
(* | Basic.Div (f1, f2) -> *)
(*   let v1 = (apply e f1) in *)
(*   let v2 = (apply e f2) in *)
(*   let r = v1 /$ v2 in *)
(*   begin *)
(*     Intv.print out v1; *)
(*     BatString.print out " / "; *)
(*     Intv.print out v1; *)
(*     BatString.print out " = "; *)
(*     Intv.print out r; *)
(*     BatString.println out ""; *)
(*     r *)
(*   end *)
(* | Basic.Ite _ -> raise (FuncException "ITE is not supported!") *)
(* | Basic.Pow (f', n) -> *)
(*   let v1 = (apply e f') in *)
(*   let r = v1 **$. n in *)
(*   begin *)
(*     Intv.print out v1; *)
(*     BatString.print out " ^ "; *)
(*     BatFloat.print out n; *)
(*     BatString.print out " = "; *)
(*     Intv.print out r; *)
(*     BatString.println out ""; *)
(*     r *)
(*   end *)
(* | Basic.Sqrt f' -> *)
(*   let v1 = (apply e f') in *)
(*   let r = sqrt_I v1 in *)
(*   begin *)
(*     BatString.print out "sqrt "; *)
(*     Intv.print out v1; *)
(*     BatString.print out " = "; *)
(*     Intv.print out r; *)
(*     BatString.println out ""; *)
(*     r *)
(*   end *)
(* | Basic.Abs f' -> *)
(*   let v1 = (apply e f') in *)
(*   let r = abs_I v1 in *)
(*   begin *)
(*     BatString.print out "abs "; *)
(*     Intv.print out v1; *)
(*     BatString.print out " = "; *)
(*     Intv.print out r; *)
(*     BatString.println out ""; *)
(*     r *)
(*   end *)

(* | Basic.Log f' -> *)
(*   let v1 = (apply e f') in *)
(*   let r = log_I v1 in *)
(*   begin *)
(*     BatString.print out "log "; *)
(*     Intv.print out v1; *)
(*     BatString.print out " = "; *)
(*     Intv.print out r; *)
(*     BatString.println out ""; *)
(*     r *)
(*   end *)

(* | Basic.Exp f' -> *)
(*   let v1 = (apply e f') in *)
(*   let r = exp_I v1 in *)
(*   begin *)
(*     BatString.print out "exp "; *)
(*     Intv.print out v1; *)
(*     BatString.print out " = "; *)
(*     Intv.print out r; *)
(*     BatString.println out ""; *)
(*     r *)
(*   end *)
(* | Basic.Sin f' -> *)
(*   let v1 = (apply e f') in *)
(*   let r = sin_I v1 in *)
(*   begin *)
(*     BatString.print out "sin "; *)
(*     Intv.print out v1; *)
(*     BatString.print out " = "; *)
(*     Intv.print out r; *)
(*     BatString.println out ""; *)
(*     r *)
(*   end *)
(* | Basic.Cos f' -> *)
(*   let v1 = (apply e f') in *)
(*   let r = cos_I v1 in *)
(*   begin *)
(*     BatString.print out "cos "; *)
(*     Intv.print out v1; *)
(*     BatString.print out " = "; *)
(*     Intv.print out r; *)
(*     BatString.println out ""; *)
(*     r *)
(*   end *)
(* | Basic.Tan f' -> *)
(*   let v1 = (apply e f') in *)
(*   let r = tan_I v1 in *)
(*   begin *)
(*     BatString.print out "tan "; *)
(*     Intv.print out v1; *)
(*     BatString.print out " = "; *)
(*     Intv.print out r; *)
(*     BatString.println out ""; *)
(*     r *)
(*   end *)
(* | Basic.Asin f' -> *)
(*   let v1 = (apply e f') in *)
(*   let r = asin_I v1 in *)
(*   begin *)
(*     BatString.print out "asin "; *)
(*     Intv.print out v1; *)
(*     BatString.print out " = "; *)
(*     Intv.print out r; *)
(*     BatString.println out ""; *)
(*     r *)
(*   end *)
(* | Basic.Acos f' -> *)
(*   let v1 = (apply e f') in *)
(*   let r = acos_I v1 in *)
(*   begin *)
(*     BatString.print out "acos "; *)
(*     Intv.print out v1; *)
(*     BatString.print out " = "; *)
(*     Intv.print out r; *)
(*     BatString.println out ""; *)
(*     r *)
(*   end *)
(* | Basic.Atan f' -> *)
(*   let v1 = (apply e f') in *)
(*   let r = atan_I v1 in *)
(*   begin *)
(*     BatString.print out "atan "; *)
(*     Intv.print out v1; *)
(*     BatString.print out " = "; *)
(*     Intv.print out r; *)
(*     BatString.println out ""; *)
(*     r *)
(*   end *)
(* | Basic.Sinh f' -> *)
(*   let v1 = (apply e f') in *)
(*   let r = sinh_I v1 in *)
(*   begin *)
(*     BatString.print out "sinh "; *)
(*     Intv.print out v1; *)
(*     BatString.print out " = "; *)
(*     Intv.print out r; *)
(*     BatString.println out ""; *)
(*     r *)
(*   end *)
(* | Basic.Cosh f' -> *)
(*   let v1 = (apply e f') in *)
(*   let r = cosh_I v1 in *)
(*   begin *)
(*     BatString.print out "cosh "; *)
(*     Intv.print out v1; *)
(*     BatString.print out " = "; *)
(*     Intv.print out r; *)
(*     BatString.println out ""; *)
(*     r *)
(*   end *)
(* | Basic.Tanh f' -> *)
(*   let v1 = (apply e f') in *)
(*   let r = tanh_I v1 in *)
(*   begin *)
(*     BatString.print out "tanh "; *)
(*     Intv.print out v1; *)
(*     BatString.print out " = "; *)
(*     Intv.print out r; *)
(*     BatString.println out ""; *)
(*     r *)
(*   end *)

let print out = Basic.print_exp out
