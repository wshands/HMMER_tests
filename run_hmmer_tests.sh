#!/bin/bash

#stop the script if it attempts to use any unset variables
#set -o nounset
#stop the script if any command fails (returns non zero)
#set -o errexit

HMMER_BASE_PATH="/home/um/wshands/gitroot/hmmer"
HMMER_EXE_PATH="${HMMER_BASE_PATH}/src/"
NEW_HMMER_PATH="/home/um/wshands/gitroot/hmmer-pull-test/hmmer/src/"


TEST_OUTPUT=./test_output2
if [ -d ${TEST_OUTPUT} ]; then
    read -p  "directory ${TEST_OUTPUT} already exists; remove contents and continue? " yn
    case $yn in
      [Yy]* ) rm ${TEST_OUTPUT}/*;;
      [Nn]* ) :;;
      * ) echo "please answer yes or no";; 
    esac
else
    mkdir -p ${TEST_OUTPUT}
fi

cd ${TEST_OUTPUT}

echo "executing nhmmer test"
${HMMER_EXE_PATH}nhmmer ${HMMER_BASE_PATH}/tutorial/MADE1.hmm ${HMMER_BASE_PATH}/tutorial/dna_target.fa > nhmmerout3.1b2
${NEW_HMMER_PATH}nhmmer ${HMMER_BASE_PATH}/tutorial/MADE1.hmm ${HMMER_BASE_PATH}/tutorial/dna_target.fa > nhmmerout

diff nhmmerout nhmmerout3.1b2 > nhmmeroutdiff
if [[ -s nhmmeroutdiff ]]; then
    echo "!nhmmer differences";
    cat nhmmeroutdiff
else
    echo "nhmmer passed"
fi 

echo "executing hmmsearch test"
${HMMER_EXE_PATH}hmmsearch --tblout hmmsearchtblout3.1b2 --domtblout hmmsearchdomtblout3.1b2 ${HMMER_BASE_PATH}/tutorial/globins4.hmm  /home/um/wshands/simple-test/uniprot_sprot.fasta > hmmsearchout3.1b2

${NEW_HMMER_PATH}hmmsearch --tblout hmmsearchtblout --domtblout hmmsearchdomtblout ${HMMER_BASE_PATH}/tutorial/globins4.hmm  /home/um/wshands/simple-test/uniprot_sprot.fasta > hmmsearchout

diff hmmsearchout3.1b2 hmmsearchout > hmmsearchoutdiff
if [[ -s hmmsearchoutdiff ]]; then
    echo "!hmmsearch stdout differences";
    cat hmmsearchoutdiff
else
    echo "hmmsearch stdout passed"
fi 

diff hmmsearchtblout3.1b2 hmmsearchtblout > hmmsearchtbloutdiff
if [[ -s hmmsearchtbloutdiff ]]; then
    echo "!hmmsearch table differences"
    cat hmmsearchtbloutdiff
else
    echo "hmmsearch table passed"
fi 

diff hmmsearchdomtblout3.1b2 hmmsearchdomtblout > hmmsearchdomtbloutdiff
if [[ -s hmmsearchdomtbloutdiff ]]; then
    echo "!hmmsearch domain table differences";
    cat hmmsearchdomtbloutdiff
else
    echo "hmmsearch domain table  passed"
fi 

echo "executing nhmmscan test"
${HMMER_EXE_PATH}nhmmscan --tblout nhmmscantblout3.1b2 ${HMMER_BASE_PATH}/tutorial/MADE1.hmm ${HMMER_BASE_PATH}/tutorial/dna_target.fa > nhmmscanout3.1b2
${NEW_HMMER_PATH}nhmmscan --tblout nhmmscantblout ${HMMER_BASE_PATH}/tutorial/MADE1.hmm ${HMMER_BASE_PATH}/tutorial/dna_target.fa > nhmmscanout

diff nhmmscanout3.1b2 nhmmscanout > nhmmscanoutdiff
if [[ -s nhmmscanoutdiff ]]; then
    echo "!nhmmscan stdout differences";
    cat nhmmscanoutdiff
else
    echo "nhmmscan stdout passed"
fi 

diff nhmmscantblout3.1b2 nhmmscantblout > nhmmscantbloutdiff
if [[ -s nhmmscantbloutdiff ]]; then
    echo "!nhmmscan table differences"
    cat nhmmscantbloutdiff
else
    echo "nhmmscan table passed"
fi 

${HMMER_EXE_PATH}phmmer --tblout phmmertblout3.1b2 --domtblout phmmerdomtblout3.1b2 ${HMMER_BASE_PATH}/tutorial/HBB_HUMAN  /home/um/wshands/simple-test/uniprot_sprot.fasta > phmmerout3.1b2
${NEW_HMMER_PATH}phmmer --tblout phmmertblout --domtblout phmmerdomtblout ${HMMER_BASE_PATH}/tutorial/HBB_HUMAN  /home/um/wshands/simple-test/uniprot_sprot.fasta > phmmerout

diff phmmerout3.1b2 phmmerout > phmmeroutdiff
if [[ -s phmmeroutdiff ]]; then
    echo "!phmmer stdout differences";
    cat phmmeroutdiff
else
    echo "phmmer stdout passed"
fi 

diff phmmertblout3.1b2 phmmertblout > phmmertbloutdiff
if [[ -s phmmertbloutdiff ]]; then
    echo "!phmmer table differences"
    cat phmmertbloutdiff
else
    echo "phmmer table passed"
fi 

diff phmmerdomtblout3.1b2 phmmerdomtblout > phmmerdomtbloutdiff
if [[ -s phmmerdomtbloutdiff ]]; then
    echo "!phmmer domain table differences";
    cat phmmerdomtbloutdiff
else
    echo "phmmer domain table  passed"
fi 



${HMMER_EXE_PATH}hmmscan --tblout hmmscantblout3.1b2 --domtblout hmmscandomtblout3.1b2 ${HMMER_BASE_PATH}/tutorial/globins4.hmm  ${HMMER_BASE_PATH}/tutorial/globins45.fa > hmmscanout3.1b2
${NEW_HMMER_PATH}hmmscan --tblout hmmscantblout --domtblout hmmscandomtblout ${HMMER_BASE_PATH}/tutorial/globins4.hmm  ${HMMER_BASE_PATH}/tutorial/globins45.fa > hmmscanout


#${HMMER_EXE_PATH}hmmscan --tblout hmmscantblout3.1b2 --domtblout hmmscandomtblout3.1b2 ${HMMER_BASE_PATH}/tutorial/globins4.hmm  /home/um/wshands/simple-test/uniprot_sprot.fasta > hmmscanout3.1b2
#${NEW_HMMER_PATH}hmmscan --tblout hmmscantblout --domtblout hmmscandomtblout ${HMMER_BASE_PATH}/tutorial/globins4.hmm  /home/um/wshands/simple-test/uniprot_sprot.fasta > hmmscanout

diff hmmscanout3.1b2 hmmscanout > hmmscanoutdiff
if [[ -s hmmscanoutdiff ]]; then
    echo "!hmmscan stdout differences";
    cat hmmscanoutdiff
else
    echo "hmmscan stdout passed"
fi 

diff hmmscantblout3.1b2 hmmscantblout > hmmscantbloutdiff
if [[ -s hmmscantbloutdiff ]]; then
    echo "!hmmscan table differences"
    cat hmmscantbloutdiff
else
    echo "hmmscan table passed"
fi 

diff hmmscandomtblout3.1b2 hmmscandomtblout > hmmscandomtbloutdiff
if [[ -s hmmscandomtbloutdiff ]]; then
    echo "!hmmscan domain table differences";
    cat hmmscandomtbloutdiff
else
    echo "hmmscan domain table  passed"
fi 




${HMMER_EXE_PATH}nhmmscan ${HMMER_BASE_PATH}/tutorial/MADE1.hmm ${HMMER_BASE_PATH}/tutorial/dna_target.fa > nhmmscanhout3.1b2

${NEW_HMMER_PATH}nhmmscan ${HMMER_BASE_PATH}/tutorial/MADE1.hmm ${HMMER_BASE_PATH}/tutorial/dna_target.fa > nhmmscanout

diff nhmmscanout3.1b2 nhmmscanout > nhmmscanoutdiff
if [[ -s nhmmscanoutdiff ]]; then
    echo "!nhmmscan stdout differences";
    cat nhmmscanoutdiff
else
    echo "nhmmscan stdout passed"
fi 

#comment jackhmmer test out since it seems always to be different for each run
#if false
#then
# use -N 1 option to keep results always the same
${HMMER_EXE_PATH}jackhmmer -N 1 --tblout jackhmmertblout3.1b2 --domtblout jackhmmerdomtblout3.1b2 ${HMMER_BASE_PATH}/tutorial/HBB_HUMAN  /home/um/wshands/simple-test/uniprot_sprot.fasta > jackhmmerout3.1b2
${NEW_HMMER_PATH}jackhmmer -N 1 --tblout jackhmmertblout --domtblout jackhmmerdomtblout ${HMMER_BASE_PATH}/tutorial/HBB_HUMAN  /home/um/wshands/simple-test/uniprot_sprot.fasta > jackhmmerout

diff jackhmmerout3.1b2 jackhmmerout > jackhmmeroutdiff
if [[ -s jackhmmeroutdiff ]]; then
    echo "!jackhmmer stdout differences";
    cat jackhmmeroutdiff
else
    echo "jackhmmer stdout passed"
fi 

diff jackhmmertblout3.1b2 jackhmmertblout > jackhmmertbloutdiff
if [[ -s jackhmmertbloutdiff ]]; then
    echo "!jackhmmer table differences"
    cat jackhmmertbloutdiff
else
    echo "jackhmmer table passed"
fi 

diff jackhmmerdomtblout3.1b2 jackhmmerdomtblout > jackhmmerdomtbloutdiff
if [[ -s jackhmmerdomtbloutdiff ]]; then
    echo "!jackhmmer domain table differences";
    cat jackhmmerdomtbloutdiff
else
    echo "jackhmmer domain table  passed"
fi 

#fi

${NEW_HMMER_PATH}phmmert --tblout phmmerttblout --domtblout phmmertdomtblout ~/simple-test/pfamDNAmark-aa.2OG-FeII_Oxy_3.hmm ~/simple-test/pfamDNAmarkQ2T4K0_BURTAandE8WFE5_STRFA.fa > phmmertout
${NEW_HMMER_PATH}nhmmscant  --tblout nhmmscanttblout --domtblout  nhmmscantdomtblout ~/simple-test/pfamDNAmark-aa.2OG-FeII_Oxy_3.hmm ~/simple-test/pfamDNAmarkQ2T4K0_BURTAandE8WFE5_STRFA.fa > nhmmscantout


diff phmmertout nhmmscantout > phmmertnhmmscantoutdiff
if [[ -s phmmertnhmmscantoutdiff ]]; then
    echo "!phmmert-nhmmscant stdout differences";
    cat phmmertnhmmscantoutdiff
else
    echo "phmmert-nhmmscant stdout passed"
fi 

diff phmmerttblout nhmmscanttblout > phmmertnhmmscanttbloutdiff
if [[ -s phmmertnhmmscanttbloutdiff ]]; then
    echo "!phmmert-nhmmscant  table differences"
    cat phmmertnhmmscanttbloutdiff
else
    echo " phmmertnhmmscanttbloutdiff table passed"
fi 

diff phmmertdomtblout nhmmscantdomtblout > phmmertnhmmscantdomtbloutdiff
if [[ -s phmmertnhmmscantdomtbloutdiff ]]; then
    echo "!phmmert-nhmmscant domain table differences";
    cat phmmertnhmmscantdomtbloutdiff
else
    echo "phmmert-nhmmscant domain table  passed"
fi 

# run a master and worker for both HMMER versions that you want to compare using different ports:
#1st> hmmpgmd --master --cport 51371 --wport 51372 --ccncts 4 --seqdb uniprot_sprot.fasta.hmmpgmd
#1st> hmmpgmd --worker 127.0.0.1 --wport 51372

#1st> hmmpgmd --master --cport 51381 --wport 51382 --ccncts 4 --seqdb uniprot_sprot.fasta.hmmpgmd
#1st> hmmpgmd --worker 127.0.0.1 --wport 51382

${HMMER_EXE_PATH}hmmc2 -S -p 51371 < ../hmmpgmd_seqdb_input.txt > hmmpgmd_3.1b2_testS_out 
${NEW_HMMER_PATH}hmmc2 -S -p 51381 < ../hmmpgmd_seqdb_input.txt > hmmpgmd_new_testS_out

diff  hmmpgmd_3.1b2_testS_out hmmpgmd_new_testS_out > hmmpgmd_testS_diff
if [[ -s hmmpgmd_testS_diff ]]; then
    echo "!hmmpgmd scores stdout differences";
    cat hmmpgmd_testS_diff
else
    echo "hmmpgmd scores stdout passed"
fi 


${HMMER_EXE_PATH}hmmc2 -A -p 51371 < ../hmmpgmd_seqdb_input.txt > hmmpgmd_3.1b2_testA_out 
${NEW_HMMER_PATH}hmmc2 -A -p 51381 < ../hmmpgmd_seqdb_input.txt > hmmpgmd_new_testA_out

diff  hmmpgmd_3.1b2_testA_out hmmpgmd_new_testA_out > hmmpgmd_testA_diff
if [[ -s hmmpgmd_testA_diff ]]; then
    echo "!hmmpgmd alignments stdout differences";
    cat hmmpgmd_testA_diff
else
    echo "hmmpgmd alignments stdout passed"
fi 

#1st> hmmpgmd --master --cport 51371 --wport 51372 --ccncts 4 --hmmdb 
#1st> hmmpgmd --worker 127.0.0.1 --wport 51372

#1st> hmmpgmd --master --cport 51381 --wport 51382 --ccncts 4 --hmmdb uniprot_sprot.fasta.hmmpgmd
#1st> hmmpgmd --worker 127.0.0.1 --wport 51382


