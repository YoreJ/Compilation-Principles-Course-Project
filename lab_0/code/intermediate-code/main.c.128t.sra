
;; Function main (main, funcdef_no=23, decl_uid=3375, cgraph_uid=24, symbol_order=23) (executed once)

int main ()
{
  int i;
  long long unsigned int factorial;
  int num;
  long long unsigned int _1;
  int num.0_2;
  int num.0_13;

  <bb 2> [local count: 118111600]:
  scanf ("%d", &num);
  num.0_13 = num;
  if (num.0_13 > 0)
    goto <bb 3>; [89.00%]
  else
    goto <bb 4>; [11.00%]

  <bb 3> [local count: 955630225]:
  # factorial_14 = PHI <factorial_9(3), 1(2)>
  # i_16 = PHI <i_10(3), 1(2)>
  _1 = (long long unsigned int) i_16;
  factorial_9 = _1 * factorial_14;
  i_10 = i_16 + 1;
  num.0_2 = num;
  if (num.0_2 >= i_10)
    goto <bb 3>; [89.00%]
  else
    goto <bb 4>; [11.00%]

  <bb 4> [local count: 118111600]:
  # factorial_15 = PHI <factorial_9(3), 1(2)>
  __printf_chk (2, "%llu\n", factorial_15);
  num ={v} {CLOBBER(eol)};
  return 0;

}


