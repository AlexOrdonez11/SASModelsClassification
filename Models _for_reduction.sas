/* Importing, remember to change the path*/
proc import out= data datafile="/home/u64008123/CombineData_1stestAttempt.csv"
dbms=csv replace;
run;

/* Utilizing diferent models to measure the importance of our input variables */

/*Backward*/
proc logistic data=data;
	model target_bin(event="1")=previous_qualification_grade admission_grade displaced debtor tuition_fees_up_to_date gender 
	scholarship_holder curricular_units_1st_sem_grade curricular_units_2nd_sem_grade age_lt20 age_lt25_gt20 age_lt30_gt25
	mother_occupation_grp168 mother_occupation_grp2357 mother_occupation_grp4910
	father_occupation_grp124 father_occupation_grp3568 father_occupation_grp7 father_occupation_grp910
	single app_phase app_older23 app_inter student_secondary_edu student_higher_edu mother_secondary_edu 
	mother_higher_edu father_secondary_edu father_higher_edu "1st_sem_approved_all_enrolled"n "2nd_sem_approved_all_enrolled"n 
	"1st_5_enrolled"n	"1st_6_enrolled"n "1st_7_enrolled"n "1st_gt_7_enrolled"n "2nd_5_enrolled"n "2nd_6_enrolled"n
	"2nd_7_enrolled"n "2nd_8_enrolled"n "2nd_gt_8_enrolled"n CU1sem_Eval1grp_678	CU1sem_Eval1grp_lt6 CU1sem_approv1grp_5 
	CU1sem_approv1grp_lt5 CU2sem_Eval1grp_679 CU2sem_Eval1grp_8 CU2sem_Eval1grp_lt6 CU2sem_approv1grp_5 CU2sem_approv1grp_0 CU2sem_approv1grp_1234
 	cu1sem_credit cu2sem_credit	Course_33 Course_171 Course_9003 Course_9070 Course_9085 Course_9119 Course_9130 Course_9147_9670 Course_9238_8014 
 	Course_9254 Course_9500 Course_9556 Course_9773 Course_9853 unemployment_rate inflation_rate gdp / selection=backward;
run;

/* After selection method */
proc logistic data=data;
	model target_bin(event="1")= displaced debtor tuition_fees_up_to_date gender scholarship_holder age_lt20 age_lt25_gt20 age_lt30_gt25
	mother_occupation_grp168 mother_occupation_grp2357 mother_occupation_grp4910 father_occupation_grp124 
	father_occupation_grp3568 father_occupation_grp7 father_occupation_grp910 app_phase app_older23 app_inter 
	"1st_sem_approved_all_enrolled"n "2nd_sem_approved_all_enrolled"n "2nd_5_enrolled"n "2nd_6_enrolled"n
	"2nd_7_enrolled"n "2nd_8_enrolled"n "2nd_gt_8_enrolled"n CU1sem_Eval1grp_678 CU1sem_Eval1grp_lt6 CU1sem_approv1grp_5 
	CU1sem_approv1grp_lt5 CU2sem_Eval1grp_679 CU2sem_Eval1grp_8 CU2sem_Eval1grp_lt6 CU2sem_approv1grp_5 CU2sem_approv1grp_0 CU2sem_approv1grp_1234
 	cu1sem_credit	Course_33 Course_171 Course_9003 Course_9070 Course_9085 Course_9119 Course_9130 Course_9147_9670 Course_9238_8014 
 	Course_9254 Course_9500 Course_9556 Course_9773 Course_9853 unemployment_rate;
run;

