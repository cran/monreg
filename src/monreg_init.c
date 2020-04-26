#include <stdlib.h> // for NULL
#include <R_ext/Rdynload.h>

/* .C calls */
extern void mdach_a_inv (double *x, double *y, double *z, double *t,int *m, int *n, int *l, int *tflag, double *hd, double *hr, int *Kd, int *Kr, double *degree, int *ldeg, int *inverse, double *erg);
extern void mdach_i_inv (double *x, double *y, double *z, double *t,int *m, int *n, int *l, int *tflag, double *hd, double *hr, int *Kd, int *Kr, double *degree, int *ldeg, int *inverse, double *erg);
extern void sdach_a_inv (double *x, double *y, double *z, double *t,int *m, int *n, int *l, int *tflag, double *h, double *hd, double *hr,int *K, int *Kd, int *Kr, double *mdegree, int *lmdeg, double *sdegree, int *lsdeg, int *inverse, double *erg);
extern void sdach_i_inv (double *x, double *y, double *z, double *t,int *m, int *n, int *l, int *tflag, double *h, double *hd, double *hr,int *K, int *Kd, int *Kr, double *mdegree, int *lmdeg, double *sdegree, int *lsdeg, int *inverse, double *erg);
extern void sdach2_a_inv (double *x, double *y, double *z, double *t, int *m, int *n, int*l, int *r, int *tflag, double *h, double *hd, int *K, int *Kd, double *degree, int *ldeg, int *inverse, double *erg);
extern void sdach2_i_inv (double *x, double *y, double *z, double *t, int *m, int *n, int*l, int *r, int *tflag, double *h, double *hd, int *K, int *Kd, double *degree, int *ldeg, int *inverse, double *erg);

static const R_CMethodDef CEntries[] = {
    {"c_mdach_a_inv",  (DL_FUNC) &mdach_a_inv,  16},
    {"c_mdach_i_inv",  (DL_FUNC) &mdach_i_inv,  16},
    {"c_sdach_a_inv",  (DL_FUNC) &sdach_a_inv,  20},
    {"c_sdach_i_inv",  (DL_FUNC) &sdach_i_inv,  20},
    {"c_sdach2_a_inv", (DL_FUNC) &sdach2_a_inv, 17},
    {"c_sdach2_i_inv", (DL_FUNC) &sdach2_i_inv, 17},
    {NULL, NULL, 0}
};

void R_init_monreg(DllInfo *dll)
{
    R_registerRoutines(dll, CEntries, NULL, NULL, NULL);
    R_useDynamicSymbols(dll, FALSE);
}

