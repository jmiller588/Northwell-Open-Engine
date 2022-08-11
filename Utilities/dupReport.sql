select
	pc.person_combine_id
	, pa.person_alias_id
	, p2.name_full_formatted as "Patient Name"
	--, omf_get_cv_display(p2.sex_cd) as "Patient Sex"
	, p2.birth_dt_tm as "Date of Birth"
	, pa.alias as "Patient Identifier"
	--, omf_get_cv_display(pa.alias_pool_cd) as "Alias Pool"
	, pa1.person_id as "From person_id"
	, pa2.person_id as "To person_id"
	, pc.cmb_dt_tm as "Combine Date/Time"

FROM 
	person_combine pc
	, person_aborh pa1
	, person_aborh pa2
	, person p1
	, person p2
	, person_alias pa
	
where pc.cmb_dt_tm > TRUNC(SYSDATE) - 1
and pa1.person_id = pc.from_person_id
and pa2.person_id = pc.to_person_id
--and (pa1.abo_cd != pa2.abo_cd or pa1.rh_cd != pa2.rh_cd)
and p1.person_id = pc.from_person_id
and p2.person_id = pc.to_person_id
and pa.person_id = pc.to_person_id
--and pa.person_alias_type_cd in (10,18)
and pa.active_ind = 1
--and pa.end_effective_dt_tm > TRUNC(SYSDATE)