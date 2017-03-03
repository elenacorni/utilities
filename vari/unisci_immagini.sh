rm -rf imgBiGm/
mkdir  tmpImg/  imgBiGm/

###
echo " "
echo "All images will be saved in 'imgBiGm/' dir."
echo " "
echo "## Section 1: Farming (monviso)"
montage monviso/expsup-farming-1.png  monviso/expsup-farming-2.png   -tile 1x2  -geometry +1+1  imgBiGm/utilizzo_farming.png

########################################################################################################

echo "------------------------------------"
echo "## Section 2: Storage (grafana)"
echo "  > LHC..."
montage grafana/Storage/Disk_usage_LHC/alice.png  -title 'ALICE'  -geometry +2+2  tmpImg/disk_alice.png
montage grafana/Storage/Disk_usage_LHC/atlas.png  -title 'ATLAS'  -geometry +2+2  tmpImg/disk_atlas.png
montage tmpImg/disk_alice.png  tmpImg/disk_atlas.png   -tile 1x2  -geometry +1+1  imgBiGm/disk_usage_alice_atlas.png

montage grafana/Storage/Disk_usage_LHC/cms.png  -title 'CMS'  -geometry +2+2  tmpImg/disk_cms.png
montage grafana/Storage/Disk_usage_LHC/lhcb.png -title 'LHCB' -geometry +2+2  tmpImg/disk_lhcb.png
montage tmpImg/disk_cms.png  tmpImg/disk_lhcb.png   -tile 1x2  -geometry +1+1  imgBiGm/disk_usage_cms_lhcb.png

echo "  > NO-LHC..."
montage grafana/Storage/Disk_usage_noLHC/ams.png  grafana/Storage/Disk_usage_noLHC/argo.png grafana/Storage/Disk_usage_noLHC/auger.png grafana/Storage/Disk_usage_noLHC/belle2.png grafana/Storage/Disk_usage_noLHC/borexino.png grafana/Storage/Disk_usage_noLHC/cosmo.png grafana/Storage/Disk_usage_noLHC/cta.png grafana/Storage/Disk_usage_noLHC/cuore.png  -tile 2x4  -geometry +2+2  imgBiGm/disk_usage_noLHC1.png

montage grafana/Storage/Disk_usage_noLHC/cupid.png  grafana/Storage/Disk_usage_noLHC/dampe.png grafana/Storage/Disk_usage_noLHC/darkside.png grafana/Storage/Disk_usage_noLHC/famu.png grafana/Storage/Disk_usage_noLHC/gerda.png grafana/Storage/Disk_usage_noLHC/glast.png grafana/Storage/Disk_usage_noLHC/juno.png grafana/Storage/Disk_usage_noLHC/km3.png grafana/Storage/Disk_usage_noLHC/lhaaso.png grafana/Storage/Disk_usage_noLHC/lhcf.png -tile 2x5  -geometry +2+2  imgBiGm/disk_usage_noLHC2.png

montage grafana/Storage/Disk_usage_noLHC/magic.png  grafana/Storage/Disk_usage_noLHC/na62.png grafana/Storage/Disk_usage_noLHC/opera.png grafana/Storage/Disk_usage_noLHC/pamela.png grafana/Storage/Disk_usage_noLHC/panda.png grafana/Storage/Disk_usage_noLHC/virgo.png grafana/Storage/Disk_usage_noLHC/xenon.png   -tile 2x4  -geometry +2+2  imgBiGm/disk_usage_noLHC3.png

########################################################################################################

echo "------------------------------------"
echo "## Section 3.2: Av/Rel LHC"
montage AR/Availability_Alice_Historical.png  AR/Reliability_Alice_Historical.png  -tile 1x2  -geometry +2+2  imgBiGm/avail_reliab_alice.png
montage AR/Availability_Atlas_Historical.png  AR/Reliability_Atlas_Historical.png  -tile 1x2  -geometry +2+2  imgBiGm/avail_reliab_atlas.png
montage AR/Availability_Cms_Historical.png    AR/Reliability_Cms_Historical.png    -tile 1x2  -geometry +2+2  imgBiGm/avail_reliab_cms.png
montage AR/Availability_LHCb_Historical.png   AR/Reliability_LHCb_Historical.png   -tile 1x2  -geometry +2+2  imgBiGm/avail_reliab_lhcb.png

########################################################################################################

