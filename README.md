# CREAZIONE REPORT EXP SUPP CDG:

### Nel repository:
- `report.tex`: main .tex per genereare l'intero report
- `ticket.tex`	: .tex per generare le due tabelle dei ticket		(Sezione 4)
- `alice/`	: cartella contenente i file per esperimento ALICE 	(Sezione 5)
- `atlas/`	: cartella contenente i file per esperimento ATLAS 	(Sezione 6)
- `cms/`	: cartella contenente i file per esperimento CMS   	(Sezione 7)
- `lhcb/`	: cartella contenente i file per esperimento LHCb  	(Sezione 8)
- `scripts/`    : cartella contenente tutti gli script per generare le immagini comuni
- `common_img/` : cartella contenente tutte le immagini comuni
- `AR.ods`	: file excel per generare grafici Sezione 3

---
### Creazione del Report:

- **SEZIONE 1: Utilizzo delle risorse - Farming**  
  Scaricare immagini  
  https://monviso.cnaf.infn.it/expFarming.php  
  Salvarle nella cartella `monviso/` (da creare).  
  Nomi img:
  * `expsup-farming-1`
  * `expsup-farming-2`

- **SEZIONE 3: Availability and Reliability**  
  Scaricare immagini e dati  
  https://espace.cern.ch/WLCG-document-repository/ReliabilityAvailability/Forms/AllItems.aspx?RootFolder=%2FWLCG-document-repository%2FReliabilityAvailability%2F2014&amp  
  [anno-corrente] (es.2017) > [mese-piu-recente] (es.01-17) > WLCG_Tier1_VO_[exp]  
  Cercare il sito e prendere le due immagini per avail e reliab. Salvarle nella cartella `AR/` (da creare).  
  Nomi img:
  * `Alice_Availability.png`
  * `Alice_Reliability.png`
  * `Atlas_Availability.png`
  * `Atlas_Reliability.png`
  * `Cms_Availability.png`
  * `Cms_Reliability.png`
  * `LHCb_Availability.png`
  * `LHCb_Reliability.png`

  Annotarsi l'average tot e avavil/reliab del CNAF nelle tabelle rispettive.  
  File `AR.ods`: aggiungere alle rispettive tabelle i dati appena presi.  
  Aggiornare il grafico e salvare le due immagini nella certella `AR/`.  
  Nomi plot:
  * `Availability_Alice_Historical.png`
  * `Availability_Atlas_Historical.png`
  * `Availability_Cms_Historical.png`
  * `Availability_LHCb_Historical.png`
  * `Reliability_Alice_Historical.png`
  * `Reliability_Atlas_Historical.png`
  * `Reliability_Cms_Historical.png`
  * `Reliability_LHCb_Historical.png`

- **SEZIONI 2, 3 e parti comuni delle SEZIONI EXP**  
  Generare tutte le immagini comuni lanciando lo script `common_img.sh` nella cartella `scripts/`  
  con la seguente sintassi:  
  `./common_img.sh [start-date] [end-date]  -  nel formato: YYYY-MM-GG` 

  **!!ATTENZIONE!!**  
  Questo script lancia lo script python (`plots_farmPlotsUtil_and_grafana_disk.py`) che scarica tutte le immagini salvandole nelle cartelle `grafana/` e `farmPlotsUtil/`.  
  Successivamente unisce (utilizzando il comando `montage`[1]) in un'unica immagine tutte quelle che possono essere accorpate (dalle cartelle:
  `AR/`, `monviso/`, `grafana/`, `farmPlotsUtil/`) diminuendo significativamente il numero totale di file (n.max di file caricati su overleaf = 60!).  
  Diventa **OBBIGATORIO**, quindi, **AVER ESEGUITO I PRIMI DUE PUNTI PRIMA** di far partire questo script, pena errore d'esecuzione per cartelle non trovate.

- **SEZIONE 2.3: Consistenza CNAF vs EXP**  
  Ogni sezione viene compilata dall'esperimento.[2]  
  (Per accorpare le immagini guardare i comandi nella sezione [1])

- **SEZIONE 4: Tickets**  
  Creare i file `file.crt.pem` e `file.key.pem` nella cartella `scripts/` con i comandi:
  ```
  openssl pkcs12 -in <file.p12> -out file.crt.pem -clcerts -nokeys
  openssl pkcs12 -in <file.p12> -out file.key.pem -nocerts -nodes
  ```
  Controllare la versione di 'awk' con il comando:
  ```
  awk -W version
  # dovrebbe essere almeno la 4.0, per aggiornarla:
  sudo apt-get install gawk
  ```
  Generare il file `ticket.tex` lanciando lo script `ticket.sh` (nella cartella `scripts/`) con la seguente sintassi:  
  `./ticket.sh [start-date] [end_date]  -- format YYYY-MM-GG`  
  Cancellare `file.crt.pem` e `file.key.pem`.

