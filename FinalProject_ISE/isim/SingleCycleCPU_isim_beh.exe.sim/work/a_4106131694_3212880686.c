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
static const char *ng0 = "/home/jharvard/ahd/FinalProject/ALUControl.vhd";



static void work_a_4106131694_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    int t4;
    char *t5;
    char *t6;
    int t7;
    char *t8;
    char *t9;
    int t10;
    char *t11;
    char *t12;
    int t13;
    char *t14;
    int t16;
    char *t17;
    int t19;
    char *t20;
    int t22;
    char *t23;
    int t25;
    char *t26;
    int t28;
    char *t29;
    int t31;
    char *t32;
    int t34;
    char *t35;
    int t37;
    char *t38;
    char *t39;
    unsigned char t41;
    unsigned int t42;
    char *t43;
    char *t44;
    char *t45;
    char *t46;
    char *t47;
    char *t48;
    char *t49;

LAB0:    xsi_set_current_line(43, ng0);
    t1 = (t0 + 684U);
    t2 = *((char **)t1);
    t1 = (t0 + 2878);
    t4 = xsi_mem_cmp(t1, t2, 4U);
    if (t4 == 1)
        goto LAB3;

LAB16:    t5 = (t0 + 2882);
    t7 = xsi_mem_cmp(t5, t2, 4U);
    if (t7 == 1)
        goto LAB4;

LAB17:    t8 = (t0 + 2886);
    t10 = xsi_mem_cmp(t8, t2, 4U);
    if (t10 == 1)
        goto LAB5;

LAB18:    t11 = (t0 + 2890);
    t13 = xsi_mem_cmp(t11, t2, 4U);
    if (t13 == 1)
        goto LAB6;

LAB19:    t14 = (t0 + 2894);
    t16 = xsi_mem_cmp(t14, t2, 4U);
    if (t16 == 1)
        goto LAB7;

LAB20:    t17 = (t0 + 2898);
    t19 = xsi_mem_cmp(t17, t2, 4U);
    if (t19 == 1)
        goto LAB8;

LAB21:    t20 = (t0 + 2902);
    t22 = xsi_mem_cmp(t20, t2, 4U);
    if (t22 == 1)
        goto LAB9;

LAB22:    t23 = (t0 + 2906);
    t25 = xsi_mem_cmp(t23, t2, 4U);
    if (t25 == 1)
        goto LAB10;

LAB23:    t26 = (t0 + 2910);
    t28 = xsi_mem_cmp(t26, t2, 4U);
    if (t28 == 1)
        goto LAB11;

LAB24:    t29 = (t0 + 2914);
    t31 = xsi_mem_cmp(t29, t2, 4U);
    if (t31 == 1)
        goto LAB12;

LAB25:    t32 = (t0 + 2918);
    t34 = xsi_mem_cmp(t32, t2, 4U);
    if (t34 == 1)
        goto LAB13;

LAB26:    t35 = (t0 + 2922);
    t37 = xsi_mem_cmp(t35, t2, 4U);
    if (t37 == 1)
        goto LAB14;

LAB27:
LAB15:    xsi_set_current_line(81, ng0);
    t1 = (t0 + 1648);
    t2 = (t1 + 32U);
    t3 = *((char **)t2);
    t5 = (t3 + 32U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)10;
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t1 = (t0 + 1604);
    *((int *)t1) = 1;

LAB1:    return;
LAB3:    xsi_set_current_line(45, ng0);
    t38 = (t0 + 592U);
    t39 = *((char **)t38);
    t38 = (t0 + 2926);
    t41 = 1;
    if (6U == 6U)
        goto LAB32;

LAB33:    t41 = 0;

LAB34:    if (t41 != 0)
        goto LAB29;

LAB31:    t1 = (t0 + 592U);
    t2 = *((char **)t1);
    t1 = (t0 + 2932);
    t41 = 1;
    if (6U == 6U)
        goto LAB40;