echo "------------------------------------"
echo "## Sections 5-6-7-8: farmPlotsUtil LHC"
echo "  > alice..."
montage farmPlotsUtil/img/alice_jobs.png  farmPlotsUtil/img/alice_eff.png   -tile 1x2  -geometry +1+1  imgBiGm/farmPlotsUtil_alice.png

echo "  > atlas..."
montage farmPlotsUtil/img/atlas_jobs.png  farmPlotsUtil/img/atlas_eff.png   -tile 1x2  -geometry +1+1  imgBiGm/farmPlotsUtil_atlas.png
montage farmPlotsUtil/img/atlas_mcore_jobs.png  farmPlotsUtil/img/atlas_mcore_eff.png   -tile 1x2  -geometry +1+1  imgBiGm/farmPlotsUtil_atlas_mcore.png
montage farmPlotsUtil/img/atlas_himem_jobs.png  farmPlotsUtil/img/atlas_himem_eff.png   -tile 1x2  -geometry +1+1  imgBiGm/farmPlotsUtil_atlas_himem.png

echo "  > cms..."
montage farmPlotsUtil/img/cms_jobs.png  farmPlotsUtil/img/cms_eff.png   -tile 1x2  -geometry +1+1  imgBiGm/farmPlotsUtil_cms_singlecore.png
montage farmPlotsUtil/img/cms_mcore_jobs.png  farmPlotsUtil/img/cms_mcore_eff.png   -tile 1x2  -geometry +1+1  imgBiGm/farmPlotsUtil_cms_multicore.png

echo "  > lhcb..."
montage farmPlotsUtil/img/lhcb_jobs.png  farmPlotsUtil/img/lhcb_eff.png   -tile 1x2  -geometry +1+1  imgBiGm/farmPlotsUtil_lhcb.png

########################################################################################################

echo "------------------------------------"
echo "## Sections 9-10: farmPlotsUtil NO-LHC"
echo "  > ams..."
montage farmPlotsUtil/img/ams_jobs.png        farmPlotsUtil/img/ams_eff.png        -title 'Coda AMS'       -geometry +2+2  tmpImg/ams.png
montage farmPlotsUtil/img/ams_prod_jobs.png   farmPlotsUtil/img/ams_prod_eff.png   -title 'Coda AMS_PROD'  -geometry +2+2  tmpImg/ams_prod.png
montage farmPlotsUtil/img/ams_short_jobs.png  farmPlotsUtil/img/ams_short_eff.png  -title 'Coda AMS_SHORT' -geometry +2+2  tmpImg/ams_short.png

montage tmpImg/ams.png  tmpImg/ams_prod.png  tmpImg/ams_short.png  -tile 1x3  -geometry +1+1  imgBiGm/farmPlotsUtil_g2_ams.png

echo "  > argo..."
montage farmPlotsUtil/img/argo_jobs.png  farmPlotsUtil/img/argo_eff.png  -geometry +2+2  imgBiGm/farmPlotsUtil_g2_argo.png

echo "  > auger..."
montage farmPlotsUtil/img/auger_jobs.png               farmPlotsUtil/img/auger_eff.png          -title 'Coda AUGER'         -geometry +2+2  tmpImg/auger.png
montage farmPlotsUtil/img/auger_hm_long_jobs.png  farmPlotsUtil/img/auger_hm_long_eff.png  -title 'Coda AUGER_HM_LONG' -geometry +2+2  tmpImg/auger_hm_long.png
montage tmpImg/auger.png  tmpImg/auger_hm_long.png  -tile 1x2  -geometry +1+1  imgBiGm/farmPlotsUtil_g2_auger.png

echo "  > belle..."
montage farmPlotsUtil/img/belle_jobs.png   farmPlotsUtil/img/belle_eff.png  -geometry +2+2  imgBiGm/farmPlotsUtil_g2_belle.png

echo "  > borexino..."
montage farmPlotsUtil/img/borexino_physics_jobs.png   farmPlotsUtil/img/borexino_physics_eff.png  -title 'Coda BOREXINO_PHYSICS'  -geometry +2+2  tmpImg/borpy.png
montage farmPlotsUtil/img/borexino_prod_jobs.png      farmPlotsUtil/img/borexino_prod_eff.png     -title 'Coda BOREXINO_PROD'     -geometry +2+2  tmpImg/borprod.png
montage farmPlotsUtil/img/borexino_run_jobs.png       farmPlotsUtil/img/borexino_run_eff.png      -title 'Coda BOREXINO_RUN'      -geometry +2+2  tmpImg/borRun.png
montage tmpImg/borpy.png  tmpImg/borprod.png  tmpImg/borRun.png  -tile 1x3  -geometry +1+1  imgBiGm/farmPlotsUtil_g2_borexino.png