/*Foward*/
proc logistic data=data;
	model target_bin(event="1")=previous_qualification_grade admission_grade displaced debtor tuition_fees_up_to_date gender 
	scholarship_holder curricular_units_1st_sem_grade curricular_units_2nd_sem_grade age_lt20 age_lt25_gt20 age_lt30_gt25
	mother_occupation_grp168 mother_occupation_grp2357 mother_occupation_grp4910
	father_occupation_grp124 father_occupation_grp3568 father_occupation_grp7 father_occupation_grp910
	single app_phase app_older23 app_inter student_secondary_edu student_higher_edu mother_secondary_edu 
	mother_higher_edu father_secondary_edu father_higher_edu "1st_sem_approved_all_enrolled"n "2nd_sem_approved_all_enrolled"n 
	"1st_5_enrolled"n	"1st_6_enrolled"n "1st_7_enrolled"n "1st_gt_7_enrolled"n "2nd_5_enrolled"n "2nd_6_enrolled"n
	"2nd_7_enrolled"n "2nd_8_enrolled"n "2nd_gt_8_enrolled"n CU1sem_Eval1grp_678 CU1sem_Eval1grp_lt6 CU1sem_approv1grp_5 
	CU1sem_approv1grp_lt5 CU2sem_Eval1grp_679 CU2sem_Eval1grp_8 CU2sem_Eval1grp_lt6 CU2sem_approv1grp_5 CU2sem_approv1grp_0 CU2sem_approv1grp_1234
 	cu1sem_credit cu2sem_credit	Course_33 Course_171 Course_9003 Course_9070 Course_9085 Course_9119 Course_9130 Course_9147_9670 Course_9238_8014 
 	Course_9254 Course_9500 Course_9556 Course_9773 Course_9853 unemployment_rate inflation_rate gdp / selection=forward;
run;

/* After selection method */

proc logistic data=data;
	model target_bin(event="1")=curricular_units_2nd_sem_grade tuition_fees_up_to_date "2nd_sem_approved_all_enrolled"n CU1sem_approv1grp_5 
	CU1sem_approv1grp_lt5 app_phase app_older23 app_inter scholarship_holder Course_33 Course_171 Course_9003 Course_9070 Course_9085 
	Course_9119 Course_9130 Course_9147_9670 Course_9238_8014 Course_9254 Course_9500 Course_9556 Course_9773 Course_9853 gender 
	CU2sem_Eval1grp_679 CU2sem_Eval1grp_8 CU2sem_Eval1grp_lt6 CU2sem_approv1grp_5 CU2sem_approv1grp_0 CU2sem_approv1grp_1234 "2nd_5_enrolled"n "2nd_6_enrolled"n
	"2nd_7_enrolled"n "2nd_8_enrolled"n "2nd_gt_8_enrolled"n age_lt20 age_lt25_gt20 age_lt30_gt25 father_occupation_grp124 
	father_occupation_grp3568 father_occupation_grp7 father_occupation_grp910 unemployment_rate displaced debtor;
run;

/*Stepwise*/
proc logistic data=data;
	model target_bin(event="1")=previous_qualification_grade admission_grade displaced debtor tuition_fees_up_to_date gender 
	scholarship_holder curricular_units_1st_sem_grade curricular_units_2nd_sem_grade age_lt20 age_lt25_gt20 age_lt30_gt25
	mother_occupation_grp168 mother_occupation_grp2357 mother_occupation_grp4910
	father_occupation_grp124 father_occupation_grp3568 father_occupation_grp7 father_occupation_grp910
	single app_phase app_older23 app_inter student_secondary_edu student_higher_edu mother_secondary_edu 
	mother_higher_edu father_secondary_edu father_higher_edu "1st_sem_approved_all_enrolled"n "2nd_sem_approved_all_enrolled"n 
	"1st_5_enrolled"n	"1st_6_enrolled"n "1st_7_enrolled"n "1st_gt_7_enrolled"n "2nd_5_enrolled"n "2nd_6_enrolled"n
	"2nd_7_enrolled"n "2nd_8_enrolled"n "2nd_gt_8_enrolled"n CU1sem_Eval1grp_678 CU1sem_Eval1grp_lt6 CU1sem_approv1grp_5 
	CU1sem_approv1grp_lt5 CU2sem_Eval1grp_679 CU2sem_Eval1grp_8 CU2sem_Eval1grp_lt6 CU2sem_approv1grp_5 CU2sem_approv1grp_0 CU2sem_approv1grp_1234
 	cu1sem_credit cu2sem_credit	Course_33 Course_171 Course_9003 Course_9070 Course_9085 Course_9119 Course_9130 Course_9147_9670 Course_9238_8014 
 	Course_9254 Course_9500 Course_9556 Course_9773 Course_9853 unemployment_rate inflation_rate gdp / selection=stepwise;
