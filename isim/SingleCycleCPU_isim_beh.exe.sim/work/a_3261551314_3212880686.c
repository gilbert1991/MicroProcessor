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
static const char *ng0 = "/home/jharvard/ahd/FinalProject/DataMemory.vhd";
extern char *IEEE_P_3620187407;
extern char *IEEE_P_2592010699;

unsigned char ieee_p_2592010699_sub_1744673427_503743352(char *, char *, unsigned int , unsigned int );
int ieee_p_3620187407_sub_514432868_3965413181(char *, char *, char *);


static void work_a_3261551314_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    int t4;
    int t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;

LAB0:    xsi_set_current_line(51, ng0);

LAB3:    t1 = (t0 + 1420U);
    t2 = *((char **)t1);
    t1 = (t0 + 1236U);
    t3 = *((char **)t1);
    t1 = (t0 + 4364U);
    t4 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t3, t1);
    t5 = (t4 - 0);
    t6 = (t5 * 1);
    xsi_vhdl_check_range_of_index(0, 63, 1, t4);
    t7 = (32U * t6);
    t8 = (0 + t7);
    t9 = (t2 + t8);
    t10 = (t0 + 2580);
    t11 = (t10 + 32U);
    t12 = *((char **)t11);
    t13 = (t12 + 32U);
    t14 = *((char **)t13);
    memcpy(t14, t9, 32U);
    xsi_driver_first_trans_fast_port(t10);

LAB2:    t15 = (t0 + 2520);
    *((int *)t15) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_3261551314_3212880686_p_1(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    int t7;
    int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;

LAB0:    xsi_set_current_line(53, ng0);
    t1 = (t0 + 1052U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB3;

LAB4:
LAB2:    t18 = (t0 + 2528);
    *((int *)t18) = 1;

LAB1:    return;
LAB3:    t1 = (t0 + 1420U);
    t5 = *((char **)t1);
    t1 = (t0 + 776U);
    t6 = *((char **)t1);
    t1 = (t0 + 4316U);
    t7 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t6, t1);
    t8 = (t7 - 0);
    t9 = (t8 * 1);
    xsi_vhdl_check_range_of_index(0, 63, 1, t7);
    t10 = (32U * t9);
    t11 = (0 + t10);
    t12 = (t5 + t11);
    t13 = (t0 + 2616);
    t14 = (t13 + 32U);
    t15 = *((char **)t14);
    t16 = (t15 + 32U);
    t17 = *((char **)t16);
    memcpy(t17, t12, 32U);
    xsi_driver_first_trans_fast_port(t13);
    goto LAB2;

}

static void work_a_3261551314_3212880686_p_2(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    unsigned char t8;
    unsigned int t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    int t15;
    int t16;
    unsigned int t17;
    unsigned int t18;

LAB0:    xsi_set_current_line(57, ng0);
    t1 = (t0 + 684U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 568U);
    t3 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t3 != 0)
        goto LAB7;

LAB8:    xsi_set_current_line(66, ng0);

LAB3:    t1 = (t0 + 2536);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(58, ng0);
    t1 = xsi_get_transient_memory(2048U);
    memset(t1, 0, 2048U);
    t5 = t1;
    t6 = (t0 + 6500);
    t8 = (32U != 0);
    if (t8 == 1)
        goto LAB5;

LAB6:    t10 = (t0 + 2652);
    t11 = (t10 + 32U);
    t12 = *((char **)t11);
    t13 = (t12 + 32U);
    t14 = *((char **)t13);
    memcpy(t14, t1, 2048U);
    xsi_driver_first_trans_fast(t10);
    goto LAB3;

LAB5:    t9 = (2048U / 32U);
    xsi_mem_set_data(t5, t6, 32U, t9);
    goto LAB6;

LAB7:    xsi_set_current_line(60, ng0);
    t2 = (t0 + 960U);
    t5 = *((char **)t2);
    t4 = *((unsigned char *)t5);
    t8 = (t4 == (unsigned char)3);
    if (t8 != 0)
        goto LAB9;

LAB11:    xsi_set_current_line(63, ng0);

LAB10:    goto LAB3;

LAB9:    xsi_set_current_line(61, ng0);
    t2 = (t0 + 868U);
    t6 = *((char **)t2);
    t2 = (t0 + 776U);
    t7 = *((char **)t2);
    t2 = (t0 + 4316U);
    t15 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t7, t2);
    t16 = (t15 - 0);
    t9 = (t16 * 1);
    t17 = (32U * t9);
    t18 = (0U + t17);
    t10 = (t0 + 2652);
    t11 = (t10 + 32U);
    t12 = *((char **)t11);
    t13 = (t12 + 32U);
    t14 = *((char **)t13);
    memcpy(t14, t6, 32U);
    xsi_driver_first_trans_delta(t10, t18, 32U, 0LL);
    goto LAB10;

}


extern void work_a_3261551314_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3261551314_3212880686_p_0,(void *)work_a_3261551314_3212880686_p_1,(void *)work_a_3261551314_3212880686_p_2};
	xsi_register_didat("work_a_3261551314_3212880686", "isim/SingleCycleCPU_isim_beh.exe.sim/work/a_3261551314_3212880686.didat");
	xsi_register_executes(pe);
}