echo "  > cdf..."
montage farmPlotsUtil/img/cdf_jobs.png   farmPlotsUtil/img/cdf_eff.png  -geometry +2+2  imgBiGm/farmPlotsUtil_g2_cdf.png

echo "  > cta..."
montage farmPlotsUtil/img/cta_jobs.png  farmPlotsUtil/img/cta_eff.png  -geometry +2+2  imgBiGm/farmPlotsUtil_g2_cta.png

echo "  > cuore..."
montage farmPlotsUtil/img/cuore_jobs.png  farmPlotsUtil/img/cuore_eff.png  -geometry +2+2  imgBiGm/farmPlotsUtil_g2_cuore.png

echo "  > cupid..."
montage farmPlotsUtil/img/cupid_jobs.png  farmPlotsUtil/img/cupid_eff.png  -geometry +2+2  imgBiGm/farmPlotsUtil_g2_cupid.png

echo "  > darkside..."
montage farmPlotsUtil/img/darkside_jobs.png  farmPlotsUtil/img/darkside_eff.png  -geometry +2+2  imgBiGm/farmPlotsUtil_g2_darkside.png

echo "  > gerda..."
montage farmPlotsUtil/img/gerda_jobs.png   farmPlotsUtil/img/gerda_eff.png  -geometry +2+2  imgBiGm/farmPlotsUtil_g2_gerda.png

echo "  > glast..."
montage farmPlotsUtil/img/glast_jobs.png   farmPlotsUtil/img/glast_eff.png  -geometry +2+2  imgBiGm/farmPlotsUtil_g2_fermi_glast.png

echo "  > icarus..."
montage farmPlotsUtil/img/icarus_jobs.png   farmPlotsUtil/img/icarus_eff.png  -geometry +2+2  imgBiGm/farmPlotsUtil_g2_icarus.png

echo "  > juno..."
montage farmPlotsUtil/img/juno_jobs.png   farmPlotsUtil/img/juno_eff.png  -geometry +2+2  imgBiGm/farmPlotsUtil_g2_juno.png

echo "  > lhaaso..."
montage farmPlotsUtil/img/lhaaso_jobs.png   farmPlotsUtil/img/lhaaso_eff.png  -geometry +2+2  imgBiGm/farmPlotsUtil_g2_lhaaso.png

echo "  > lhcf..."
montage farmPlotsUtil/img/lhcf_jobs.png   farmPlotsUtil/img/lhcf_eff.png  -geometry +2+2  imgBiGm/farmPlotsUtil_g2_lhcf.png

echo "  > magic..."
montage farmPlotsUtil/img/magic_jobs.png   farmPlotsUtil/img/magic_eff.png  -geometry +2+2  imgBiGm/farmPlotsUtil_g2_magic.png

echo "  > na62..."
montage farmPlotsUtil/img/na62_jobs.png   farmPlotsUtil/img/na62_eff.png  -geometry +2+2  imgBiGm/farmPlotsUtil_g2_na62.png

echo "  > opera..."
montage farmPlotsUtil/img/opera_jobs.png   farmPlotsUtil/img/opera_eff.png  -geometry +2+2  imgBiGm/farmPlotsUtil_g2_opera.png

echo "  > pamela..."
montage farmPlotsUtil/img/pamela_jobs.png   farmPlotsUtil/img/pamela_eff.png  -geometry +2+2  imgBiGm/farmPlotsUtil_g2_pamela.png

echo "  > panda..."
montage farmPlotsUtil/img/panda_jobs.png   farmPlotsUtil/img/panda_eff.png  -geometry +2+2  imgBiGm/farmPlotsUtil_g2_panda.png

echo "  > theophys..."
montage farmPlotsUtil/img/theophys_jobs.png   farmPlotsUtil/img/theophys_eff.png  -geometry +2+2  imgBiGm/farmPlotsUtil_g2_theophys.png

echo "  > virgo..."
montage farmPlotsUtil/img/virgo_jobs.png   farmPlotsUtil/img/virgo_eff.png  -geometry +2+2  imgBiGm/farmPlotsUtil_g2_virgo.png

echo "  > xenon..."
montage farmPlotsUtil/img/xenon_jobs.png   farmPlotsUtil/img/xenon_eff.png  -geometry +2+2  imgBiGm/farmPlotsUtil_g2_xenon.png

echo " "
echo "Done."
echo " "
########################################################################################################

rm -rf tmpImg/