LAB41:    t41 = 0;

LAB42:    if (t41 != 0)
        goto LAB38;

LAB39:    t1 = (t0 + 592U);
    t2 = *((char **)t1);
    t1 = (t0 + 2938);
    t41 = 1;
    if (6U == 6U)
        goto LAB48;

LAB49:    t41 = 0;

LAB50:    if (t41 != 0)
        goto LAB46;

LAB47:    t1 = (t0 + 592U);
    t2 = *((char **)t1);
    t1 = (t0 + 2944);
    t41 = 1;
    if (6U == 6U)
        goto LAB56;

LAB57:    t41 = 0;

LAB58:    if (t41 != 0)
        goto LAB54;

LAB55:    t1 = (t0 + 592U);
    t2 = *((char **)t1);
    t1 = (t0 + 2950);
    t41 = 1;
    if (6U == 6U)
        goto LAB64;

LAB65:    t41 = 0;

LAB66:    if (t41 != 0)
        goto LAB62;

LAB63:    xsi_set_current_line(56, ng0);
    t1 = (t0 + 1648);
    t2 = (t1 + 32U);
    t3 = *((char **)t2);
    t5 = (t3 + 32U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)10;
    xsi_driver_first_trans_fast_port(t1);

LAB30:    goto LAB2;

LAB4:    xsi_set_current_line(59, ng0);
    t1 = (t0 + 1648);
    t2 = (t1 + 32U);
    t3 = *((char **)t2);
    t5 = (t3 + 32U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)0;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB2;

LAB5:    xsi_set_current_line(61, ng0);
    t1 = (t0 + 1648);
    t2 = (t1 + 32U);
    t3 = *((char **)t2);
    t5 = (t3 + 32U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)1;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB2;