run;

/* After selection method */

proc logistic data=data;
	model target_bin(event="1")=curricular_units_2nd_sem_grade tuition_fees_up_to_date "2nd_sem_approved_all_enrolled"n CU1sem_approv1grp_5 
	CU1sem_approv1grp_lt5 app_phase app_older23 app_inter scholarship_holder Course_33 Course_171 Course_9003 Course_9070 Course_9085 
	Course_9119 Course_9130 Course_9147_9670 Course_9238_8014 Course_9254 Course_9500 Course_9556 Course_9773 Course_9853 gender 
	CU2sem_Eval1grp_679 CU2sem_Eval1grp_8 CU2sem_Eval1grp_lt6 CU2sem_approv1grp_5 CU2sem_approv1grp_0 CU2sem_approv1grp_1234 "2nd_5_enrolled"n "2nd_6_enrolled"n
	"2nd_7_enrolled"n "2nd_8_enrolled"n "2nd_gt_8_enrolled"n age_lt20 age_lt25_gt20 age_lt30_gt25 father_occupation_grp124 
	father_occupation_grp3568 father_occupation_grp7 father_occupation_grp910 unemployment_rate displaced debtor;
run;

/*Score*/
proc logistic data=data;
	model target_bin(event="1")=previous_qualification_grade admission_grade displaced debtor tuition_fees_up_to_date gender 
	scholarship_holder curricular_units_1st_sem_grade curricular_units_2nd_sem_grade age_lt20 age_lt25_gt20 age_lt30_gt25
	mother_occupation_grp168 mother_occupation_grp2357 mother_occupation_grp4910 
	father_occupation_grp124 father_occupation_grp3568 father_occupation_grp7 father_occupation_grp910
	single app_phase app_older23 app_inter student_secondary_edu student_higher_edu mother_secondary_edu 
	mother_higher_edu father_secondary_edu father_higher_edu "1st_sem_approved_all_enrolled"n "2nd_sem_approved_all_enrolled"n 
	"1st_5_enrolled"n "1st_6_enrolled"n "1st_7_enrolled"n "1st_gt_7_enrolled"n "2nd_5_enrolled"n "2nd_6_enrolled"n
	"2nd_7_enrolled"n "2nd_8_enrolled"n "2nd_gt_8_enrolled"n CU1sem_Eval1grp_678 CU1sem_Eval1grp_lt6 CU1sem_approv1grp_5 
	CU1sem_approv1grp_lt5 CU2sem_Eval1grp_679 CU2sem_Eval1grp_8 CU2sem_Eval1grp_lt6 CU2sem_approv1grp_5 CU2sem_approv1grp_0 CU2sem_approv1grp_1234
 	cu1sem_credit cu2sem_credit	Course_33 Course_171 Course_9003 Course_9070 Course_9085 Course_9119 Course_9130 Course_9147_9670 Course_9238_8014 
 	Course_9254 Course_9500 Course_9556 Course_9773 Course_9853 unemployment_rate inflation_rate gdp/ selection=score;
run;

/* 
   Disclaimer, We cannot use this selection method because we have to many variables and the way it works is that it provides
   the full conbination of the variables (incrementally adding variables) with the Chi Score for each one of them so it eould be basically calculating the Score 
   for( i=1; i++; i<=total_number_variables ) {C = i Combinations total_number_variables; calculate Chi Score for each C}
   That for our copious variables, is a lot and the SAS server will not run it.
 */


