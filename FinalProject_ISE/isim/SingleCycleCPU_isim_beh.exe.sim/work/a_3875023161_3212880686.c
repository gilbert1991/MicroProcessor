/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0xfbc00daa */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "/home/jharvard/ahd/FinalProject/Sign_Extension.vhd";
extern char *IEEE_P_2592010699;



static void work_a_3875023161_3212880686_p_0(char *t0)
{
    char t13[16];
    char t15[16];
    char t30[16];
    char t32[16];
    char *t1;
    char *t2;
    int t3;
    unsigned int t4;
    unsigned int t5;
    unsigned int t6;
    unsigned char t7;
    unsigned char t8;
    char *t9;
    char *t11;
    char *t12;
    char *t14;
    char *t16;
    char *t17;
    int t18;
    unsigned int t19;
    unsigned char t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    char *t28;
    char *t29;
    char *t31;
    char *t33;
    char *t34;
    int t35;
    unsigned int t36;
    unsigned char t37;
    char *t38;
    char *t39;
    char *t40;
    char *t41;
    char *t42;
    char *t43;

LAB0:    xsi_set_current_line(41, ng0);
    t1 = (t0 + 592U);
    t2 = *((char **)t1);
    t3 = (15 - 15);
    t4 = (t3 * -1);
    t5 = (1U * t4);
    t6 = (0 + t5);
    t1 = (t2 + t6);
    t7 = *((unsigned char *)t1);
    t8 = (t7 == (unsigned char)3);
    if (t8 != 0)
        goto LAB3;

LAB4:
LAB7:    t26 = (t0 + 2688);
    t28 = (t0 + 592U);
    t29 = *((char **)t28);
    t31 = ((IEEE_P_2592010699) + 2312);
    t33 = (t32 + 0U);
    t34 = (t33 + 0U);
    *((int *)t34) = 0;
    t34 = (t33 + 4U);
    *((int *)t34) = 15;
    t34 = (t33 + 8U);
    *((int *)t34) = 1;
    t35 = (15 - 0);
    t36 = (t35 * 1);
    t36 = (t36 + 1);
    t34 = (t33 + 12U);
    *((unsigned int *)t34) = t36;
    t34 = (t0 + 2616U);
    t28 = xsi_base_array_concat(t28, t30, t31, (char)97, t26, t32, (char)97, t29, t34, (char)101);
    t36 = (16U + 16U);
    t37 = (32U != t36);
    if (t37 == 1)
        goto LAB9;

LAB10:    t38 = (t0 + 1556);
    t39 = (t38 + 32U);
    t40 = *((char **)t39);
    t41 = (t40 + 32U);
    t42 = *((char **)t41);
    memcpy(t42, t28, 32U);
    xsi_driver_first_trans_fast_port(t38);

LAB2:    t43 = (t0 + 1512);
    *((int *)t43) = 1;

LAB1:    return;
LAB3:    t9 = (t0 + 2672);
    t11 = (t0 + 592U);
    t12 = *((char **)t11);
    t14 = ((IEEE_P_2592010699) + 2312);
    t16 = (t15 + 0U);
    t17 = (t16 + 0U);
    *((int *)t17) = 0;
    t17 = (t16 + 4U);
    *((int *)t17) = 15;
    t17 = (t16 + 8U);
    *((int *)t17) = 1;
    t18 = (15 - 0);
    t19 = (t18 * 1);
    t19 = (t19 + 1);
    t17 = (t16 + 12U);
    *((unsigned int *)t17) = t19;
    t17 = (t0 + 2616U);
    t11 = xsi_base_array_concat(t11, t13, t14, (char)97, t9, t15, (char)97, t12, t17, (char)101);
    t19 = (16U + 16U);
    t20 = (32U != t19);
    if (t20 == 1)
        goto LAB5;

LAB6:    t21 = (t0 + 1556);
    t22 = (t21 + 32U);
    t23 = *((char **)t22);
    t24 = (t23 + 32U);
    t25 = *((char **)t24);
    memcpy(t25, t11, 32U);
    xsi_driver_first_trans_fast_port(t21);
    goto LAB2;

LAB5:    xsi_size_not_matching(32U, t19, 0);
    goto LAB6;

LAB8:    goto LAB2;

LAB9:    xsi_size_not_matching(32U, t36, 0);
    goto LAB10;

}


extern void work_a_3875023161_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3875023161_3212880686_p_0};
	xsi_register_didat("work_a_3875023161_3212880686", "isim/SingleCycleCPU_isim_beh.exe.sim/work/a_3875023161_3212880686.didat");
	xsi_register_executes(pe);
}