- **SEZIONI EXP:**
  Tutte le immagini oltre a quelle generate in precedenza vengono fornite dal referente dell'esperimento.

---
### [1] Piccolo man del comando 'montage' (utile nel caso gli esperimenti volessero accorpare immaigni):

Il comando `montage` si trova nel pacchetto `imagemagick`:
```
sudo apt-get install build-essential
sudo apt-get install imagemagick
```
Sintassi:  
`montage [immagini-di-partenza] [opzioni] [immaigne-di-output]`  

Tra tutte le [opzioni] quelle che sono state usate nello script `unisci_immagini.sh` sono:  
	*-title [TITOLO]*	: si aggiunge un titolo (centrato in alto) alla figura di output  
	*-tile  [COLxROW]* : si organizza l'immagine come una matrice di dim nCOL x nROW  
	*-geometry [XXX]*		: definisce le dimensioni delle singole immagini e la distanza tra di loro.  

Guide:  
http://www.imagemagick.org/Usage/montage/  
https://www.imagemagick.org/script/montage.php  

		
Al fine di minimizzare il numero totale di immagini, visto il limite a 60 file per progetto su overleaf,
di seguito vengono dati alcuni suggerimenti su come si potrebbero accorpare alcune immagini per le sezioni dedicate 
agli esperimenti:

**a. ALICE**  
img:  
- `ALICEtape.png`
- `FTDalice.png`

Script:
```
montage ALICEtape.png FTDalice.png -tile 1x2 -geometry +1+1 alice_tape.png
rm ALICEtape.png FTDalice.png
```

**b. ATLAS**  
img:  
- `all-infn.png`
- `all-t1.png`
- `atlasdisk0.png`
- `atlasdisk1.png`
- `atlastape0.png`
- `atlastape1.png`
- `infn-all.png`
- `t0-infn.png`
- `t0-t1.png`
- `t1-all.png`

Script:
```
montage t0-t1.png    -pointsize 20  -title 'T0 -> T1'      -geometry +1+1  tmp_t0-t1.png
montage t0-infn.png  -pointsize 20  -title 'T0 -> INFN-T1' -geometry +1+1  tmp_t0-infn.png
montage tmp_t0-t1.png  tmp_t0-infn.png  -tile 2x1 -geometry +1+1 t0_export.png

montage t1-all.png   -pointsize 20  -title 'T1 -> All'      -geometry +1+1  tmp_t1-all.png
montage infn-all.png -pointsize 20  -title 'INFN-T1 -> All' -geometry +1+1  tmp_infn-all.png
montage all-t1.png   -pointsize 20  -title 'All -> T1'	    -geometry +1+1  tmp_all-t1.png
montage all-infn.png -pointsize 20  -title 'All -> INFN-T1' -geometry +1+1  tmp_all-infn.png
montage tmp_t1-all.png tmp_infn-all.png tmp_all-t1.png tmp_all-infn.png -tile 2x2 -geometry +1+1 atlas_throughput.png

montage atlasdisk0.png atlasdisk1.png -tile 2x1 -geometry +1+1 disco_atlas.png
montage atlastape0.png atlastape1.png -tile 2x1 -geometry +1+1 tape_atlas.png

rm tmp_t0-t1.png tmp_t0-infn.png
rm tmp_t1-all.png tmp_infn-all.png tmp_all-t1.png tmp_all-infn.png
rm atlastape0.png atlastape1.png
rm atlasdisk0.png atlasdisk1.png
rm all-infn.png all-t1.png infn-all.png t1-all.png
rm t0-infn.png t0-t1.png
```

**c. CMS**  
img:  
- `Availability.png`
- `Phedex_qPlot_All2Cnaf.png`
- `Phedex_qPlot_Cnaf2All.png`
- `Phedex_trVol_All2Cnaf.png`
- `Phedex_trVol_Cnaf2All.png`
- `Readiness1.png`
- `Readiness2.png`
- `jobs4activ.png`
- `jobs4sites.png`

Script:
```
montage jobs4sites.png -title 'Completed jobs per site' -geometry +1+1 tmp_jobs4sites.png
montage jobs4activ.png -title 'Completed jobs per activity' -geometry +1+1 tmp_jobs4activ.png
montage tmp_jobs4sites.png tmp_jobs4activ.png -tile 1x2 -geometry +1+1 completed_jobs_status.png
montage Readiness1.png Readiness2.png -tile 1x2 -geometry +1+1 site_readiness.png

rm tmp_jobs4activ.png  tmp_jobs4sites.png
rm Readiness1.png      Readiness2.png
rm jobs4activ.png      jobs4sites.png
```

