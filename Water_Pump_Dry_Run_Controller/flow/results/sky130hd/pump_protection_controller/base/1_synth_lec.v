module pump_protection_controller (clk,
    dry_run_fault,
    fault_status,
    pump_demand,
    pump_enable,
    reset);
 input clk;
 input dry_run_fault;
 output fault_status;
 input pump_demand;
 output pump_enable;
 input reset;

 wire _00_;
 wire _01_;
 wire _02_;
 wire _03_;
 wire _04_;
 wire _05_;
 wire _06_;
 wire _07_;
 wire _08_;
 wire _09_;
 wire _10_;
 wire _11_;
 wire _12_;
 wire _13_;
 wire _14_;
 wire _15_;
 wire _16_;
 wire _17_;
 wire _18_;
 wire _19_;
 wire _20_;
 wire _21_;
 wire _22_;
 wire _23_;
 wire _24_;
 wire _25_;
 wire _26_;
 wire _27_;
 wire _28_;
 wire _29_;
 wire _30_;
 wire _31_;
 wire _32_;
 wire _33_;
 wire _34_;
 wire _35_;
 wire _36_;
 wire _37_;
 wire _38_;
 wire _39_;
 wire _40_;
 wire _41_;
 wire _42_;
 wire \lockout_count[0] ;
 wire \lockout_count[1] ;
 wire \lockout_count[2] ;
 wire \lockout_count[3] ;
 wire \state[0] ;
 wire \state[1] ;
 wire \state[2] ;

 sky130_fd_sc_hd__inv_1 _43_ (.A(\lockout_count[1] ),
    .Y(_00_));
 sky130_fd_sc_hd__clkbuf_4 _44_ (.A(\state[1] ),
    .X(_13_));
 sky130_fd_sc_hd__nand3b_1 _45_ (.A_N(\lockout_count[2] ),
    .B(_01_),
    .C(\lockout_count[3] ),
    .Y(_14_));
 sky130_fd_sc_hd__or2b_2 _46_ (.A(dry_run_fault),
    .B_N(\state[2] ),
    .X(_15_));
 sky130_fd_sc_hd__nor2b_1 _47_ (.A(\lockout_count[2] ),
    .B_N(_03_),
    .Y(_16_));
 sky130_fd_sc_hd__nand4_1 _48_ (.A(_13_),
    .B(_14_),
    .C(_15_),
    .D(_16_),
    .Y(_17_));
 sky130_fd_sc_hd__nor2b_2 _49_ (.A(dry_run_fault),
    .B_N(\state[2] ),
    .Y(_18_));
 sky130_fd_sc_hd__nor2b_1 _50_ (.A(_03_),
    .B_N(_13_),
    .Y(_19_));
 sky130_fd_sc_hd__o21ai_0 _51_ (.A1(_18_),
    .A2(_19_),
    .B1(\lockout_count[2] ),
    .Y(_20_));
 sky130_fd_sc_hd__buf_4 _52_ (.A(reset),
    .X(_21_));
 sky130_fd_sc_hd__a21oi_1 _53_ (.A1(_17_),
    .A2(_20_),
    .B1(_21_),
    .Y(_07_));
 sky130_fd_sc_hd__nand4b_1 _54_ (.A_N(_02_),
    .B(_14_),
    .C(_15_),
    .D(_13_),
    .Y(_22_));
 sky130_fd_sc_hd__nand2_1 _55_ (.A(\lockout_count[1] ),
    .B(_18_),
    .Y(_23_));
 sky130_fd_sc_hd__a21oi_1 _56_ (.A1(_22_),
    .A2(_23_),
    .B1(_21_),
    .Y(_08_));
 sky130_fd_sc_hd__nand4b_1 _57_ (.A_N(\lockout_count[0] ),
    .B(_13_),
    .C(_14_),
    .D(_15_),
    .Y(_24_));
 sky130_fd_sc_hd__nand2_1 _58_ (.A(\lockout_count[0] ),
    .B(_18_),
    .Y(_25_));
 sky130_fd_sc_hd__a21oi_1 _59_ (.A1(_24_),
    .A2(_25_),
    .B1(_21_),
    .Y(_09_));
 sky130_fd_sc_hd__nor2_1 _60_ (.A(\state[2] ),
    .B(\state[0] ),
    .Y(_26_));
 sky130_fd_sc_hd__inv_1 _61_ (.A(_21_),
    .Y(_27_));
 sky130_fd_sc_hd__o31ai_1 _62_ (.A1(dry_run_fault),
    .A2(pump_demand),
    .A3(_26_),
    .B1(_27_),
    .Y(_04_));
 sky130_fd_sc_hd__inv_1 _63_ (.A(pump_demand),
    .Y(_28_));
 sky130_fd_sc_hd__o21ai_0 _64_ (.A1(_28_),
    .A2(_14_),
    .B1(_13_),
    .Y(_29_));
 sky130_fd_sc_hd__o31ai_1 _65_ (.A1(_13_),
    .A2(\state[2] ),
    .A3(\state[0] ),
    .B1(dry_run_fault),
    .Y(_30_));
 sky130_fd_sc_hd__a21oi_1 _66_ (.A1(_29_),
    .A2(_30_),
    .B1(_21_),
    .Y(_05_));
 sky130_fd_sc_hd__and3b_1 _67_ (.A_N(\lockout_count[2] ),
    .B(_01_),
    .C(\lockout_count[3] ),
    .X(_31_));
 sky130_fd_sc_hd__nand2_1 _68_ (.A(_13_),
    .B(_31_),
    .Y(_32_));
 sky130_fd_sc_hd__a2111oi_0 _69_ (.A1(_26_),
    .A2(_32_),
    .B1(dry_run_fault),
    .C1(_21_),
    .D1(_28_),
    .Y(_06_));
 sky130_fd_sc_hd__nand3_1 _70_ (.A(\lockout_count[0] ),
    .B(\lockout_count[1] ),
    .C(\lockout_count[2] ),
    .Y(_33_));
 sky130_fd_sc_hd__nand4_1 _71_ (.A(\lockout_count[3] ),
    .B(_13_),
    .C(_14_),
    .D(_33_),
    .Y(_34_));
 sky130_fd_sc_hd__or4b_1 _72_ (.A(\lockout_count[3] ),
    .B(_18_),
    .C(_33_),
    .D_N(\state[1] ),
    .X(_35_));
 sky130_fd_sc_hd__nand2_1 _73_ (.A(\lockout_count[3] ),
    .B(_18_),
    .Y(_36_));
 sky130_fd_sc_hd__a31oi_1 _74_ (.A1(_34_),
    .A2(_35_),
    .A3(_36_),
    .B1(_21_),
    .Y(_10_));
 sky130_fd_sc_hd__a2111oi_0 _75_ (.A1(_26_),
    .A2(_32_),
    .B1(dry_run_fault),
    .C1(_21_),
    .D1(_28_),
    .Y(_11_));
 sky130_fd_sc_hd__or3b_2 _76_ (.A(\state[2] ),
    .B(\state[0] ),
    .C_N(\state[1] ),
    .X(_37_));
 sky130_fd_sc_hd__o21ai_0 _77_ (.A1(\state[2] ),
    .A2(\state[0] ),
    .B1(dry_run_fault),
    .Y(_38_));
 sky130_fd_sc_hd__a22oi_1 _78_ (.A1(_13_),
    .A2(_14_),
    .B1(_37_),
    .B2(_38_),
    .Y(_39_));
 sky130_fd_sc_hd__nor4b_1 _79_ (.A(dry_run_fault),
    .B(\state[2] ),
    .C(\state[0] ),
    .D_N(pump_demand),
    .Y(_40_));
 sky130_fd_sc_hd__a31oi_1 _80_ (.A1(_13_),
    .A2(_31_),
    .A3(_40_),
    .B1(_21_),
    .Y(_41_));
 sky130_fd_sc_hd__o21a_1 _81_ (.A1(fault_status),
    .A2(_39_),
    .B1(_41_),
    .X(_12_));
 sky130_fd_sc_hd__ha_1 _82_ (.A(\lockout_count[0] ),
    .B(_00_),
    .COUT(_01_),
    .SUM(_02_));
 sky130_fd_sc_hd__ha_1 _83_ (.A(\lockout_count[0] ),
    .B(\lockout_count[1] ),
    .COUT(_03_),
    .SUM(_42_));
 sky130_fd_sc_hd__dfxtp_1 \fault_status$_SDFFE_PP0P_  (.D(_12_),
    .Q(fault_status),
    .CLK(clk));
 sky130_fd_sc_hd__dfxtp_1 \lockout_count[0]$_SDFFE_PP0P_  (.D(_09_),
    .Q(\lockout_count[0] ),
    .CLK(clk));
 sky130_fd_sc_hd__dfxtp_1 \lockout_count[1]$_SDFFE_PP0P_  (.D(_08_),
    .Q(\lockout_count[1] ),
    .CLK(clk));
 sky130_fd_sc_hd__dfxtp_1 \lockout_count[2]$_SDFFE_PP0P_  (.D(_07_),
    .Q(\lockout_count[2] ),
    .CLK(clk));
 sky130_fd_sc_hd__dfxtp_1 \lockout_count[3]$_SDFFE_PP0P_  (.D(_10_),
    .Q(\lockout_count[3] ),
    .CLK(clk));
 sky130_fd_sc_hd__dfxtp_1 \pump_enable$_SDFF_PP0_  (.D(_11_),
    .Q(pump_enable),
    .CLK(clk));
 sky130_fd_sc_hd__dfxtp_1 \state[0]$_DFF_P_  (.D(_04_),
    .Q(\state[0] ),
    .CLK(clk));
 sky130_fd_sc_hd__dfxtp_1 \state[1]$_DFF_P_  (.D(_05_),
    .Q(\state[1] ),
    .CLK(clk));
 sky130_fd_sc_hd__dfxtp_1 \state[2]$_DFF_P_  (.D(_06_),
    .Q(\state[2] ),
    .CLK(clk));
endmodule