LAB6:    xsi_set_current_line(63, ng0);
    t1 = (t0 + 1648);
    t2 = (t1 + 32U);
    t3 = *((char **)t2);
    t5 = (t3 + 32U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB2;

LAB7:    xsi_set_current_line(65, ng0);
    t1 = (t0 + 1648);
    t2 = (t1 + 32U);
    t3 = *((char **)t2);
    t5 = (t3 + 32U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB2;

LAB8:    xsi_set_current_line(67, ng0);
    t1 = (t0 + 1648);
    t2 = (t1 + 32U);
    t3 = *((char **)t2);
    t5 = (t3 + 32U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)5;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB2;

LAB9:    xsi_set_current_line(69, ng0);
    t1 = (t0 + 1648);
    t2 = (t1 + 32U);
    t3 = *((char **)t2);
    t5 = (t3 + 32U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)6;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB2;

LAB10:    xsi_set_current_line(71, ng0);
    t1 = (t0 + 1648);
    t2 = (t1 + 32U);
    t3 = *((char **)t2);
    t5 = (t3 + 32U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)0;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB2;

LAB11:    xsi_set_current_line(73, ng0);
    t1 = (t0 + 1648);
    t2 = (t1 + 32U);
    t3 = *((char **)t2);
    t5 = (t3 + 32U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)0;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB2;

LAB12:    xsi_set_current_line(75, ng0);
    t1 = (t0 + 1648);
    t2 = (t1 + 32U);
    t3 = *((char **)t2);
    t5 = (t3 + 32U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)7;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB2;

LAB13:    xsi_set_current_line(77, ng0);
    t1 = (t0 + 1648);
    t2 = (t1 + 32U);
    t3 = *((char **)t2);
    t5 = (t3 + 32U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)8;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB2;

LAB14:    xsi_set_current_line(79, ng0);
    t1 = (t0 + 1648);
    t2 = (t1 + 32U);
    t3 = *((char **)t2);
    t5 = (t3 + 32U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)9;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB2;

LAB28:;
LAB29:    xsi_set_current_line(46, ng0);
    t45 = (t0 + 1648);
    t46 = (t45 + 32U);
    t47 = *((char **)t46);
    t48 = (t47 + 32U);
    t49 = *((char **)t48);
    *((unsigned char *)t49) = (unsigned char)0;
    xsi_driver_first_trans_fast_port(t45);
    goto LAB30;

LAB32:    t42 = 0;

LAB35:    if (t42 < 6U)
        goto LAB36;
    else
        goto LAB34;

LAB36:    t43 = (t39 + t42);
    t44 = (t38 + t42);
    if (*((unsigned char *)t43) != *((unsigned char *)t44))
        goto LAB33;

LAB37:    t42 = (t42 + 1);
    goto LAB35;

LAB38:    xsi_set_current_line(48, ng0);
    t8 = (t0 + 1648);
    t9 = (t8 + 32U);
    t11 = *((char **)t9);
    t12 = (t11 + 32U);
    t14 = *((char **)t12);
    *((unsigned char *)t14) = (unsigned char)1;
    xsi_driver_first_trans_fast_port(t8);
    goto LAB30;

LAB40:    t42 = 0;

LAB43:    if (t42 < 6U)
        goto LAB44;
    else
        goto LAB42;

LAB44:    t5 = (t2 + t42);
    t6 = (t1 + t42);
    if (*((unsigned char *)t5) != *((unsigned char *)t6))
        goto LAB41;

LAB45:    t42 = (t42 + 1);
    goto LAB43;

LAB46:    xsi_set_current_line(50, ng0);
    t8 = (t0 + 1648);
    t9 = (t8 + 32U);
    t11 = *((char **)t9);
    t12 = (t11 + 32U);
    t14 = *((char **)t12);
    *((unsigned char *)t14) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t8);
    goto LAB30;

LAB48:    t42 = 0;

LAB51:    if (t42 < 6U)
        goto LAB52;
    else
        goto LAB50;

LAB52:    t5 = (t2 + t42);
    t6 = (t1 + t42);
    if (*((unsigned char *)t5) != *((unsigned char *)t6))
        goto LAB49;

LAB53:    t42 = (t42 + 1);
    goto LAB51;

LAB54:    xsi_set_current_line(52, ng0);
    t8 = (t0 + 1648);
    t9 = (t8 + 32U);
    t11 = *((char **)t9);
    t12 = (t11 + 32U);
    t14 = *((char **)t12);
    *((unsigned char *)t14) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t8);
    goto LAB30;

LAB56:    t42 = 0;

LAB59:    if (t42 < 6U)
        goto LAB60;
    else
        goto LAB58;

LAB60:    t5 = (t2 + t42);
    t6 = (t1 + t42);
    if (*((unsigned char *)t5) != *((unsigned char *)t6))
        goto LAB57;

LAB61:    t42 = (t42 + 1);
    goto LAB59;

LAB62:    xsi_set_current_line(54, ng0);
    t8 = (t0 + 1648);
    t9 = (t8 + 32U);
    t11 = *((char **)t9);
    t12 = (t11 + 32U);
    t14 = *((char **)t12);
    *((unsigned char *)t14) = (unsigned char)4;
    xsi_driver_first_trans_fast_port(t8);
    goto LAB30;

LAB64:    t42 = 0;

LAB67:    if (t42 < 6U)
        goto LAB68;
    else
        goto LAB66;

LAB68:    t5 = (t2 + t42);
    t6 = (t1 + t42);
    if (*((unsigned char *)t5) != *((unsigned char *)t6))
        goto LAB65;

LAB69:    t42 = (t42 + 1);
    goto LAB67;

}


extern void work_a_4106131694_3212880686_init()
{
	static char *pe[] = {(void *)work_a_4106131694_3212880686_p_0};
	xsi_register_didat("work_a_4106131694_3212880686", "isim/SingleCycleCPU_isim_beh.exe.sim/work/a_4106131694_3212880686.didat");
	xsi_register_executes(pe);
}