**d. LHCb**  
img:  
- `JobTypes.png`
- `Sites.png`
- `Throughput_By_Source.png`
- `throughput.png`

Script:
```
montage throughput.png Throughput_By_Source.png -pointsize 20 -title 'Throughput by Dest/Source' -tile 1x2 -geometry +1+1 throughput_lhcb.png
montage JobTypes.png Sites.png -pointsize 20 -title 'CPU days used by JobTypes and Site' -tile 1x2 -geometry +1+1 cpu_used_lhcb.png

rm Throughput_By_Source.png JobTypes.png Sites.png throughput.png 
```
---
### [2] Calcolo consistenza (nel caso un referente non potesse aggiornare la tabella):

**a. ALICE** 
- Local:  http://www.cnaf.infn.it/~vladimir/gpfs.html
```
@ Buffer: tab.: gpfs_tsm_alice > Used (tot.)  
                +  
@ Disk: tab.: gpfs_alice > Used (tot.)  
```
- Catalogo: http://alimonitor.cern.ch/stats?page=SE/table
```
@ Buffer: tab.: Tape storage elements > riga: CNAF - TAPE  > colonna: Xrootd info - Used  
                                        +  
@ Disk: tab.: Disk storage elements > riga: CNAF - SE > colonna: Xrootd info - Used  
```
Oppure:  
http://alimonitor.cern.ch/stats?submit_plot=Plot&page=SE%2Ftable&filter_0=CNAF&filter_0_0=&filter_0_1=&filter_0_2=&filter_0_3=&filter_0_4=&filter_0_5=&filter_0_6=&filter_0_7=&filter_0_8=&filter_0_9=&filter_0_10=&filter_0_11=&filter_0_12=&filter_0_13=&filter_0_14=&filter_0_15=&filter_0_16=&filter_0_17=&filter_0_18=&filter_1=CNAF&filter_1_0=&filter_1_1=&filter_1_2=&filter_1_3=&filter_1_4=&filter_1_5=&filter_1_6=&filter_1_7=&filter_1_8=&filter_1_9=&filter_1_10=&filter_1_11=&filter_1_12=&filter_1_13=&filter_1_14=&filter_1_15=&filter_1_16=&filter_1_17=&filter_1_18=  
Uso disco nel catalogo ottiene sommando i numeri "Used" secondo questa formula:  
```
( <disk>(PB) + <tape>(TB!!)/1024)  * 1.024 * 1.024 * 1.024 * 1.024 * 1.024 = <TOT> PB

es. ( 3.321 + 366.7/1024)  * 1.024 * 1.024 * 1.024 * 1.024 * 1.024 = 4.14 PB 
```
ALICE riporta in base 1024 e non base 1000 come al CNAF quindi per ottenere un numero confrontabile devi riscalare (per avere i PB nel sistema di accounting CNAF).  

**b. CMS**  
- Catalogo: https://cmsweb.cern.ch/phedex/prod/Reports::SiteUsage
```
@ Tape: T1_IT_CNAF_MSS (https://cmsweb.cern.ch/phedex/prod/Reports::SiteUsage?node=T1_IT_CNAF_MSS# )  
        tab.: T1_IT_CNAF_MSS Custodial Data > riga: ultima > colonna: Subscribed  
        NB: se ci sono dati nella tabella "T1_IT_CNAF_MSS Non-subscribed Data" colonna "Source", sommarlo al dato precedente.  
        
@ Disk: T1_IT_CNAF_Disk (https://cmsweb.cern.ch/phedex/prod/Reports::SiteUsage?node=T1_IT_CNAF_Disk#)  
        tab.: T1_IT_CNAF_Disk Custodial Data > riga: ultima > colonna: Subscribed (PB)  
                                         +  
        tab.: T1_IT_CNAF_Disk Non-subscribed Data > riga: ultima > colonna: Source (TB) <-- ATTENZIONE!!!
```
- Local:
```
@ Tape: https://lemon.cr.cnaf.infn.it/lemon-web/tape_metrics.html  
        tab.: PREMIGRATION > riga: CMS > colonna: Tape occ. (TB) (ATTENZIONE SONO TB!!! trasformali in PT)  
        
@ Disk: https://www.cnaf.infn.it/~vladimir/gpfs  
        tab.: cms (ds-511) > riga: Cms_disk > colonna: Used(GB) (ATTENZIONE SONO GB!!! trasformali in PT)
```