/* CART Entropy */
proc hpsplit data=data;

	class target_bin course displaced debtor tuition_fees_up_to_date gender scholarship_holder father_occupation mother_occupation 
	single amode pquali fquali mquali "1st_sem_approved_all_enrolled"n "2nd_sem_approved_all_enrolled"n 
	cu1sem_enroll cu1sem_credit cu2sem_credit cu2sem_enroll age CU1sem_Eval1 CU1sem_approv1 CU2sem_Eval1 CU2sem_approv1;
	
	model target_bin(event="1")=previous_qualification_grade admission_grade curricular_units_1st_sem_grade 
	curricular_units_2nd_sem_grade unemployment_rate inflation_rate gdp course displaced debtor 
	tuition_fees_up_to_date gender scholarship_holder father_occupation mother_occupation 
	single amode pquali fquali mquali "1st_sem_approved_all_enrolled"n "2nd_sem_approved_all_enrolled"n 
	cu1sem_enroll cu1sem_credit cu2sem_credit cu2sem_enroll age CU1sem_Eval1 CU1sem_approv1 CU2sem_Eval1 CU2sem_approv1;
	
	grow entropy;
	prune cc;
	
run;

/* Using only the variables of the importance table */

proc hpsplit data=data;

	class target_bin course tuition_fees_up_to_date gender scholarship_holder father_occupation mother_occupation fquali
	"2nd_sem_approved_all_enrolled"n cu1sem_enroll cu2sem_credit cu2sem_enroll age CU1sem_approv1 CU2sem_approv1;
	
	model target_bin(event="1")=previous_qualification_grade admission_grade curricular_units_2nd_sem_grade unemployment_rate 
	inflation_rate gdp course tuition_fees_up_to_date gender scholarship_holder father_occupation mother_occupation fquali
	"2nd_sem_approved_all_enrolled"n cu1sem_enroll cu2sem_credit cu2sem_enroll age CU1sem_approv1 CU2sem_approv1;
	
	grow entropy;
	prune cc;
	
run;

/* CART Gini */
proc hpsplit data=data;

	class target_bin course displaced debtor tuition_fees_up_to_date gender scholarship_holder father_occupation mother_occupation 
	single amode pquali fquali mquali "1st_sem_approved_all_enrolled"n "2nd_sem_approved_all_enrolled"n 
	cu1sem_enroll cu1sem_credit cu2sem_credit cu2sem_enroll age CU1sem_Eval1 CU1sem_approv1 CU2sem_Eval1 CU2sem_approv1;
	
	model target_bin(event="1")=previous_qualification_grade admission_grade curricular_units_1st_sem_grade 
	curricular_units_2nd_sem_grade unemployment_rate inflation_rate gdp course displaced debtor 
	tuition_fees_up_to_date gender scholarship_holder father_occupation mother_occupation 
	single amode pquali fquali mquali "1st_sem_approved_all_enrolled"n "2nd_sem_approved_all_enrolled"n 
	cu1sem_enroll cu1sem_credit cu2sem_credit cu2sem_enroll age CU1sem_Eval1 CU1sem_approv1 CU2sem_Eval1 CU2sem_approv1;
	
	grow gini;
	prune cc;
	
run;

/* Using only the variables of the importance table */

proc hpsplit data=data;

	class target_bin course tuition_fees_up_to_date father_occupation mother_occupation amode "1st_sem_approved_all_enrolled"n 
	"2nd_sem_approved_all_enrolled"n cu2sem_enroll age CU1sem_approv1 CU2sem_approv1;
	
	model target_bin(event="1")=previous_qualification_grade admission_grade curricular_units_2nd_sem_grade unemployment_rate gdp course
	tuition_fees_up_to_date father_occupation mother_occupation amode "1st_sem_approved_all_enrolled"n "2nd_sem_approved_all_enrolled"n 
	cu2sem_enroll age CU1sem_approv1 CU2sem_approv1;
	
	grow gini;
	prune cc;
	
run;