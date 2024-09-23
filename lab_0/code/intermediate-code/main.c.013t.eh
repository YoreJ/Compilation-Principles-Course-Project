
;; Function main (main, funcdef_no=23, decl_uid=3375, cgraph_uid=24, symbol_order=23)

int main ()
{
  int i;
  long long unsigned int factorial;
  int num;
  int D.3385;

  factorial = 1;
  scanf ("%d", &num);
  i = 1;
  goto <D.3383>;
  <D.3382>:
  _1 = (long long unsigned int) i;
  factorial = factorial * _1;
  i = i + 1;
  <D.3383>:
  num.0_2 = num;
  if (i <= num.0_2) goto <D.3382>; else goto <D.3380>;
  <D.3380>:
  printf ("%llu\n", factorial);
  D.3385 = 0;
  goto <D.3387>;
  <D.3387>:
  num = {CLOBBER(eol)};
  goto <D.3386>;
  D.3385 = 0;
  goto <D.3386>;
  <D.3386>:
  return D.3385;
}



;; Function printf (<unset-asm-name>, funcdef_no=15, decl_uid=1743, cgraph_uid=16, symbol_order=15)

__attribute__((artificial, gnu_inline, always_inline))
__attribute__((nonnull (1), format (printf, 1, 2)))
int printf (const char * restrict __fmt)
{
  int D.3388;

  D.3388 = __printf_chk (2, __fmt, __builtin_va_arg_pack ());
  goto <D.3389>;
  <D.3389>:
  return D.3388;
}


